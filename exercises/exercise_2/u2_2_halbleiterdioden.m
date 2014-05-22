% % Prozess Identifikation 1
% % @file    u2_2_halbleiterdioden.m
% % @author  Marcos Pereira
% % @date    22.05.2014
% % @attention Copyright (C) 2014

u = [0.45 0.5 0.6 0.7 0.75];
i = [2 3 4 6 8];
temp = ones(1,length(u));

y_ln_i = log(i);
y_ln_i = transpose(y_ln_i);
phi = [temp; u];
phi = transpose(phi);
phi_t = transpose(phi);
p_estimated = inv(phi_t*phi)*phi_t*y_ln_i; 
p_estimated(1) = log(p_estimated(1));

u_variable = 0:0.2:1;
i_with_parameters = p_estimated(1)*(exp(p_estimated(2)*u_variable)-1);

plot(u_variable,i_with_parameters);