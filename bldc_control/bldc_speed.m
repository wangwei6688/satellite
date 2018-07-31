function out = bldc_speed(in)

f_a = in(1);
f_b = in(2); 
f_c = in(3);

i_a   = in(4);
i_b   = in(5); 
i_c   = in(6);

To    = in(7);
w_m   = in(8);

global CONST

kt = CONST.kt;     
J  = CONST.J; 
Cv = CONST.Cv;
Co = CONST.Co;

% Electrical Torque
Ta = kt*i_a*f_a;
Tb = kt*i_b*f_b;
Tc = kt*i_c*f_c; 

Te = Ta+Tb+Tc;

% Static Friction
if w_m < 0
    Co = -Co;
else if w_m == 0
        Co = 0;
     else
     end
end

    
% Mechanical Dynamics
wdot_m = 1/J*(Te-Co-Cv*w_m+To);

out(1,1) = wdot_m;
out(2,1) = Te;

end