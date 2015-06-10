%% Aufgabe S5.1

% Gleichverteilung
pdf('unid', 4, 6) % Wahrscheinlichkeit, dass ein fairer Würfel genau eine 4 Würfelt
cdf('unid', 4, 6) % Wahrscheinlichkeit, dass ein fairer Würfel höchstens eine 4 Würfelt

% Binomialverteilung
% Beispiel: Tischtennisturnier mit 3 Runden, Spieler A gewinnt 60% aller Spiele

random('bino', 3, 0.6, [1 12]) % Sequenz von Gewinnzahlen dieses Spiels
cdf('bino', 1, 3, 0.6) % Wahrscheinlichkeit dass Spieler A gewinnt
pdf('bino', 3, 3, 0.6) % Wahrscheinlichkeit dass Spieler A alle Spiele gewinnt

%% Aufgabe S5.3
% Fairer Würfel wird 100-mal geworfen

% a)
pdf('bino', 0, 100, 1/6) % keine 6
% b)
pdf('bino', 1, 100, 1/6) % genau eine 6
% c)
pdf('bino', 2, 100, 1/6) % genau zwei 6
% d)
pdf('bino', 37, 100, 1/6) % genau 37 mal 6
% e)
pdf('bino', 63, 100, 1/6) % genau 63 mal 6

%% Aufgabe S5.4
% Unfaire Münze, 100 Würfe, 52% chance auf Kopf

% a)
pdf('bino', 0, 100, 0.52) % nie Kopf
% b)
pdf('bino', 1, 100, 0.52) % genau einmal Kopf
% c)
cdf('bino', 45, 100, 0.52) % höchstens 45x Kopf
% c)
cdf('bino', 55, 100, 0.52) % höchstens 55x Kopf

%% Aufgabe S5.5

Y = random('bino', 8, 0.5, [1 10]);
stem(Y)
stairs(Y)

Y = random('poiss', 0.5, [1 5])
stem(Y)
stairs(Y)