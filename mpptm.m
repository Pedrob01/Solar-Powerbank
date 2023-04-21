function D = mpptm(Vpv,Ipv)

Dmin = 0.05;
Dmax = 0.95;
persistent Dprev Pprev Vprev ;

if isempty(Dprev)
    Dprev = 0.95;
    Vprev = 0;
    Pprev = 0;
end
%initialize parameters
deltaD = 0.02;

% initalize measured array power
Ppv = Vpv*Ipv;

if((Ppv - Pprev) ~= 0) 
    if((Ppv - Pprev) > 0) 
        if((Vpv-Vprev) > 0) 
            D = Dprev - deltaD;
        else
            D = Dprev + deltaD;
        end
    else
        if((Vpv-Vprev) > 0)
            D = Dprev + deltaD;
        else
            D = Dprev - deltaD;
        end
    end
else
    D = Dprev;
end

%update values
if D >= Dmax || D < Dmin
    D = Dprev;
end
Dprev = D;
Vprev = Vpv;
Pprev = Ppv;

