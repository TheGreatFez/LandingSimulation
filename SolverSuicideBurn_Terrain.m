N = 20;
M = 5;
TWR_plot = logspace(0.05,1,N)';
Terrain_Height_plot = linspace(0,10000,M)';
Starting_Alt_plot = zeros(N,M);
fprintf ('          k j i\n')
for k=1:M
    for j=1:N
        run Constants.m
        TWR = TWR_plot(j);
        Terrain_Height = Terrain_Height_plot(k);
        %TWR = 6;
        i = 0;
        run SolverSuicideBurn_Base.m
        Starting_Alt_plot(j,k) = Starting_Alt;
        fprintf ('Iteration %d %d %d\r', k, j, i)
    end
end
%plot(TWR_plot,Starting_Alt_plot/1000)
surf(Terrain_Height_plot,TWR_plot,Starting_Alt_plot/1000)
title(Planet_Name)
xlabel('Terrain Height (m)')
ylabel('TWR')
zlabel('Circular Starting Orbit (km)')