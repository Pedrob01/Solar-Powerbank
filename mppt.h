//header for the mppt.c file

double Dmin = 0.05;
double Dmax = 0.95;
double Dprev = 0.95;
double Vprev = 0;
double Pprev = 0;
double deltaD = 0.03;
double D = 0;

int mppt(double Vpv, double Ipv);

