%% Aufgabe 10.1
% Newtonapproximation

function [] = newton_approximation()
    
    % Funktionen definieren
    F1 = @(x) (cos(x) - x);
    f1 = @(x) (sin(x) - 1);
    F2 = @(x) (x^5 - x - 1/5);
    f2 = @(x) (5*x^4 - 1);
    
    % Approximative Lösungen bestimmen
    lsg1    = newton(F1, f1, 0, 0.01)
    lsg2_1  = newton(F2, f2, -2, 0.01)
    lsg2_2  = newton(F2, f2, -0.5, 0.01)
    lsg2_3  = newton(F2, f2, 1, 0.01)
    
    % Plotten und Lösung einzeichnen für F1
    subplot(121);
    fplot(F1, [-2, 2]);
    hold on;
    plot(lsg1, 0, 'rx')
    hold on;
    ylim([-0.5 2]);
    title('cos(x) - x = 0');
    
    % Plotten und Lösung einzeichnen für F2
    subplot(122);
    fplot(F2, [-2,2]);
    hold on;
    plot(lsg2_1, 0, 'rx')
    plot(lsg2_2, 0, 'rx')
    plot(lsg2_3, 0, 'rx')
    hold on;
    ylim([-3 3]);
    title('x⁵ - x - 1/5 = 0');
end

% Suche nach Nulldurchgang (Lösung) einer Funktion
% F     :   Funktion
% f     :   abgeleitete Funktion
% x0    :   Startwert
% eps   :   Maximale Abweichung
function [x] = newton(F, f, x0, eps)
    x = x0;                     % Anfangswert setzen
    
    while abs(F(x)) > eps,      % Solange Abweichung noch zu gross
        x = x - F(x)./f(x);     % Neuen Wert berechnen
    end
end

