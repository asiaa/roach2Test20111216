function delete_contents(sys,preserve_blocks)
% Delete the contents of a subsystem.
%
% delete_contents( sys, preserve_blocks )
%
% sys = Subsystem whose contents will be deleted.
% preserve_blocks = Cell array (of strings) indicating block types to preserve

    objs = find_system(sys, ...
        'SearchDepth',      1 , ...
        'LookUnderMasks', 'on', ...
        'FollowLinks',    'on', ...
        'FindAll',        'on', ...
        'Parent',         sys);

    for k=1:length(objs),
        try
            type = get_param(objs(k),'Type');
        catch
            continue;
        end
        switch get_param(objs(k),'Type')
            case 'line'
                delete_line(objs(k));
            case 'block'
                delete=1;
                for preserve=preserve_blocks
                    blktype = get_param(objs(k),'BlockType');
                    if strcmp(preserve{1},blktype)
                        delete=0;
                        break;
                    end
                end
                if delete
                  delete_block(objs(k));
                end
            case 'port'
                % Ignore
            otherwise
                error(['I do not know how to delete a ', get_param(objs(k),'Type')]);
        end
end

