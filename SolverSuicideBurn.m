N = 20;
TWR_plot = logspace(0.05,1,N)';
Starting_Alt_plot = zeros(N,1);
fprintf ('          j i\n')
for j=1:N
    run Constants.m
    TWR = TWR_plot(j);
    %TWR = 1.122;
    Terrain_Height = 0;
    i = 0;
    run SolverSuicideBurn_Base.m
    Starting_Alt_plot(j) = Starting_Alt;
    fprintf ('Iteration %d %d\r', j, i)
end

plot(TWR_plot,Starting_Alt_plot/1000)
title(Planet_Name)
xlabel('TWR')
ylabel('Circular Starting Orbit (km)')