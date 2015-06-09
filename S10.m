%% Beispiel 1

% Müsliabfülldaten Daten
x = [514 510 497 508 496 517 503 504 498 515 506 510];

% t-Test durchführen
[h, p] = ttest(x, 500)

%% Aufgabe 10.1

% Ohmmeter A
A = [120 265 157 187 219 288 156 205 163];
% Ohmmeter B
B = [127 281 160 185 220 298 167 203 171];

% Signifikanzlevel und Nullhypothese wählen
alpha = 0.05;
nullhyp = 0;

% Daten zusammenführen
z = A - B;

% t-Test durchführen
%[h, p] = ttest(A, B, 'Alpha', alpha)
[h, p] = ttest(z, nullhyp, 'Alpha', alpha)