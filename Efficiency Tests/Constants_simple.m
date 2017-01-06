Starting_X_Speed = 100;
Starting_Y_Speed = -25;
StartingAlt = 1000;
G0 = 9.80665; % Earth's gravitational acceleration
g0 = 1.63; % Mun's gravitational acceleration
WetMass = 6235; % kg
DryMass = 2236; % kg
Thrust = 60000; % Newtons
Isp = 345;  % seconds

FuelFlow = Thrust/(Isp*G0);
BurnStart = 1000;