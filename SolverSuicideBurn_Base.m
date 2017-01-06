for i=1:100        
    sim('LandingSimulation')
    if Final_Altitude > 5
        Starting_Alt_High = Starting_Alt; % meters
        Starting_Alt = (Starting_Alt_High+Starting_Alt_Low)/2;
    end
    if Final_Speed >= 5 && Final_Altitude < 5
        Starting_Alt_Low = Starting_Alt; % meters
        Starting_Alt = (Starting_Alt_High+Starting_Alt_Low)/2;
    end
    if Final_Speed <= 5 && Final_Altitude < 5
        break;
    end
    if not(CIRC)
        Starting_Orbit = max(ParkingAlt,Starting_Alt);
    end
    [Starting_X_Speed,Starting_Y_Speed] = StartingSpeed(CIRC,Starting_Alt,Starting_Orbit,Planet_Radius,Planet_MU, Terrain_Height);
end