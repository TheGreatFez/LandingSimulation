run 'Constants_simple.m'
theta_high = 90;
theta_low = 0;
theta = (theta_high+theta_low)/2;

Vx = Starting_X_Speed;
Vy = abs(Starting_Y_Speed);
Timex = Vx/(TWR*g0*cosd(theta));
Timey = Vy/max(0.0001,TWR*g0*sind(theta)-g0);
diff = abs(Timex - Timey);
i=0;
while diff > 0.0001
    i=i+1;
    if Timex > Timey 
        theta_high = theta;
        theta = (theta_high+theta_low)/2;
    else
        theta_low = theta;
        theta = (theta_high+theta_low)/2;
    end
    Timex = Vx/(TWR*g0*cosd(theta));
    Timey = Vy/max(0.0001,TWR*g0*sind(theta)-g0);
    diff = abs(Timex - Timey);    
end
TWR_x = TWR*cosd(theta);
TWR_y = TWR*sind(theta);