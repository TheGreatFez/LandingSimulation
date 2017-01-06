run 'Constants_simple.m'
open 'Theta_Data.mat';
BurnStart_high = StartingAlt;
BurnStart_low = 0;
BurnStart = (BurnStart_high+BurnStart_low)/2;
sim('ConstantAngle.slx')
i = 0;
while abs(Final_Altitude) > 0.0001
    i = i+1;
    if Final_Altitude > 0
        BurnStart_high = BurnStart;
        BurnStart = (BurnStart_high+BurnStart_low)/2;
    else
        BurnStart_low = BurnStart;
        BurnStart = (BurnStart_high+BurnStart_low)/2;
    end
    sim('ConstantAngle.slx')
    if i >= 100
        break
    end
end
FuelUse_CA = FuelUse;
X_CA = X;
Y_CA = Y;