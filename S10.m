%% Aufgaben S10 Beispiel 1

% Müsliabfülldaten Daten
x = [514 510 497 508 496 517 503 504 498 515 506 510];

% t-Test durchführen
[h, p] = ttest(x, 500)

%% Aufgabe S10.1
% Mit Matlab Funktionen

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

%% Aufgabe S10.1
% Explizit

% Ohmmeter A
A = [120 265 157 187 219 288 156 205 163];
% Ohmmeter B
B = [127 281 160 185 220 298 167 203 171];
% Daten zusammenführen
z = A - B;

% Signifikanzlevel und Nullhypothese wählen
alpha   = 0.05;
nullhyp = 0;
n       = length(z);

% Teststatistik
T = (mean(z) - nullhyp)/(std(z)/sqrt(length(z)));

% p-Wert
p = 2 * (1 - cdf('t', abs(T), n-1));

% Testentscheid
if(p >= alpha)
    disp('Nullhypothese bleibt, keine Überschreitungen nachweisbar');
end
if(p <= alpha)
    disp('Nullhypothese wird verworfen');
end

%% Aufgabe S10.2
% Kläranlagentest, 16 unterschiedliche Proben
% x_mean = 204.2
% x_stdabw = 9.8
% Grenzwert = 200, 1% Signifikanzniveau

xmean   = 204.2;
s       = 9.8;
n       = 16;
u       = 200; % Nullhypothese

T = (xmean - u) / (s / sqrt(n));
p = 1 - cdf('t', T, n-1)

if(p >= alpha)
    disp('Nullhypothese bleibt, keine Überschreitungen nachweisbar');
end
if(p <= alpha)
    disp('Nullhypothese wird verworfen');
end

%% Aufgabe S10.3

% Nullhypothese H0 : u <= 1/2

X = 16;
n = 22;
alpha1 = 5/100;
alpha2 = 1/100;

p = 1 - cdf('bino', X-1, n, 1/2);

if(p >= alpha2)
    disp('Nullhypothese bleibt, Münze fair (1% Signifikanzniveau)');
end
if(p <= alpha2)
    disp('Nullhypothese wird verworfen, Münze unfair (1% Signifikanzniveau)');
end

if(p >= alpha1)
    disp('Nullhypothese bleibt, Münze fair (5% Signifikanzniveau)');
end
if(p <= alpha1)
    disp('Nullhypothese wird verworfen, Münze unfair (5% Signifikanzniveau)');
end

%% Aufgabe S10.5

d       = [7.62 8.00 9.09 6.06 1.39 16.07 8.40 8.89 2.88];
d_mean  = mean(d);
alpha   = 1/100;
s       = std(d);
u       = 4;
n       = 9;

% Teststatistik
T = (d_mean - u) / (s / sqrt(n));

% p-Wert (zweiseitiger Test)
p = 2*(1 - cdf('t', abs(T), n-1))

if(p >= alpha)
    disp('Nullhypothese bleibt (1% Signifikanzniveau)');
end
if(p <= alpha)
    disp('Nullhypothese wird verworfen (1% Signifikanzniveau)');
end