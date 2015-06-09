%% Aufgabe A1.0
% Bereich und Schrittweite setzen
X = -1:0.1:1;
Y = -1:0.1:1;

% Meshgrid erstellen
[x y] = meshgrid(X,Y);

% Gleichungen des Systems formulieren
dx = -2 * x + 2 * y;
dy = 3 * x - 4 * y;

% Plotten des Richtungsfeldes mit quiver
quiver(x ,y, dx, dy);

%% Aufgabe A1.1a
% Bereich und Schrittweite setzen
X = -1:0.1:1;
Y = -1:0.1:1;

% Meshgrid erstellen
[x y] = meshgrid(X,Y);

% Gleichungen der Systeme formulieren
dxa = -2 * x;
dya =  2 * y;

dxb = -1 * y;
dyb =  1 * x;

dxc = -2 * x;
dyc = 4 * x + 2 * y;

% Plotten der Richtungsfelder mit quiver
subplot(131);
quiver(x ,y, dxa, dya);
subplot(132);
quiver(x ,y, dxb, dyb);
subplot(133);
quiver(x ,y, dxc, dyc);