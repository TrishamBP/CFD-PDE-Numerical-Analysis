clear all;clc;close all;

dx = [0.001 0.01 0.1 0.2 0.3 0.4 0.5];
f = @(x) x.^2./4;
f_prime = @(x) x/2;

x0 = 2;
f_prime_ana = f_prime(x0);
f_prime_fd_forward = (f(x0 + dx) - f(x0))./dx;
f_prime_fd_central = (f(x0 + dx) - f(x0 - dx))./(2.*dx);
error_forward = abs((f_prime_ana - f_prime_fd_forward)/(f_prime_ana));
error_central = abs((f_prime_ana - f_prime_fd_central)/(f_prime_ana));

L = length(dx);
for i = 1:L
    Analytical(i) = f_prime_ana;
end

Analytical_Result = Analytical';
Cell_Size = dx';
Forward_Difference_Result = f_prime_fd_forward';
Forward_Difference_Error = error_forward';
Central_Difference_Result = f_prime_fd_central';
Central_Difference_Error = error_central';

T = table(Analytical_Result,Cell_Size,Forward_Difference_Result,Forward_Difference_Error,Central_Difference_Result,Central_Difference_Error)
