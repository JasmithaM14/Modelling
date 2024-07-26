function y = shifted_sphere(x)
    % Define the shift value (example shift; this should be defined appropriately)
    shift = 80 * ones(size(x)); 
    z = x - shift;
    y = sum(z.^2);
end
