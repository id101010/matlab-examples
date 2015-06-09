%% Aufgabe 6.1
% 1. Ansatz in Gleichung einsetzen
% 2. Durch koeffizientenvgl. zwei Gleichungssysteme bilden
%       A[a1;a2] + [b1;b2] = [-1;0]
%       A[b1;b2] - [a1;a2] = [0;0]
% 3. Lösen des gesamten Gleichungssystems
%       / -2  2  1  0 \   / a1 \   /-1 \
%       |  3 -4  0  1 | * | a2 | = | 0 |
%       | -1  0 -2  2 |   | b1 |   | 0 |
%       \  0 -1  3 -4 /   \ b2 /   \ 0 /

B   = [-2  2  1  0; 3 -4  0  1; -1  0 -2  2; 0 -1  3 -4];
Lsg = [-1; 0; 0; 0];
X = B \ Lsg

%% Aufgabe 6.3b

A = [0 0 1 0; 0 0 0 1; -12 2 0 0; 2 -12 0 0];
[S D] = eig(A)