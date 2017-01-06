run 'Constants_simple.m'
theta_high = 90;
theta_low = 0;
theta = (theta_high+theta_low)/2;
delta_t = .8725;
Alt_delay = -1*Starting_Y_Speed*delta_t + .5*g0*delta_t^2;
Vy_new = delta_t*g0 - Starting_Y_Speed;
Vx = Starting_X_Speed;
Vy = Vy_new;
Timex = Vx/(TWR*g0*cosd(theta));
Timey = Vy/max(0.0001,TWR*g0*sind(theta)-g0);
diff = abs(Timex - Timey);

    while diff > 1e-07
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
time = (Timey+Timex)/2;
Alt_burn = Vy*time - .5*(TWR*g0*sind(theta)-g0)*time^2;
Alt_total = Alt_delay + Alt_burn;