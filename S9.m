%% Aufgabe S9.2
% Würfelsimulation mit Mittelwertberechnung

% Seqenzlänge
n = [10 50 100];
% Anzahl Sequenzen
m = 1000;
% Vektor initialisieren
w = zeros(1, m);

% Für jede Sequenzlänge
for i = 1:length(n)
    % für jede Sequenz den Mittelwert berechnen
    for j = 1:m
        w(j) = mean(random('unid',6, [1 n(i)]));
    end
    
    % Plot
    subplot(1,3,i);
    hist(w);
    title('Sequenzlänge 10')
end

%% Aufgabe S9.3
% Konfidenzintervall eines Datenvektors x mit beliebigem Konfidenzniveau
% 1 - alpha berechnen.

x = [ 1 8 5 9 7 5 3 6 8 0 5 4 ];
alpha = 0.6;

q = icdf('norm', 1 - alpha/2, 0, 1); % Quantile der Normalverteilung
m = mean(x);
s = std(x);
n = length(x);

lower = m - q * s/sqrt(n);
upper = m + q * s/sqrt(n);