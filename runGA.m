function [best, fval, exitflag, output, population, scores] = runGA(func, D)
    options = optimoptions('ga', 'PopulationSize', 100, 'MaxGenerations', 200, 'Display', 'iter');
    [best, fval, exitflag, output, population, scores] = ga(func, D, [], [], [], [], -100*ones(1,D), 100*ones(1,D), [], options);
end
