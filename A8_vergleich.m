%% Aufgabe 8.5a
% Verlgiech Euler-, und Trapezverfahren an der Diffgl:
% y'(t) = 2y(t)+ln(t+1), y(0)=1, t = [0, 2]

% Intervall, Schrittweite, anzahl Schritte
T = 2;

h1 = 0.4;
t1 = 0:h1:T;
n1 = length(t1);

h2 = 0.04;
t2 = 0:h2:T;
n2 = length(t2);

h3 = 0.004;
t3 = 0:h3:T;
n3 = length(t3);

% Initialisierung der Variablen
euler1   = zeros(n1,1);
trapez1  = zeros(n1,1);

euler2   = zeros(n2,1);
trapez2  = zeros(n2,1);

euler3   = zeros(n3,1);
trapez3  = zeros(n3,1);

% Anfangswerte
euler1(1)   = 1;
trapez1(1)  = 1;

euler2(1)   = 1;
trapez2(1)  = 1;

euler3(1)   = 1;
trapez3(1)  = 1;

% Iteration mit euler und trapez
for k = 1:n1-1
	euler1(k+1)  = euler1(k) + h1.*(2.*euler1(k) + log(t1(k)+1));
    trapez1(k+1) = 1./(1-h1) .* (trapez1(k) + (h1./2).*(2.*trapez1(k) + log(t1(k)+1) + log(t1(k+1)+1)));
end

for k = 1:n2-1
	euler2(k+1)  = euler2(k) + h2.*(2.*euler2(k) + log(t2(k)+1));
    trapez2(k+1) = 1./(1-h2) .* (trapez2(k) + (h2./2).*(2.*trapez2(k) + log(t2(k)+1) + log(t2(k+1)+1)));
end

for k = 1:n3-1
	euler3(k+1)  = euler3(k) + h3.*(2.*euler3(k) + log(t3(k)+1));
    trapez3(k+1) = 1./(1-h3) .* (trapez3(k) + (h3./2).*(2.*trapez3(k) + log(t3(k)+1) + log(t3(k+1)+1)));
end

% Plotten der Werte
subplot(121);
plot(t1, euler1, 'o');
hold on;
subplot(121);
plot(t2, euler2, '*');
hold on;
subplot(121);
plot(t3, euler3, 'r-');
hold on;
title('Eulerverfahren');

subplot(122);
plot(t1, trapez1, 'o');
hold on;
subplot(122);
plot(t2, trapez2, '*');
hold on;
subplot(122);
plot(t3, trapez3, 'r-');
hold on;
title('Trapezverfahren');