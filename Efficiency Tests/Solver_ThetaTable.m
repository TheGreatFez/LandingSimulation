run 'Constants_simple.m'
TWR = linspace(1.1,10,100)';
Vx = linspace(0.01,100,100)';
Vy = linspace(100,0.01,100)';
Theta = zeros(100,100);
for i=1:100
    for j=1:100
        
        theta_high = 90;
        theta_low = 0;
        theta = (theta_high+theta_low)/2;

        Timex = Vx(j)/(TWR(i)*g0*cosd(theta));
        Timey = Vy(j)/max(0.0001,TWR(i)*g0*sind(theta)-g0);
        diff = abs(Timex - Timey);
        k = 0;
        while diff > 0.0001
            k=k+1;
            if Timex > Timey 
                theta_high = theta;
                theta = (theta_high+theta_low)/2;
            else
                theta_low = theta;
                theta = (theta_high+theta_low)/2;
            end
            Timex = Vx(j)/(TWR(i)*g0*cosd(theta));
            Timey = Vy(j)/max(0.0001,TWR(i)*g0*sind(theta)-g0);
            diff = abs(Timex - Timey);
            if k >= 25
                break
            end
        end
        Theta(i,j) = theta;
    end
end
Theta_X = TWR';
Theta_Y = (Vx./Vy)';
Theta_Z = Theta;