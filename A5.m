%% Aufgabe A5.3a
% Bereich und Schrittweite setzen
X = -1:0.1:2;
Y = -1:0.1:3;

% Meshgrid erstellen
[x y] = meshgrid(X,Y);

% Gleichungen des Systems formulieren
% y1'(t) = (2 - y2(t)) * y1(t)
% y2'(t) = (1 + y1(t) - y2(t)) * y2(t)
dx = (2 - x) .* x; % Punktoperator!
dy = (1+x-y) .* y; % Punktoperator!

% Plotten des Richtungsfeldes mit quiver
quiver(x ,y, dx, dy, 4);

%% Aufgabe A5.3b
% Bereich und Schrittweite setzen
X = -1:0.1:3;
Y = -1:0.1:2;

% Meshgrid erstellen
[x y] = meshgrid(X,Y);

% Gleichungen des Systems formulieren
% y1'(t) = y1(t) - 2*y1(t)*y2(t)
% y2'(t) = 2*y1(t)*y2(t) - 3*y2(t))
dx = x - 2*x .* y       % Punktoperator!
dy = 2*x .* y - 3*y;    % Punktoperator!

% Plotten des Richtungsfeldes mit quiver
quiver(x ,y, dx, dy, 2);

xlim([-0.6,2.2]);
ylim([-0.8,1.2]);

%% Aufgabe A5.3c
% Bereich und Schrittweite setzen
X = -4:0.1:4;
Y = -4:0.1:4;

% Meshgrid erstellen
[x y] = meshgrid(X,Y);

% Gleichungen des Systems formulieren
dx = y;                   % Punktoperator!
dy = -10 .* sin(x) -2*y;  % Punktoperator!

% Plotten des Richtungsfeldes mit quiver
quiver(x ,y, dx, dy, 2);
