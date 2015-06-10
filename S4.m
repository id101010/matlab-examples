%% Aufgabe S4.1 
% Simulation eines fairen Würfels 

% Anzahl Sequenzen
n = 1000;

% RNG initialisiseren und n-mal würfeln
rng(42);
seq1 = random('unid', 6, [1 n]);

% RNG initialisiseren und nochmals n-mal würfeln
rng(42);
seq2 = random('unid', 6, [1 n]);

% Sequenzen vergleichen
all(seq1 == seq2)

%% Aufgabe S4.1
% Absolute und relative Häufigkeit einer 6 berechnen

% Anzahl Sequenzen
n = [10 50 100 1000];

% RNG initialisiseren und n-mal für verschiedene Sequenzen würfeln
rng(42);
seq1 = random('unid', 6, [1 n(1)]);
rng(42);
seq2 = random('unid', 6, [1 n(2)]);
rng(42);
seq3 = random('unid', 6, [1 n(3)]);
rng(42);
seq4 = random('unid', 6, [1 n(4)]);

% Absolute Wahrscheinlichkeit einer 6 berechnen
H1 = cumsum(seq1 == 6);
H2 = cumsum(seq2 == 6);
H3 = cumsum(seq3 == 6);
H4 = cumsum(seq4 == 6);

% relative Wahrscheinlichkeit einer 6 berechnen
h1 = H1./(1:n(1));
h2 = H2./(1:n(2));
h3 = H3./(1:n(3));
h4 = H4./(1:n(4));

%plot(1:n(1), h1, 'r');
%plot(1:n(2), h2, 'g');
%plot(1:n(3), h3, 'b');
plot(1:n(4), h4, 'y');

%% Aufgabe 4.2b
% Würfelsimulation

% rng initialisieren
rng(42);

% boolesche Sequenz mit der länge n erzeugen
n = 20;
v = (random('unid', 2, [1 n]) == 2); 

% Längste Teilsequenz von true-Werten finden
longestrun(v)

%% Aufgabe 4.2c
% Teilaufgabe b 1000x wiederholen und relative Häufigkeit für l = 7 bestimmen
n = 1000;
H = 0;

rng(42);

for i = 1:n
    v = (random('unid', 2, [1 20]) == 2);
    if(longestrun(v) > 7)
        H = H + 1;
    end
end

% Absolute Häufigkeit
display(H);
% Relative Häufigkeit
display(H/1000);

%% Aufgabe 4.2d
% Teilaufgabe b 1000x wiederholen und relative Häufigkeit für l = 7 bestimmen
n = 1000;
H1 = 0;
H2 = 0;
H3 = 0;
H4 = 0;

rng(42);

for i = 1:n
    v = (random('unid', 2, [1 20]) == 2);
    if(longestrun(v) > 7)
        H1 = H1 + 1;
    end
end

for i = 1:n
    v = (random('unid', 2, [1 30]) == 2);
    if(longestrun(v) > 7)
        H2 = H2 + 1;
    end
end

for i = 1:n
    v = (random('unid', 2, [1 50]) == 2);
    if(longestrun(v) > 7)
        H3 = H3 + 1;
    end
end

for i = 1:n
    v = (random('unid', 2, [1 400]) == 2);
    if(longestrun(v) > 7)
        H4 = H4 + 1;
    end
end

% Relative Häufigkeiten berechnen
h1 = H1/1000
h2 = H2/1000
h3 = H3/1000
h4 = H4/1000







