%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
%   Center for Astronomy Signal Processing and Electronics Research           %
%   http://seti.ssl.berkeley.edu/casper/                                      %
%   Copyright (C) 2006 University of California, Berkeley                     %
%                                                                             %
%   This program is free software; you can redistribute it and/or modify      %
%   it under the terms of the GNU General Public License as published by      %
%   the Free Software Foundation; either version 2 of the License, or         %
%   (at your option) any later version.                                       %
%                                                                             %
%   This program is distributed in the hope that it will be useful,           %
%   but WITHOUT ANY WARRANTY; without even the implied warranty of            %
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the             %
%   GNU General Public License for more details.                              %
%                                                                             %
%   You should have received a copy of the GNU General Public License along   %
%   with this program; if not, write to the Free Software Foundation, Inc.,   %
%   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.               %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [time_total, time_struct] = gen_xps_files(sys,flow_vec)
% Generate all necessary file and optionally run the Xilinx backed tools

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialization
% At the end of initialization, the following variables are set:
%   run_* : 1 if that step is needed
%   xps_blks : All the blocks with tags xps:*
%   xsg_blk : Point to the Xilinx System Generator block of the system
%   xps_pcore_blks: All the pcore blocks tagged tiwh xps:pcore
%   XPS_LIB_PATH: Sets to the value of the environment var of same name
% Also, all the necessary directories have been created.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% close all previously opened files
fclose('all');

% flow step options
if nargin == 2 & isstruct(flow_vec)
    run_update   = flow_vec.update  ;
    run_drc      = flow_vec.drc     ;
    run_xsg      = flow_vec.xsg     ;
    run_copy     = flow_vec.copy    ;
    run_ip       = flow_vec.ip      ;
    run_edkgen   = flow_vec.edkgen  ;
    run_elab     = flow_vec.elab    ;
    run_software = flow_vec.software;
    run_edk      = flow_vec.edk     ;
    run_download = flow_vec.download;
else
    run_update   = 1;
    run_drc      = 1;
    run_xsg      = 1;
    run_copy     = 1;
    run_ip       = 1;
    run_edkgen   = 1;
    run_elab     = 1;
    run_software = 1;
    run_edk      = 1;
    run_download = 0;
end

time_update   = 0;
time_drc      = 0;
time_xsg      = 0;
time_copy     = 0;
time_ip       = 0;
time_edkgen   = 0;
time_elab     = 0;
time_software = 0;
time_edk      = 0;
time_download = 0;

slash = '\';
system_os = '';
[s,w] = system('uname -a');

if s ~= 0
  [s,w] = system('ver');
  if s ~= 0
    disp(sprint('Could not detect OS, assuming Windows'));
  elseif ~isempty(regexp(w,'Windows'))
    disp(sprintf('Detected Windows OS'));
  else
    disp(sprintf('Detected Unknown Windows-like OS'));
  end
  system_os = 'windows';
elseif ~isempty(regexp(w,'Linux'))
  slash = '/';
  disp(sprintf('Detected Linux OS'));
  system_os = 'linux';
else
  slash = '/';
  disp(sprintf('Detected Unknown Unix-like OS'));
  system_os = 'linux';
end

xps_blks        = find_system(sys,'FollowLinks','on','LookUnderMasks','all','RegExp','on','Tag','^xps:');
xps_xsg_blks    = find_system(sys,'FollowLinks','on','LookUnderMasks','all','Tag','xps:xsg');
xps_pcore_blks  = find_system(sys,'FollowLinks','on','LookUnderMasks','all','Tag','xps:pcore');
sysgen_blk      = find_system(sys, 'SearchDepth', 1,'FollowLinks','on','LookUnderMasks','all','Tag','genX');

% check if the system name is correct
if upper(sys(1))==sys(1)
    error('Due to EDK toolflow limitations, the system name cannot start with an upper case letter');
end

if length(xps_xsg_blks) ~= 1
    error('There has to be exactly 1 XPS_xsg block on each chip level (sub)system (Is the current system the correct one ?)');
end

if length(sysgen_blk) == 1
    xsg_blk = sysgen_blk{1};
else
    error('XPS_xsg block must be on the same level as the Xilinx SysGen block. (Have you put a XSG block in you design, and is the current system the correct one ?)');
end

% cd into the design directory
sys_file = get_param(sys,'FileName');
[sys_dir, temp1, temp2, temp3] = fileparts(sys_file);
cd(sys_dir);

% comb for gateway in blocks that aren't part of a yellow block
gateways_blk = find_system(sys, 'FollowLinks','on','LookUnderMasks','all','masktype','Xilinx Gateway In Block');
for i=[1:length(gateways_blk)]
    found_xps_tag = 0;
    parent = get_param(gateways_blk(i),'parent');
    gw_parent = parent;

    while ~strcmp(parent,'')
        parent_tag = char(get_param(parent,'tag'));
        if ~isempty(regexp(parent_tag,'^xps:'))
            found_xps_tag = 1;
        end
        parent = get_param(parent,'parent');
    end
    parent_tag = char(get_param(get_param(gateways_blk(i),'parent'),'tag'));
    if found_xps_tag == 0
        disregard_blocks = find_system(gw_parent, 'FollowLinks','on','LookUnderMasks','all','masktype','Xilinx Disregard Subsystem For Generation');
        if isempty(disregard_blocks)
            error('Xilinx input gateways cannot be used in a design. Only XPS GPIO blocks should be used.');
        end
    end
end

% set design paths
XPS_LIB_PATH = getenv('BEE2_XPS_LIB_PATH');
if isempty(XPS_LIB_PATH)
    error('Environment variable BEE2_XPS_LIB_PATH must be defined');
end

simulink_path   = pwd;
design_name     = clear_name(get_param(xsg_blk,'parent'));
work_path       = [simulink_path, slash, clear_name(get_param(xsg_blk,'parent'))];
src_path        = [work_path, slash, 'src'];
xsg_path        = [work_path, slash, 'sysgen'];
bit_path        = [work_path, slash, 'bit_files'];
netlist_path    = [work_path, slash, 'netlist'];

% check paths
if ~isempty(strfind(simulink_path, ' '))
    warndlg(['Working directory ', simulink_path, ' has a space in the pathname. This can cause problems with some of the tools. Please change your working directory.']);
    error('Working directory has a space in the pathname.');
end

if ~isempty(strfind(XPS_LIB_PATH, ' '))
    warndlg(['Directory specified by the BEE2_XPS_LIB_PATH environment variable (', XPS_LIB_PATH, ') has a space in the pathname. This can cause problems with some of the tools. Please change its directory.']);
    error('Directory specified by the BEE2_XPS_LIB_PATH environment variable has a space in the pathname.');
end

% create design paths if non-existent
if exist(work_path,'dir') ~= 7
    mkdir(pwd,clear_name(get_param(xsg_blk,'parent')));
end

if exist(src_path,'dir') ~= 7
    mkdir(work_path,'src');
end

if exist(bit_path,'dir') ~= 7
    mkdir(work_path,'bit_files');
end

if exist(netlist_path,'dir') ~= 7
    mkdir(work_path,'netlist');
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Task: System Update (run_update)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
start_time = now;
if run_update
disp('#############################');
disp('##      System Update      ##');
disp('#############################');
    % update the current system
    set_param(sys,'SimulationCommand','update');
end
time_update = now - start_time;

%access all XPS blocks
disp('#############################');
disp('## Block objects creation  ##');
disp('#############################');

xps_objs        = {};
probe_objs      = {};
blocks_types    = {};
custom_xps_objs = {};
core_types      = {};

% Find and creates xsg_obj (An object of xps_xsg)
% ng_objs.xps_xsg updated
for n = 1:length(xps_blks)
    if strcmp(get_param(xps_blks(n),'tag'),'xps:xsg')
        try
            xsg_obj = xps_block(xps_blks{n},{});
            xsg_obj = xps_xsg(xsg_obj);
            nb_objs.xps_xsg = 1;
        catch
            disp(['Problem with block: ',xps_blks{n}]);
            disp(lasterr);
            error('Error found during Object creation.');
        end
    end
end

% Create objects for all blocks with xps:* tags
% All objects are stored in xps_objs
for n = 1:length(xps_blks)
    if ~(strcmp(get_param(xps_blks(n),'tag'),'xps:xsg') || strcmp(get_param(xps_blks(n),'tag'),'xps:pcore'))
        try
            blk_obj = xps_block(xps_blks{n},xsg_obj);
            eval(['blk_obj = ',get(blk_obj,'type'),'(blk_obj);']);

            xps_objs = [xps_objs,{blk_obj}];

            if isempty(find(strcmp(get(blk_obj, 'type'), {'xps_adc' 'xps_block' 'xps_bram' 'xps_corr_adc' 'xps_corr_dac' 'xps_corr_mxfe' 'xps_corr_rf' 'xps_dram' 'xps_ethlite' 'xps_framebuffer' 'xps_fifo' 'xps_gpio' 'xps_interchip' 'xps_lwip' 'xps_opb2opb' 'xps_plb2opb' 'xps_probe' 'xps_quadc' 'xps_sram' 'xps_sw_reg' 'xps_tengbe' 'xps_vsi' 'xps_xaui' 'xps_xsg'})))
                custom_xps_objs = [custom_xps_objs, {blk_obj}];
            else
                if isempty(find(strcmp(get(blk_obj, 'type'), core_types)))
                    core_types = [core_types, {get(blk_obj, 'type')}];
                end
            end

            try
                eval(['nb_objs.',get(blk_obj,'type'),' = nb_objs.',get(blk_obj,'type'),' + 1;'])
            catch
                eval(['nb_objs.',get(blk_obj,'type'),' = 1;'])
            end
        catch
            disp(['Problem with block: ',xps_blks{n}]);
            disp(lasterr);
            error('Error found during Object creation.');
        end
    end
end
xps_objs = [{xsg_obj},xps_objs];

hw_sys          = get(xsg_obj,'hw_sys');
hw_subsys       = get(xsg_obj,'hw_subsys');
sw_os           = get(xsg_obj,'sw_os');
mpc_type        = get(xsg_obj,'mpc_type');
app_clk         = get(xsg_obj,'clk_src');
app_clk_rate    = get(xsg_obj,'clk_rate');
xsg_core_name   = clear_name(get(xsg_obj,'parent'));
xps_path        = [work_path, slash, 'XPS_',hw_sys,'_base'];

% Create structure of commonly-used design parameters
mssge_proj                  = {};
mssge_proj.sys              = sys;
mssge_proj.design_name      = design_name;
mssge_proj.hw_sys           = hw_sys;
mssge_proj.hw_subsys        = hw_subsys;
mssge_proj.sw_os            = sw_os;
mssge_proj.mpc_type         = mpc_type;
mssge_proj.app_clk          = app_clk;
mssge_proj.app_clk_rate     = app_clk_rate;
mssge_proj.xsg_core_name    = xsg_core_name;

% Create structure of commonly-used paths
mssge_paths                 = {};
mssge_paths.XPS_LIB_PATH    = XPS_LIB_PATH;
mssge_paths.simulink_path   = simulink_path;
mssge_paths.work_path       = work_path;
mssge_paths.src_path        = src_path;
mssge_paths.xsg_path        = xsg_path;
mssge_paths.netlist_path    = netlist_path;
mssge_paths.xps_path        = xps_path;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Task: DRC (run_drc)
% The drc() function of each object in xps_objs is called
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
start_time = now;
if run_drc
    disp('######################');
    disp('## Checking objects ##');
    disp('######################');
    for n=1:length(xps_objs)
        [result, msg] = drc(xps_objs{n},xps_objs);
        if result
            disp('Error with block:');
            display(xps_objs{n});
            disp(msg);
            error('DRC failed!');
        end
    end
end
time_drc = now - start_time;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Task: Execute System Generator (run_xsg)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
start_time = now;
if run_xsg
    if exist(xsg_path,'dir')
        rmdir(xsg_path,'s');
    end
    disp('Running system generator ...');
    xsg_result = xlGenerateButton(xsg_blk);
    if xsg_result == 0
        disp('XSG generation complete.');
    else
        error(['XSG generation failed: ',xsg_result]);
        help xlGenerateButton;
    end
end
time_xsg = now - start_time;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Task: Copy Base System
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
start_time = now;
if run_copy
    disp('#########################');
    disp('## Copying base system ##');
    disp('#########################');

    pcores_used = {};

    for n = 1:length(xps_objs)

        curr_obj = xps_objs{n};

        obj_ip_name = get(curr_obj, 'ip_name');
        obj_ip_ver  = get(curr_obj, 'ip_version');
        obj_supp_ip_names = get(curr_obj, 'supp_ip_names');
        obj_supp_ip_vers  = get(curr_obj, 'supp_ip_versions');

        if isempty(obj_ip_ver)
            obj_ip_ver = '1.00.a';
        end

        if isempty(obj_supp_ip_names)
            try
                pcore_used = clear_name([obj_ip_name, ' v', obj_ip_ver]);
                pcores_used = [pcores_used, {pcore_used}];
            end
        else
            for n=2:length(obj_supp_ip_names)
                try
                    pcore_used = clear_name([obj_supp_ip_names{n}, ' v', obj_supp_ip_vers{n}]);
                    pcores_used = [pcores_used, {pcore_used}];
                end
            end

            % supp_ip_names{1} used to override ip_name; also include ip_name if {1} is empty
            if isempty(obj_supp_ip_names{1})
                try
                    pcore_used = clear_name([get(curr_obj, 'ip_name'), ' v', get(curr_obj, 'ip_version')]);
                    pcores_used = [pcores_used, {pcore_used}];
                end
            else
                try
                    pcore_used = clear_name([obj_supp_ip_names{1}, ' v', obj_supp_ip_vers{1}]);
                    pcores_used = [pcores_used, {pcore_used}];
                end
            end
        end

    end % for n = 1:length(xps_objs)

    pcores_used = unique(pcores_used);

    if exist(xps_path,'dir')
        rmdir(xps_path,'s');
    end
    if exist([XPS_LIB_PATH, slash, 'XPS_',hw_sys,'_base'],'dir')

        source_dir      = [XPS_LIB_PATH, slash, 'XPS_', hw_sys, '_base'];
        destination_dir = [xps_path];

        if strcmp(system_os, 'windows')
            copy_fail = 1; % xcopy failure returns 1
            mkdir(xps_path);
            % use xcopy to avoid copying .svn directories
            [copy_result,copy_message] = dos(['xcopy /Q /E /Y ', source_dir, ' ', destination_dir,'\.']);
        else
            copy_fail = 0; % copyfile failure returns 0
            [copy_result, msg, msgid] = copyfile(source_dir,destination_dir,'f');
        end % if strcmp(system_os, 'windows')

        if copy_result == copy_fail
            cd(simulink_path);
            error('Unpackage base system files failed.');
        else
            cd(simulink_path);
        end % copy_result == copy_fail
    else
        error(['Base XPS package "','XPS_',hw_sys,'_base" does not exist.']);
    end % exist([XPS_LIB_PATH,'\XPS_',hw_sys,'_base'],'dir')

%%%%%   BEGIN PCORE COPYING CODE
%%%%%
%%%%%    if exist([XPS_LIB_PATH,'\pcores'], 'dir')
%%%%%        if ~exist([xps_path, '\copied_pcores'], 'dir')
%%%%%            mkdir([xps_path, '\copied_pcores']);
%%%%%        end
%%%%%
%%%%%        for n=1:length(pcores_used)
%%%%%            disp(pcores_used{n})
%%%%%            pcore_path = [xps_path, '\copied_pcores\', pcores_used{n}];
%%%%%            mkdir(pcore_path);
%%%%%            [copy_result, copy_message] = dos(['xcopy /Q /E /Y ', XPS_LIB_PATH, '\pcores\', pcores_used{n}, ' ', pcore_path, '\.']);
%%%%%
%%%%%            if copy_result
%%%%%                cd(simulink_path);
%%%%%                disp(copy_message);
%%%%%                error(['Pcore copy failed: ', pcores_used{n}]);
%%%%%            else
%%%%%                cd(simulink_path);
%%%%%            end
%%%%%        end % for n=1:length(pcores_used)
%%%%%    else
%%%%%        cd(simulink_path);
%%%%%        error(['PCores directory "', XPS_LIB_PATH, '\pcores" does not exist']);
%%%%%    end % if exist([XPS_LIB_PATH,'\pcores'], 'dir') - else
%%%%%
%%%%%   END PCORE COPYING CODE

end % if run_copy
time_copy = now - start_time;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Task: Copy+Create custom IPs
% Description: If the user specify a custom IP block, a EDK pcore
% is automatically generated so that it can be integrated with the
% rest of the system.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
start_time = now;
if run_ip
    disp('########################');
    disp('## Copying custom IPs ##');
    disp('########################');

    cd(simulink_path);
    for n = 1:length(xps_pcore_blks)
        path_param = get_param(xps_pcore_blks(n), 'pcore_path');
        pcore_path = clear_path(path_param{1});

        destination_dir = [xps_path, slash, 'pcores', slash];

        [copy_result, msg, msgid] = copyfile(pcore_path, destination_dir, 'f');

        if copy_result == 0;
            cd(simulink_path);
            error(['Error copying custom pcores from ', pcore_path]);
        end
    end

    gen_xps_create_pcore(xsg_obj, xps_objs, mssge_proj, mssge_paths, slash);

end % if run_ip
time_ip = now - start_time;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Task: Create custom EDK
% Description: Create custom system.mhs file based on the
% yellowboxes that the user has used. At the end of this task three
% files, system.mhs, core_info.m and core_info.tab are created.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
start_time = now;
if run_edkgen
    disp('##########################');
    disp('## Creating EDK files   ##');
    disp('##########################');

    % modifying XMP file
    xmpfile = 'system.xmp';

    if ~isempty(hw_subsys)
        xmpfile = [xmpfile, '.', hw_subsys];
    end % if ~isempty(hw_subsys)

    if ~exist([xps_path, slash, xmpfile, '.bac'],'file')
        [copystatus,copymessage,copymessageid] = copyfile([xps_path, slash, xmpfile],[xps_path, slash, xmpfile,'.bac']);
        if ~copystatus
            disp('Error trying to backup system.xmp:');
            disp(copymessage);
        end % if ~copystatus

        [copystatus,copymessage,copymessageid] = copyfile([xps_path, slash, xmpfile,'.bac'],[xps_path, slash, 'system.xmp']);
        if ~copystatus
            disp('Error trying to overwrite system.xmp:');
            disp(copymessage);
        end % if ~copystatus
    end % if ~exist([xps_path, slash, xmpfile, '.bac'],'file')

    % modifying MHS file
    gen_xps_mod_mhs(xsg_obj, xps_objs, mssge_proj, mssge_paths, slash);

    % modifying MSS file
    gen_xps_mod_mss(xsg_obj, xps_objs, mssge_proj, mssge_paths, slash);

    % modifying UCF file
    gen_xps_mod_ucf(xsg_obj, xps_objs, mssge_proj, mssge_paths, slash);

end % if run_edkgen
time_edkgen = now - start_time;

start_time = now;
if run_elab
    disp('#########################');
    disp('## Elaborating objects ##');
    disp('#########################');
    for n=1:length(xps_objs)
        try
            xps_objs{n} = elaborate(xps_objs{n});
        catch
            display(xps_objs{n})
            disp(lasterr)
            error(['Elaboration of object failed.'])
        end
    end
end % if run_elab
time_elab = now - start_time;

start_time = now;
if run_software
    disp('##############################');
    disp('## Preparing software files ##');
    disp('##############################');

    switch sw_os
        case 'tinySH'
            %TODO: these functions might experience OS 'slash' errors
            % Creating software core info files
            gen_xps_tinysh_core_info(xsg_obj, xps_objs, custom_xps_objs, mssge_proj, mssge_paths);

            % Gathering information on the software files
            [headers, sources] = gen_xps_tinysh_get_src(xsg_obj, xps_objs, mssge_proj, mssge_paths);

            % Rewrite main.c based on user source code
            gen_xps_tinysh_mod_main(xsg_obj, xps_objs, mssge_proj, mssge_paths, headers, sources);

            % write project file
            gen_xps_tinysh_mod_xmp(xsg_obj, xps_objs, mssge_proj, mssge_paths, headers, sources);

        % end case 'tinySH'

        case 'linux'

        case 'none'

        otherwise
            error(['Unsupported OS: ',sw_os]);
    end % switch sw_os

    win_fid = fopen([xps_path, slash, 'gen_prog_files.bat'],'w');
    unix_fid = fopen([xps_path, slash, 'gen_prog_files'],'w');
    fprintf(unix_fid,['#!/bin/bash\n']);
    time_stamp = clear_name(datestr(now, 'yyyy-mmm-dd HHMM'));

    switch sw_os
        case 'none'
            fprintf(win_fid,['copy implementation\\system.bit ..\\bit_files\\',design_name,'_',time_stamp,'.bit\n']);
            fprintf(unix_fid,['cp implementation/system.bit ../bit_files/',design_name,'_',time_stamp,'.bit\n']);
        % end case 'none'
        otherwise
            fprintf(win_fid,['copy implementation\\download.bit ..\\bit_files\\',design_name,'_',time_stamp,'.bit\n']);
            fprintf(unix_fid,['cp implementation/download.bit ../bit_files/',design_name,'_',time_stamp,'.bit\n']);
        % end otherwise
    end % switch sw_os

    if strcmp(hw_sys, 'iBOB') && strcmp(get(xsg_obj,'ibob_linux'), 'on')
        fprintf(win_fid,'mkbof.exe -o implementation\\download.bof -s core_info.tab -p 4 -c -v implementation\\download.bit\n');
        fprintf(unix_fid,'./mkbof -o implementation/download.bof -s core_info.tab -p 4 -c -v implementation/download.bit\n');
        fprintf(win_fid,['copy implementation\\download.bof ..\\bit_files\\',design_name,'_',time_stamp,'.bof\n']);
        fprintf(unix_fid,['cp implementation/download.bof ../bit_files/',design_name,'_',time_stamp,'.bof\n']);
    end % if strcmp(hw_sys, 'iBOB') && strcmp(get(xsg_obj,'ibob_linux'), 'on')

    if strcmp(hw_sys, 'BEE2_ctrl')
        fprintf(win_fid,'xmd -tcl ./genace.tcl -opt bee2Genace.opt\n');
        fprintf(unix_fid,'xmd -tcl ./genace.tcl -opt bee2Genace.opt\n');
        fprintf(win_fid,['copy implementation\\cflash.ace ..\\bit_files\\',design_name,'_',time_stamp,'.ace\n']);
        fprintf(unix_fid,['cp implementation/cflash.ace ../bit_files/',design_name,'_',time_stamp,'.ace\n']);
        fprintf(win_fid,'mkbof.exe -o implementation\\download.bof -s core_info.tab -p 4 -c -v implementation\\download.bit\n');
        fprintf(unix_fid,'./mkbof -o implementation/download.bof -s core_info.tab -p 4 -c -v implementation/download.bit\n');
        fprintf(win_fid,['copy implementation\\download.bof ..\\bit_files\\',design_name,'_',time_stamp,'.bof\n']);
        fprintf(unix_fid,['cp implementation/download.bof ../bit_files/',design_name,'_',time_stamp,'.bof\n']);
    end % if strcmp(hw_sys, 'BEE2_ctrl')

    if strcmp(hw_sys, 'BEE2_usr')
        fprintf(win_fid,'mkbof.exe -o implementation\\download.bof -s core_info.tab -v implementation\\download.bit\n');
        fprintf(unix_fid,'./mkbof -o implementation/download.bof -s core_info.tab -v implementation/download.bit\n');
        fprintf(win_fid,['copy implementation\\download.bof ..\\bit_files\\',design_name,'_floating_',time_stamp,'.bof\n']);
        fprintf(unix_fid,['cp implementation/download.bof ../bit_files/',design_name,'_floating_',time_stamp,'.bof\n']);
        fprintf(win_fid,'mkbof.exe -o implementation\\download.bof -s core_info.tab -p 0 -v implementation\\download.bit\n');
        fprintf(unix_fid,'./mkbof -o implementation/download.bof -s core_info.tab -p 0 -v implementation/download.bit\n');
        fprintf(win_fid,['copy implementation\\download.bof ..\\bit_files\\',design_name,'_fpga1_',time_stamp,'.bof\n']);
        fprintf(unix_fid,['cp implementation/download.bof ../bit_files/',design_name,'_fpga1_',time_stamp,'.bof\n']);
        fprintf(win_fid,'mkbof.exe -o implementation\\download.bof -s core_info.tab -p 1 -v implementation\\download.bit\n');
        fprintf(unix_fid,'./mkbof -o implementation/download.bof -s core_info.tab -p 1 -v implementation/download.bit\n');
        fprintf(win_fid,['copy implementation\\download.bof ..\\bit_files\\',design_name,'_fpga2_',time_stamp,'.bof\n']);
        fprintf(unix_fid,['cp implementation/download.bof ../bit_files/',design_name,'_fpga2_',time_stamp,'.bof\n']);
        fprintf(win_fid,'mkbof.exe -o implementation\\download.bof -s core_info.tab -p 2 -v implementation\\download.bit\n');
        fprintf(unix_fid,'./mkbof -o implementation/download.bof -s core_info.tab -p 2 -v implementation/download.bit\n');
        fprintf(win_fid,['copy implementation\\download.bof ..\\bit_files\\',design_name,'_fpga3_',time_stamp,'.bof\n']);
        fprintf(unix_fid,['cp implementation/download.bof ../bit_files/',design_name,'_fpga3_',time_stamp,'.bof\n']);
        fprintf(win_fid,'mkbof.exe -o implementation\\download.bof -s core_info.tab -p 3 -v implementation\\download.bit\n');
        fprintf(unix_fid,'./mkbof -o implementation/download.bof -s core_info.tab -p 3 -v implementation/download.bit\n');
        fprintf(win_fid,['copy implementation\\download.bof ..\\bit_files\\',design_name,'_fpga4_',time_stamp,'.bof\n']);
        fprintf(unix_fid,['cp implementation/download.bof ../bit_files/',design_name,'_fpga4_',time_stamp,'.bof\n']);
    end % if strcmp(hw_sys, 'BEE2_usr')

    if strcmp(hw_sys, 'ROACH')
      fprintf(win_fid, ['mkbof.exe -o implementation\\system.bof', ' -s core_info.tab -t 3 implementation\\system.bin\n']);
      fprintf(unix_fid, ['./mkbof -o implementation/system.bof', ' -s core_info.tab -t 3 implementation/system.bin\n']);
      fprintf(win_fid,['copy implementation\\system.bof', ' ..\\bit_files\\', design_name,'_', time_stamp,'.bof\n']);
      fprintf(unix_fid,['chmod +x implementation/system.bof\n']);
      fprintf(unix_fid,['cp implementation/system.bof ../bit_files/', design_name,'_',time_stamp,'.bof\n']);
    end % strcmp(hw_sys, 'ROACH')

    fclose(win_fid);
    fclose(unix_fid);

end % if run_software
time_software = now - start_time;

start_time = now;
if run_edk
    disp('#########################');
    disp('## Running EDK backend ##');
    disp('#########################');
    % erase download.bit to make sure a failing compilation will report an error
    delete([xps_path, slash, 'implementation', slash, 'system.bit']);
    delete([xps_path, slash, 'implementation', slash, 'download.bit']);
    fid = fopen([xps_path, slash, 'run_xps.tcl'],'w');

    mpc_type = get(xsg_obj,'mpc_type');

    switch mpc_type
        case 'powerpc440_ext'
            fprintf(fid,['run bits\n']);
        % end case 'powerpc440_ext'
        otherwise
            fprintf(fid,['run init_bram\n']);
        % end otherwise
    end % switch mpc_type
    fprintf(fid,['exit\n']);
    fclose(fid);

    eval(['cd ',xps_path]);
    status = system(['xps -nw -scr run_xps.tcl system.xmp']);
    if status ~= 0
        cd(simulink_path);
        error('XPS failed.');
    else
        if (strcmp(slash, '\'))
            % Windows case
            [status, message] = dos('gen_prog_files.bat');
            if status ~= 0
                cd(simulink_path);
                error('Programation files generation failed, EDK compilation probably also failed.');
            end % if dos('gen_prog_files.bat')
        else
            % Linux case
            [status, message] = unix('chmod +x gen_prog_files');
            [status, message] = unix('./gen_prog_files');
            if status ~= 0
                cd(simulink_path);
                disp(message);
                error('Programation files generation failed, EDK compilation probably also failed.');
            end % if unix('gen_prog_files.bat')
        end %if (strcmp(slash, '\'))
    end % if(dos(['xps -nw -scr run_xps.tcl system.xmp']))

    cd(simulink_path);

end % if run_edk
time_edk = now - start_time;

start_time = now;
if run_download
    fid = fopen([xps_path, slash, 'run_download.tcl'],'w');
    fprintf(fid,['run download\n']);
    fprintf(fid,['exit\n']);
    fclose(fid);
    eval(['cd ',xps_path]);
    [status, message] = system(['xps -nw -scr run_download.tcl system.xmp']);
    if status ~= 0
        cd(simulink_path);
        error('Download failed.');
    end % if(system(['xps -nw -scr run_download.tcl system.xmp']))
    cd(simulink_path);
end % if run_download
time_download = now - start_time;

time_total = time_update + time_drc + time_xsg + time_copy + time_ip + time_edkgen + time_elab + time_software + time_edk + time_download;

time_struct.update   = time_update   ;
time_struct.drc      = time_drc      ;
time_struct.xsg      = time_xsg      ;
time_struct.copy     = time_copy     ;
time_struct.ip       = time_ip       ;
time_struct.edkgen   = time_edkgen   ;
time_struct.elab     = time_elab     ;
time_struct.software = time_software ;
time_struct.edk      = time_edk      ;
time_struct.download = time_download ;
