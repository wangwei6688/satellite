function output = gravity_torque(input)
R_O_B = input(1:3,1:3); % [-] Rotation Matrix from Body Frame to Orbit Frame
R     = input(1:3,4);   % [m] Satellite Position Vector in Inertial Frame

%% GLOBAL PARAMETERS
global CONST

I = CONST.I;     % [kgm^2] Spacecraft Moments of Inertia
mu = CONST.mu;   % [m^3/s^2] Earth's standard gravitational parameter

%% GRAVITY TORQUE 
R_B_O = R_O_B';                         % [-] Rotation Matrix from Orbit Frame to Body Frame
c3    = R_B_O(:,3);                      % [-] Obtain the Z-axis of Orbit Frame expressed into Body Frame
tau_g = 3*mu/(norm(R))^3*cross(c3,I*c3); % [Nm] Torque acting on the body 

output = tau_g;
end