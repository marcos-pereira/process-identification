% % Prozess Identifikation 1
% % @file    u2_2_halbleiterdioden.m
% % @author  Marcos Pereira
% % @date    22.05.2014
% % @attention Copyright (C) 2014

% diode equation: i = I_0 * (exp(u/(m*U_T))-1)
% approximation: i = I_0 * exp(u/(m*U_T))
% natural logarithm to obtain linearized equation
% write equation in the form: f = p1*a1 + p2*a2
% write in the matrix representation
% solve "Normalengleichung": 
% p_estimated =
% inv(transpose(phi)*phi)*transpose(phi)*measured_values_matrix

% given measured data from voltage and current from diode
u = [0.45 0.5 0.6 0.7 0.75];
i = [2 3 4 6 8];

aux = ones(1,length(u));

% approximation
y_ln_i = log(i);
y_ln_i = transpose(y_ln_i);

% modell measured values
phi = [aux; u];
phi = transpose(phi);
phi_t = transpose(phi);

% solving "Normalengleichung"
p_estimated = inv(phi_t*phi)*phi_t*y_ln_i; 

% p1 = log (I_0)
p_estimated(1) = exp(p_estimated(1));

u_variable = 0:0.2:1;
i_with_parameters = p_estimated(1)*(exp(p_estimated(2)*u_variable)-1);

plot(u_variable,i_with_parameters);
grid on;