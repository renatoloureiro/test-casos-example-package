% add all necessary paths
addpath(genpath(pwd));

% get all the .m files containing the examples
mfiles1 = dir('./Tutorials/**/*.m');
mfiles2 = dir('./Systems and Control/**/*.m');

% combine them
mfiles = vertcat(mfiles1, mfiles2);

% Write markdown file
fid = fopen('example_results.md', 'w');

% initialize markdown content
md_content = '# EXAMPLE PACKAGE STATUS';
fprintf(fid, '%s\n', md_content);

status = 1;

% run each demo file
for idx=1:length(mfiles)
    try
        out = evalc('run(mfiles(idx).name)');
        fprintf('SUCCESS: %s \n', mfiles(idx).name)
    catch ME
        status = 0;
        fprintf('FAILED:  %s \n', mfiles(idx).name)
        md_content = [sprintf('> [!WARNING]\n'),                        ...
                      sprintf('**File:** `%s`  \n', mfiles(idx).name),  ...
                      sprintf('**Error:** %s  \n', ME.message)];
        fprintf(fid, '%s\n', md_content);
    end
end

if status
    md_content = [sprintf('> [!NOTE]\n')];
    md_content = [md_content, 'All of the files were successful! '];
    fprintf(fid, '%s\n', md_content);
end
fclose(fid);

disp('Results saved to example_results.md');