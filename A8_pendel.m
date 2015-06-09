%% Aufgabe 8.3a
% Anfangswertproblem: y'(t) = -2*ty²(t), y(0) = 1
% Aufgabe: Aproximation der Lsg im Intervall t = [0, 0.6]

% Interval
T = 0.6;

% Schrittweiten
h1 = 0.1; 
h2 = 0.01; 
h3 = 0.001;

% Schritte berechnen
t1 = 0:h1:T;
t2 = 0:h2:T;
t3 = 0:h3:T;

% Anzahl Schritte berechnen
n1 = length(t1);
n2 = length(t2);
n3 = length(t3);

% Array für Näherung mit Nullen auffüllen
y1 = zeros(1,n1);
y2 = zeros(n2,1);
y3 = zeros(n3,1);

% Anfangswerte
y1(1) = 1;
y2(1) = 1;
y3(1) = 1;

% Näherungen berechnen, mittels Eulerverfahren
for k = 1:n1-1
    y1(k+1) = y1(k) + h1*(-2*t1(k).*y1(k).^2);
end

for k = 1:n2-1
    y2(k+1) = y2(k) + h2*(-2*t2(k).*y2(k).^2);
end

for k = 1:n3-1
    y3(k+1) = y3(k) + h3*(-2*t3(k).*y3(k).^2);
end

% exakte Lösung des Problems
y_exact1 = 1./(1 + t1.^2);
y_exact2 = 1./(1 + t2.^2);
y_exact3 = 1./(1 + t3.^2);

% exakte Lösung plotten
subplot(121);
plot(t1, y_exact1, 'r');
hold on;
plot(t2, y_exact2, 'g');
hold on;
plot(t3, y_exact3, 'b');
title('exakte Lösungen');

% genäherte Lösungen plotten
subplot(122);
plot(t1, y1, 'r');
hold on;
plot(t2, y2, 'g');
hold on;
plot(t3, y3, 'b');
title('genäherte Lösungen');

%% Aufgabe 8.4a

% Pendel mit 750 iterationen
% ------------------------------------------------------------------------

% Schrittweite, anz Iterationen und Zeitvektor
h = 0.15;
n = 50;
t = 0:h:7.5;

% Variablen initialisieren
z1 = zeros(n,1);
z2 = zeros(n,1);

% Anfangswerte
z1(1) = pi/2;
z2(1) = 0;

% Iteration
for k = 1:n-1
    z1(k+1) = z1(k) + h.*z2(k);
    z2(k+1) = z2(k) + h.*(-10*sin(z1(k)) - 0.5.*z2(k));
end

subplot(121);

% Richtungsfeld zeichnen
X = -3:0.3:3;
Y = -7:0.3:7;
[x,y] = meshgrid(X,Y);
dx = y;
dy = -10.*sin(x) - 0.5.*y;
quiver(x, y, dx, dy, 2, 'r');
hold on;

% Pendel einzeichnen
plot(z1, z2, '-ok');
hold on;

title('Pendel mit 50 Iterationen');

% Pendel mit 750 iterationen
% ------------------------------------------------------------------------

% Schrittweite, anz Iterationen und Zeitvektor
h = 0.01;
n = 750;
t = 0:h:7.5;

% Variablen initialisieren
z1 = zeros(n,1);
z2 = zeros(n,1);

% Anfangswerte
z1(1) = pi/2;
z2(1) = 0;

% Iteration
for k = 1:n-1
    z1(k+1) = z1(k) + h.*z2(k);
    z2(k+1) = z2(k) + h.*(-10*sin(z1(k)) - 0.5.*z2(k));
end

subplot(122);

% Richtungsfeld zeichnen
X = -3:0.3:3;
Y = -7:0.3:7;
[x,y] = meshgrid(X,Y);
dx = y;
dy = -10.*sin(x) - 0.5.*y;
quiver(x, y, dx, dy, 2, 'r');
hold on;

% Pendel einzeichnen
plot(z1, z2, '-ok');
hold on;

title('Pendel mit 750 Iterationen');