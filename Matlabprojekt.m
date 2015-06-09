function [  ] = a11_trapez()
    %runs some examples with our implementation and compares it against ode45
    run_compare(@(t,y)(2*y)             ,1, [0,10]   ,0.2);
    run_compare(@(t,y)(2*y+log(t+1))    ,1, [0,3]    ,0.04);
    run_compare(@(t,y)(t*sin(y)+cos(t)) ,2, [0,4]);    
end
 
 
function [] = run_compare (f,start,tlimit,step,eps)
     %Takes a differntial equation and approximates it's solution using our
     %implementation and ode45.
     %Parameters are equal to the ones of the trapez function below
 
     %Check input arguments and call trapez with the right number of arguments
     narginchk(3,5);
     if nargin==3
           [approx, t] = trapez(f,start,tlimit);
     elseif nargin==4
           [approx, t] = trapez(f,start,tlimit,step);
     elseif nargin==5
           [approx, t] = trapez(f,start,tlimit,step,eps);
     end
     
    [t_ode,approx_ode] = ode45(f,tlimit,start);  %Calulate solution using ode45
 
    %Plot
    figure;
    hold on;
    title(func2str(f));
    plot(t,approx,'x-');
    plot(t_ode,approx_ode,'x-');
    legend({'Trapez/Newton','Ode45'});
 
end
 
function [ approx, t ] = trapez( F, start, tlimit, step, eps )
    %Takes a differntial equation and approximates it's solution using trapez/newton
    % F must be a function handle so that y' = F(t,y)
    % start must contain the initial/starting conditions
    % limit must contain the start and end time
    % step is the optional stepsize for the trapezverfahren
    % eps is the optional precision for the newtonverfahren
   
    %check input arguments, assign default values if needed
    narginchk(3,5);
    if nargin==3
        step = 0.1; eps=0.01;
    elseif nargin==4
        eps=0.01;
    end
   
    %Symbolic Nullstellengleichung
    syms ykp tkp yk tk
    G=yk-ykp + step/2 .* (F(tk,yk) + F(tkp,ykp)); %"Nullstellengleichung" as symbolic expression
    g = diff(G,ykp); %derivative of it
   
    %Convert symbolic expr back into a matlab function with the input parameters ykp,tkp,yk,tk
    G = matlabFunction(G,'vars',[ykp,tkp,yk,tk]);
    g = matlabFunction(g,'vars',[ykp,tkp,yk,tk]);
   
    %Initialize output variables
    t = [tlimit(1):step:tlimit(2)]';
    approx = zeros(length(t),length(start));
    approx(1,:) = start';
   
    %Compute
    for i=2:length(t)
     tk = t(i-1);
     tkp = t(i);
     yk = approx(i-1,:);
     approx(i,:) = newton(@(x)(G(x,tkp,yk,tk)), @(x)(g(x,tkp,yk,tk)),yk,eps);
    end
   
end
 
function [x] = newton(F,f,x0,eps)
    %finds a zeropoint of F, where F is a function and f is it's derivative.
    %x0 is the starting point, and eps the maximal allowed distance from zero
    % example: newton(@(x)(sin(x)*2 +1),@(x)(2*cos(x)),0.9*pi,0.01)
    x=x0;
    while abs(F(x))>eps, % while F(x) is still to far away from zero
        x = x - F(x)./f(x); %calculate next x
    end
end