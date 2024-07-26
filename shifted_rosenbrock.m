function y = shifted_rosenbrock(x)
    % Define the shift value (example shift; this should be defined appropriately)
    shift = 80 * ones(size(x)); 
    z = x - shift;
    y = sum(100*(z(2:end) - z(1:end-1).^2).^2 + (z(1:end-1) - 1).^2);
end
