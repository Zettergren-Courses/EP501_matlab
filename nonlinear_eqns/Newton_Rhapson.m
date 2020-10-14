% A script to demonstrate solutions to nonlinear equations on closed
% and open domains
%
% requires:  objfun?.m (set function pointer f to desired function at beginning of program)


%% Params for Newton iteration
maxit=100;       %maximum number of iterations allowed
minx=-10;
maxx=10;
tol=1e-9;        %how close to zero we need to get to cease iterations


%% Objective function defs.
f=@objfun3;      %set the function for which we are finding roots, change to illustrate different problems
fprime=@objfun3_deriv;
x=linspace(minx,maxx,64);   %grid for basic plotting purposes
ygrid=f(x);
verbose=true;


%% Plot the function we are finding roots for
figure(1);
plot(x,ygrid);
title('Objective function')
xlabel('x')
ylabel('y')
axis tight;


%% Newton-Rhapson root-finding method
% verbose=true;
% [xNewton,itNew,flag]=newton_exact(f,fprime,0,100,tol,verbose);
% disp('Root value through Newton method:  ');
% disp(xNewton);
% disp('Number of iterations required to reach tolerance:  ');
% disp(itNew);

[xNewton,itNew,flag]=newton_exact(f,fprime,-2*1i,100,tol,verbose);
disp('Root value through Newton method:  ');
disp(xNewton);
disp('Number of iterations required to reach tolerance:  ');
disp(itNew);

% [xNewton,itNew,flag]=newton_exact(f,fprime,5,100,tol,verbose);
% disp('Root value through Newton method:  ');
% disp(xNewton);
% disp('Number of iterations required to reach tolerance:  ');
% disp(itNew);
