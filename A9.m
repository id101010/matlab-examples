% Aufgabe 9.2
% Steife Differentialgleichung:
% y''(t)-a(1-y(t)²)*y'(t)+y(t) = 0

function [ ] = A9()
    dgl = @(t, y) (-4*(y - 2));
    tspan = [0 100];
    h = 0.52;
    T = 100;
    y0 = 1;

    [t_euler, y_euler]  = eulerimpl(dgl, h, T, y0); 
    [t_trap, y_trap]    = trapez(dgl, h, T, y0);  
    [t_runge, y_runge]  = rungekutta(dgl, h, T, y0);
    [t_ode, y_ode]      = ode45(dgl, [0,8], y0);  

    % Plot
    plot(t_euler, y_euler , 'r-')
    hold on;
    plot(t_ode, y_ode, 'g-');
    hold on;
    plot(t_trap, y_trap , 'b-')
    hold on;
    plot(t_runge, y_runge, 'g-');
    hold on;
end

function [t y] = eulerimpl(dgl, h, T, y0)

    t    = 0:h:T;       % Zeitvektor
    n    = length(t);   % Anzahl Schritte
    y    = zeros(n,1);  % Inizialisieren von y
    y(1) = y0;          % Startwert
    
    for k = 1:n-1
        y(k+1) = y(k) + h.*(dgl(t(k), y(k)));
    end 
end

function [t y] = trapez(dgl, h, T, y0)

    t    = 0:h:T;       % Zeitvektor
    n    = length(t);   % Anzahl Schritte
    y    = zeros(n,1);  % Inizialisieren von y
    y(1) = y0;          % Startwert
    
    for k = 1:n-1
        y(k+1) = y(k) + (h/2).*(y(k) + dgl(t(k),y(k)));
    end 
end

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