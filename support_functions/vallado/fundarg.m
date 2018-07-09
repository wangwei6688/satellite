function [ l, l1, f, d, omega, lonmer, lonven, lonear, lonmar, lonjup...
            , lonsat, lonurn, lonnep, precrate ...
         ] = fundarg( ttt, opt )
     
%  this function calulates the delauany variables and planetary values for
%  several theories.
%
% inputs          description                    range / units
%	ttt         - julian centuries of tt since J2000
%	opt         - method option                  '10', '02', '96', '80'
%
% outputs   
% 	l           [rad] - delaunay element Mean Anomaly of the Moon               
% 	ll          [rad] - delaunay element Mean Anomaly of the Sun               
%	f           [rad] - delaunay element Mean Longitude of the Moon - Mean Longitude of the Ascending Node of the Moon              
%	d           [rad] - delaunay element Mean Elongation of the Moon from the Sun              
%	omega       [rad] - delaunay element Mean Longitude of the Ascending Node of the Moon              
% 	lonmer      [rad]   
%   lonven
%   lonear
%   lonmar
%   lonjup
%   lonsat
%   lonurn
%   lonnep
%   precrate
%
% references    : vallado       2004, 212-214
% author        : rusty
deg2rad = pi/180.0;

ttt2 = ttt*ttt;
ttt3 = ttt2*ttt;
ttt4 = ttt2*ttt2;

% IAU 2010 theory
if opt == '10'
    % Delaunay fundamental arguments in deg
    l    =  134.96340251  + ( 1717915923.2178 *ttt + ...
             31.8792 *ttt2 + 0.051635 *ttt3 - 0.00024470 *ttt4 ) / 3600.0;
    l1   =  357.52910918  + (  129596581.0481 *ttt - ...
              0.5532 *ttt2 - 0.000136 *ttt3 - 0.00001149*ttt4 )  / 3600.0;
    f    =   93.27209062  + ( 1739527262.8478 *ttt - ...
             12.7512 *ttt2 + 0.001037 *ttt3 + 0.00000417*ttt4 )  / 3600.0;
    d    =  297.85019547  + ( 1602961601.2090 *ttt - ...
              6.3706 *ttt2 + 0.006593 *ttt3 - 0.00003169*ttt4 )  / 3600.0;
    omega=  125.04455501  + (   -6962890.5431 *ttt + ...
              7.4722 *ttt2 + 0.007702 *ttt3 - 0.00005939*ttt4 )  / 3600.0;

    % Planetary arguments in deg
    lonmer  = 252.250905494  + 149472.6746358  *ttt;
    lonven  = 181.979800853  +  58517.8156748  *ttt;
    lonear  = 100.466448494  +  35999.3728521  *ttt;
    lonmar  = 355.433274605  +  19140.299314   *ttt;
    lonjup  =  34.351483900  +   3034.90567464 *ttt;
    lonsat  =  50.0774713998 +   1222.11379404 *ttt;
    lonurn  = 314.055005137  +    428.466998313*ttt;
    lonnep  = 304.348665499  +    218.486200208*ttt;
    precrate=   1.39697137214*ttt + 0.0003086*ttt2;
end;

% IAU 2000b theory
        if opt == '02'
            % ------ form the delaunay fundamental arguments in deg
            l    =  134.96340251  + ( 1717915923.2178 *ttt ) / 3600.0;
            l1   =  357.52910918  + (  129596581.0481 *ttt ) / 3600.0;
            f    =   93.27209062  + ( 1739527262.8478 *ttt ) / 3600.0;
            d    =  297.85019547  + ( 1602961601.2090 *ttt ) / 3600.0;
            omega=  125.04455501  + (   -6962890.5431 *ttt ) / 3600.0;

            % ------ form the planetary arguments in deg
            lonmer  = 0.0;
            lonven  = 0.0;
            lonear  = 0.0;
            lonmar  = 0.0;
            lonjup  = 0.0;
            lonsat  = 0.0;
            lonurn  = 0.0;
            lonnep  = 0.0;
            precrate= 0.0;
         end; 

% IAU 1986 theory     
if opt == '96'
    
    % Delaunay Elements in deg
    l    =  134.96340251  + ( 1717915923.2178 *ttt + ...
             31.8792 *ttt2 + 0.051635 *ttt3 - 0.00024470 *ttt4 ) / 3600.0;
    l1   =  357.52910918  + (  129596581.0481 *ttt - ...
              0.5532 *ttt2 - 0.000136 *ttt3 - 0.00001149*ttt4 )  / 3600.0;
    f    =   93.27209062  + ( 1739527262.8478 *ttt - ...
             12.7512 *ttt2 + 0.001037 *ttt3 + 0.00000417*ttt4 )  / 3600.0;
    d    =  297.85019547  + ( 1602961601.2090 *ttt - ...
              6.3706 *ttt2 + 0.006593 *ttt3 - 0.00003169*ttt4 )  / 3600.0;
    omega=  125.04455501  + (   -6962890.2665 *ttt + ...
              7.4722 *ttt2 + 0.007702 *ttt3 - 0.00005939*ttt4 )  / 3600.0;
          
    % Planetary arguments in deg
    lonmer  = 0.0;
    lonven  = 181.979800853  +  58517.8156748  *ttt;   % deg
    lonear  = 100.466448494  +  35999.3728521  *ttt;
    lonmar  = 355.433274605  +  19140.299314   *ttt;
    lonjup  =  34.351483900  +   3034.90567464 *ttt;
    lonsat  =  50.0774713998 +   1222.11379404 *ttt;
    lonurn  = 0.0;
    lonnep  = 0.0;
    precrate=   1.39697137214*ttt + 0.0003086*ttt2;
end; 

% IAU 1980 theory
if opt == '80'
    l = ((((0.064) * ttt + 31.310) * ttt + 1717915922.6330) * ttt) / 3600.0 + 134.96298139;
    l1 = ((((-0.012) * ttt - 0.577) * ttt + 129596581.2240) * ttt) / 3600.0 + 357.52772333;
    f = ((((0.011) * ttt - 13.257) * ttt + 1739527263.1370) * ttt) / 3600.0 + 93.27191028;
    d = ((((0.019) * ttt - 6.891) * ttt + 1602961601.3280) * ttt) / 3600.0 + 297.85036306;
    omega = ((((0.008) * ttt + 7.455) * ttt - 6962890.5390) * ttt) / 3600.0 + 125.04452222;

    % ------ form the planetary arguments in deg
    lonmer  = 252.3 + 149472.0 *ttt;
    lonven  = 179.9 +  58517.8 *ttt;   % deg
    lonear  =  98.4 +  35999.4 *ttt;    
    lonmar  = 353.3 +  19140.3 *ttt;
    lonjup  =  32.3 +   3034.9 *ttt;
    lonsat  =  48.0 +   1222.1 *ttt;
    lonurn  =   0.0;
    lonnep  =   0.0;
    precrate=   0.0;
end;  
% OUTPUT
l    = rem( l,360.0  )     * deg2rad; % [rad]
l1   = rem( l1,360.0  )    * deg2rad; % [rad]
f    = rem( f,360.0  )     * deg2rad; % [rad]
d    = rem( d,360.0  )     * deg2rad; % [rad]
omega= rem( omega,360.0  ) * deg2rad; % [rad]

lonmer= rem( lonmer,360.0 ) * deg2rad; % [rad]
lonven= rem( lonven,360.0 ) * deg2rad; % [rad]
lonear= rem( lonear,360.0 ) * deg2rad; % [rad]
lonmar= rem( lonmar,360.0 ) * deg2rad; % [rad]
lonjup= rem( lonjup,360.0 ) * deg2rad; % [rad]
lonsat= rem( lonsat,360.0 ) * deg2rad; % [rad]
lonurn= rem( lonurn,360.0 ) * deg2rad; % [rad]
lonnep= rem( lonnep,360.0 ) * deg2rad; % [rad]
precrate= rem( precrate,360.0 ) * deg2rad; % [rad]
     
     
end