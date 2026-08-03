% This script discovers and executes all example MATLAB files in the
% 'Tutorials' and 'Systems and Control' directories, capturing results 
% and generating a markdown report.
% It's designed for CI/CD integration but can also be run locally.
%
% Outputs:
%   - example_results.md: Markdown file with test results
%   - status: Return variable (1 = all passed, 0 = some failed)
%   - Console output: Real-time test progress

%% Initialize test environment
% Add all project directories to MATLAB path recursively
addpath(genpath(pwd));

%% Discover test files
% Find all .m files in the 'Tutorials' and 'Systems and Control' 
% directories and its subdirectories using recursive search (**/*.m) 
% to catch examples in nested folders
mfiles1 = dir('./Tutorials/**/*.m');
mfiles2 = dir('./Systems and Control/**/*.m');
mfiles = vertcat(mfiles1, mfiles2);

%% Initialize results file
fid = fopen('example_results.md', 'w');
if fid == -1
    error('Failed to create example_results.md');
end

% Initialize overall test status (1 = all passed, 0 = any failed)
status = 1;

%% Execute each test file
fprintf('\n=== Starting Example Tests ===\n');
fprintf('Found %d test files to execute\n\n', length(mfiles));
for actidx=1:length(mfiles)
    % Get current test file information
    current_file = mfiles(actidx).name;

    try
        % Execute the example file and capture all output
        out = evalc('run(current_file)');

        % Log success
        fprintf('SUCCESS: %s \n', current_file)

    catch ME
        % Test failed - capture error details
        status = 0;     % Mark overall status as failed

        % Log failure to console with error details
        fprintf('FAILED: %s \n', current_file)
        fprintf('Error : %s\n', ME.message);
        
        % Create detailed error report in markdown format
        md_content = [sprintf('> [!WARNING]\n'),                    ...
                      sprintf('**File:** `%s`  \n', current_file),  ...
                      sprintf('**Error:** %s  \n', ME.message)];

        % Write error report to markdown file
        fprintf(fid, '%s\n', md_content);
    end
end

%% Generate final summary
if status   % All tests passed - add success note to markdown
    md_content = [sprintf('> [!NOTE]\n')];
    md_content = [md_content, 'All of the files were successful! '];
    fprintf(fid, '%s\n', md_content);
end

%% Cleanup and finalize
fclose(fid);    % Always close file handles
fprintf('\nResults saved to example_results.md\n');