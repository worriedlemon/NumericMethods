function setup
    files = dir;
    
    for k = 1:length(files)
        filename = files(k).name;
        if (isfolder(filename) && ~strcmp(filename, '.') && ~strcmp(filename, '..'))
            disp([filename, ' is being added to PATH...']);
            addpath(filename);
        end
    end
end