clear all;clc;close all

dx=1e-1

% point where derivative is evaluated
x0=1.333;


x_min=x0-1.19918;
x_max=x0+1.0;

x=x_min:dx:x_max;

% function to calculate derivative
fun=x.*sin(x);

% index in x array corresponding to the point closest to x0
index=round( (x0-x_min)/dx+1 )
x0
x(index)

% exact derivative
truedfdx=sin(x(index))+x(index)*cos(x(index)); 

% forward difference derivative
appxdfdx=(fun(index+1)-fun(index))/(dx)

% central difference derivative
appxdfdx2=(fun(index+1)-fun(index-1))/(2*dx)
 
Err=abs(appxdfdx-truedfdx)/abs(truedfdx)

Err2=abs(appxdfdx2-truedfdx)/abs(truedfdx)