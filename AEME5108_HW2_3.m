clear all;clc;close all;

dx = [0.001 0.01 0.1 0.2 0.3];
f = @(x) sin(2*pi.*x);
f_prime = @(x) 2*pi*cos(2*pi.*x);

x0 = 0.375;
f_prime_ana = f_prime(x0);
f_prime_fd_central2 = (f(x0 + dx) - f(x0 - dx))./(2.*dx);
f_prime_fd_central4 = (-f(x0 + 2*dx)+8*f(x0 + dx) - 8*f(x0 - dx) + f(x0 - 2*dx))./(12.*dx);
error_central2 = abs((f_prime_ana - f_prime_fd_central2)/(f_prime_ana));
error_central4 = abs((f_prime_ana - f_prime_fd_central4)/(f_prime_ana));

L = length(dx);
for i = 1:L
    Analytical(i) = f_prime_ana;
end

Analytical_Result = Analytical';
Cell_Size = dx';
Numerical_Order_2_Result = f_prime_fd_central2';
Numerical_Order_2_Error = error_central2';
Numerical_Order_4_Result = f_prime_fd_central4';
Numerical_Order_4_Error = error_central4';

T = table(Analytical_Result,Cell_Size,Numerical_Order_2_Result,Numerical_Order_2_Error,Numerical_Order_4_Result,Numerical_Order_4_Error)
