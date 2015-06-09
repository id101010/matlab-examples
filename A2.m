
%% Aufgabe A2.1a

% Gleichungssysteme
Ma = [-2 0; 0 2];
Mb = [-2 0; 4 2];
Mc = [0 1; -1 0];

% Berechnung der Eigenwerte
[Sa Da] = eig(Ma)
[Sb Db] = eig(Mb)
[Sc Dc] = eig(Mc)


%% Aufgabe A2.1b

% Gleichungssystem aus A1
A = [-2 2; 3 -4];

% Eigenwerte
[S D] = eig(A)

% Richtungsfeld Anzeigen
X = -1:0.1:1;
Y = -1:0.1:1;
[x y] = meshgrid(X, Y);
dx = -2*x + 2*y;
dy = 3*x -4*y;
quiver(x,y,dx,dy);
hold on;

% Eigenvektoren im Richtungsfeld einzeichnen
line([0 S(4)], [0 S(1)], 'Color', [0 1 0]);
line([0 -S(4)], [0 -S(1)], 'Color', [1 0 0]);

%% Aufgabe A2.2c

% Gleichungssystem für Anfangsbedingungen:
% / 1 1 0 \   / C1 \   /1\
% | 1 0 1 | * | C2 | = |2|
% \ 0 1 1 /   \ C3 /   \3/

% Gleichungssystem und Anfangsbedingungen definieren
M = [1 1 0; 1 0 1; 0 1 1];
y0 = [1;2;3];

% Matlab optimierter Lösungsalgorithmus
lsg = M \ y0;

display(lsg)

%% Aufgabe A2.2d
% Finde die allgemeine Lösung folgendes DGLS.

% Gleichungssystem
A = [ 2 -1  3  0  1;
     -1  1  1  2  0;
      3  1  2 -1  0;
      0  1 -1  0 -1;
      1  0  0 -1  2 ]; 

 [S D] = eig(A);
 
 % Allgemeine Lsg ergibt sich durch Aufsummieren der C*v*e^(lamda*t) Termen
 display(S)
 display(D)
 
 %% Aufgabe A2.3
 
A1 = [-1 1; -1 -1];
A2 = [1 4; -1 1];
 
X = -1:0.1:1;
Y = -1:0.1:1;
[x y] = meshgrid(X, Y);

dx1 = -x + y;
dy1 = -x - y;
dx2 = x + 4*y;
dy2 = -x + y;

subplot(121);
quiver(x,y,dx1,dy1);
subplot(122);
quiver(x,y,dx2,dy2);

%% Aufgabe A2.4a
% Lösung von Differenzalgleichungssystemen mittels
% Matrix-Exponentialfunktion. Dies gilt da:
% y(t) = e^at ist lsg von y'(t)=ay(t)

% Matrix
A = [-1 1 0; 0 -1 0; 0 0 -1]

% Anfangsbedingungen 
y0 = [1;1;1];

% Gefragte Zeit
t = 1.5;

% Matrix Exponentialfunktion anwenden und Lsg zur gwünschten Zeit mit den 
% gegebenen Anfangsbedingungen berechnen
Lsg = expm(A*1.5)*y0;

%% Aufgabe A2.4b
% Obige Aufgabe für mehrere Zeitpunkte im Bereich t = [0,3] berechnen
% Mittels 3D Plot darstellen

% Matrix und Anfangsbedingunen
A = [-1 1 0; 0 -1 0; 0 0 -1];
y0 = [1;1;1];

% Zeiten mit Schrittweitenparameter
n = 100;
t = linspace(0,3,n);

% Lösungen für verschiedene Zeiten berechnen
Lsg = zeros(3,n); % immer 3 Parameter

% Lösung iterativ bestimmen
for i = 1:n
    Lsg(:,i) = expm(t(i)*A)*y0;  
end

% 3D Plot
plot3(Lsg(1,:), Lsg(2,:), Lsg(3,:));
