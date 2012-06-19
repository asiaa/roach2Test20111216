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

function b = xps_framebuffer(blk_obj)

if ~isa(blk_obj,'xps_block')
    error('XPS_Framebuffer class requires a xps_block class object');
end

if ~strcmp(get(blk_obj,'type'),'xps_framebuffer')
    error(['Wrong XPS block type: ',get(blk_obj,'type')]);
end

blk_name = get(blk_obj,'simulink_name');
xsg_obj = get(blk_obj,'xsg_obj');

s.hw_sys     = 'BEE2';
s.dimm       = get_param(blk_name, 'dimm');
b = class(s, 'xps_framebuffer', blk_obj);

% ip name
b = set(b, 'ip_name', 'plb_ddr2_sniffer');

% plb bus offset
b = set(b, 'plb_address_offset', hex2dec('100'));

% misc ports
misc_ports.ddr_clk = {1 'in' 'ddr2_user_clk'};
b = set(b,'misc_ports',misc_ports);

% interfaces
interfaces.DDR2_USER = ['ddr2_user_dimm', s.dimm, '_async'];
interfaces.DDR2_CTRL = ['ddr2_user_dimm', s.dimm, '_ctrl'];
b = set(b,'interfaces',interfaces);

% borph parameters
borph_info.size = 2^30;
borph_info.mode = 3;
b = set(b,'borph_info',borph_info);
