function [best, fval] = runPSO(func, D)
    options = optimoptions('particleswarm', 'SwarmSize', 100, 'MaxIterations', 200, 'Display', 'iter');
    [best, fval] = particleswarm(func, D, -100*ones(1,D), 100*ones(1,D), options);
end
