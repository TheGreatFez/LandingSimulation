run Solver_CA.m
run Solver_GT.m
plot(X_GT,Y_GT,X_CA,Y_CA)
plotlength = max(max(max(X_GT),max(Y_GT)),max(max(X_CA),max(Y_CA)));
axis ([ 0 plotlength 0 plotlength])
axis square
xlabel('Downrange Distance (m)')
ylabel('Altitude (m)')
legend('Gravity Turn','Constant Angle')
title('Trajectories of Landing Methods')