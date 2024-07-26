% Define the functions and dimensions
functions = {@shifted_sphere, @shifted_schwefel, @shifted_rosenbrock};
dimensions = [2, 5];
num_runs = 15;

% Initialize results structure
results = struct();

% Loop through each dimension and function
for d = dimensions
    for func = functions
        func_name = func2str(func{1});
        results.(func_name).(['D', num2str(d)]) = struct();
        
        for i = 1:num_runs
            try
                [best_ga, fval_ga] = runGA(func{1}, d);
                [best_pso, fval_pso] = runPSO(func{1}, d);
                [best_sa, fval_sa] = runSA(func{1}, d);
                
                results.(func_name).(['D', num2str(d)]).ga(i) = fval_ga;
                results.(func_name).(['D', num2str(d)]).pso(i) = fval_pso;
                results.(func_name).(['D', num2str(d)]).sa(i) = fval_sa;
            catch ME
                disp(['Error in function ', func_name, ' for dimension ', num2str(d), ': ', ME.message]);
            end
        end
    end
end

% Display results
disp(results);
