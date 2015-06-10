%% Aufgabe S4.2a
% Longestrun bestimmt von einem booleschen Vektor die längste Teilsequenz
% von true-Werten.

function l = longestrun(v)
    l = 0;
    k = 0;
    last_true = false;
    
    for i = 1:length(v)
        if(v(i) == true && last_true == false)  % true und vorher false
            k = 1;      
            last_true = true;
        end
        if(v(i) == true && last_true == true)   % true und vorher true
            k = k + 1;                          % k inkrementieren
        end
        if(v(i) == false && last_true == true)  % false und vorher true
            if(l < k)                           % Wenn k länger als l
                l = k;                          % k nach l kopieren
            end
        end
    end
    if(l < k)                                   % falls sequenz nicht mit 
        l = k;                                  % false aufhört, noch check
    end
end