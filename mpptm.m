function D = mpptm(Vpv,Ipv)

persistent Dprev Pprev Vprev

if isempty(Dprev)
    Dprev = 0.7;
    Vprev = 190;
    Pprev = 2000;
end
%initialize parameters
deltaD = 0.001;

% initalize measured array power
Ppv = Vpv*Ipv;


if(Ppv - Pprev) ~= 0
    if(Ppv - Pprev) > 0
        if(Vpv-Vprev) > 0
            D = Dprev - deltaD;
        else
            D = Dprev + deltaD;
        end
    else
        if(Vpv-Vprev) > 0
            D = Dprev + deltaD;
        else
            D = Dprev - deltaD;
        end
    end
else
    D = Dprev;
end
%update values
Dprev = D;
Vprev = Vpv;
Pprev = Ppv;

end