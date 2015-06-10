%% Aufgabe 8.9c
% Implementation des RungeKutta Verfahrens

% Testet das RungeKutta gegen den od45-solver
function [ ] = rungekutte_ode45_test()
    % Anfangswert, Schrittweite, Intervall
    y0 = 3;
    T = 8;
    h = 0.5;
    
    % Gleichung aufstellen
    fun = @(t,y) (t.*y./6);
    
    % Approximatives Lösen durch rungekutta und Ode45
    [t, y] = rungekutta(fun, h, T, y0);
    [t_ode, y_ode] = ode45(fun, [0,8], y0);  
    
    % Plot
    plot(t, y , 'r-')
    hold on;
    plot(t_ode, y_ode, 'g-');
    hold on;
end

% Funktion erfordert: 
% Differentialgleichung     dgl (functionhandle)
% Schrittweite              h
% Obere Intervallgrenze     T
% Anfangswert               y0
function [t y] = rungekutta(dgl, h, T, y0)
    % Zeitvektor, Anzahl Iterationen, Anfangswert
    t = 0:h:T;
    n = length(t);
    y = zeros(1,n);
    y(1) = y0;

    for m = 1:n-1
        k1 = dgl(t(m),y(m));
        k2 = dgl(t(m)+h/2 , y(m) + (h/2)* k1);
        k3 = dgl(t(m)+h/2, y(m) + (h/2)* k2);
        k4 = dgl(t(m)+h, y(m) + h* k3);
        y(m+1) = y(m) + (h/6)*(k1 + 2*k2 +2* k3 + k4 );
    end
end