function [ Starting_X_Speed, Starting_Y_Speed ] = StartingSpeed( CIRC,Starting_Alt,Starting_Orbit,Planet_Radius,Planet_MU, Terrain_Height )
%STARTINGSPEED Summary of this function goes here
%   Detailed explanation goes here
if CIRC
    R_cir = Starting_Alt + Planet_Radius + Terrain_Height;
    V_cir = sqrt(Planet_MU/R_cir);
    Starting_X_Speed = V_cir;
    Starting_Y_Speed = 0;
else
    R_per = Starting_Alt + Terrain_Height + Planet_Radius;
    R_apo = Starting_Orbit + Planet_Radius;
    a = (R_per + R_apo)/2;
    e = (R_apo-R_per)/(R_per + R_apo);
    V_per = sqrt(((1+e)*Planet_MU)/((1-e)*a));
    Starting_X_Speed = V_per;
    Starting_Y_Speed = 0;
end

end

