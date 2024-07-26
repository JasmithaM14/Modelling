function [best, fval] = runSA(func, D)
    options = optimoptions('simulannealbnd', 'MaxIterations', 200, 'Display', 'iter');
    [best, fval] = simulannealbnd(func, -100*ones(1,D), 100*ones(1,D), options);
end
