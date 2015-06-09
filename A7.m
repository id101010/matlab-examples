% Gleichungssysteme
A = [0 2; -1 -3];
B = [-2 0 0 4; -1 -3 -1 0; -1 -1 -3 -4; 2 2 -2 -2];
C = [-1 2 -2; -2 -3 0; 0 -2 -1];
D = [1 4; -1 -3];
E = [2 2 -2; -5 -3 -3; -3 -5 -1];
F = [1 3 -1; -2 1 -3; -3 -4 -1];

%% Aufgabe 7.5a
A = [0 2; -1 -3];

% Bereich und Schrittweite setzen
X = -1:0.1:1;
Y = -1:0.1:1;

% Meshgrid erstellen
[x y] = meshgrid(X, Y);

dx = A(1,1) * x + A(1,2) * y
dy = A(2,1) * x + A(2,2) * y

quiver(a, b, dx, dy);

%% Aufgabe 7.5b
B = [-2 0 0 4; -1 -3 -1 0; -1 -1 -3 -4; 2 2 -2 -2];
n = size(B, 1);

% Bereich und Schrittweite setzen
X1 = -1:0.1:1;
X2 = -1:0.1:1;
X3 = -1:0.1:1;
X4 = -1:0.1:1;

% Meshgrid erstellen
[x1 x2] = meshgrid(X1, X2);
[x3 x4] = meshgrid(X3, X4);

dx1 = A(1,1) * x1 + A(1,2) * x2 + A(1,1) * x3 + A(1,2) * x4;
dx2 = A(2,1) * x1 + A(2,2) * x2 + A(1,1) * x3 + A(1,2) * x4;
dx3 = A(1,1) * x1 + A(1,2) * x2 + A(1,1) * x3 + A(1,2) * x4;
dx4 = A(1,1) * x1 + A(1,2) * x2 + A(1,1) * x3 + A(1,2) * x4;

subplot(121);
quiver(x1, x2, dx1, dx2);
title('erste Gleichung');

subplot(122);
quiver(x3, x4, dx3, dx4);
title('zweite Gleichung');
%quiver(x1, x2, dx1, dx2);