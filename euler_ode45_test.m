%% Aufgabe 8.9
% Implementation des expliziten Eulerverfahrens

% Testet das eulerverfahren gegen den od45-solver
function [ ] = euler_ode45_test()
    % Anfangswert, Schrittweite, Intervall
    y0 = 3;
    T = 8;
    h = 0.5;
    
    % Gleichung aufstellen
    fun = @(t,y) (t.*y./6);
    
    % Approximatives Lösen durch euler und Ode45
    [t, y] = eulerimpl(fun, h, T, y0);
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
function [t y] = eulerimpl(dgl, h, T, y0)

    t    = 0:h:T;       % Zeitvektor
    n    = length(t);   % Anzahl Schritte
    y    = zeros(n,1);  % Inizialisieren von y
    y(1) = y0;          % Startwert
    
    for k = 1:n-1
        y(k+1) = y(k) + h.*(dgl(t(k), y(k)));
    end 
end