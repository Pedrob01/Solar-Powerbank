#include "mppt.h"

double mppt(double Vpv, double Ipv) {
    double Ppv = Vpv * Ipv;
    double delP = Ppv - Pprev;
    double delV = Vpv - Vprev;

    
    if (delP != 0) {
        if (delP > 0) {
            if (delV > 0) {
                D = Dprev - deltaD;
            } else {
                D = Dprev + deltaD;
            }
        } else {
            if (delV > 0) {
                D = Dprev + deltaD;
            } else {
                D = Dprev - deltaD;
            }
        }
    } else {
        D = Dprev;
    }
    if ((D > Dmax) || (D < Dmin)) {
        D = Dprev;
    }
    
    Dprev = D;
    Pprev = Ppv;
    Vprev = Vpv;
    
    return D;
}