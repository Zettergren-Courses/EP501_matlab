% A script to demonstrate solutions to nonlinear equations on closed
% and open domains
%
% requires:  objfun?.m (set function pointer f to desired function at beginning of program)


%% Common setup for closed domain problems
maxit=100;       %maximum number of iterations allowed
f=@objfun1;      %set the function for which we are finding roots, change to illustrate different problems
fprime=@objfun1_deriv;
minx=0;          %interval over which we are finding root (closed domain problems)
maxx=2*pi;
tol=1e-9;        %how close to zero we need to get to cease iterations
x=linspace(minx,maxx,24);   %grid for basic plotting purposes
ygrid=f(x);
verbose=true;


%% Newton-Rhapson root-finding method
verbose=true;
[xNewton,itNew,flag]=newton_exact(f,fprime,-5*i,100,tol,verbose);
disp('Root value through Newton method:  ');
disp(xNewton);
disp('Number of iterations required to reach tolerance:  ');
disp(itNew);

[xNewton,itNew,flag]=newton_exact(f,fprime,5*i,100,tol,verbose);
disp('Root value through Newton method:  ');
disp(xNewton);
disp('Number of iterations required to reach tolerance:  ');
disp(itNew);


% %% Newton approach for suspected complex roots
% [xNewton,itNew]=newton_exact(f,fprime,7*i,100,tol,verbose);
% disp('Root value through Newton method:  ');
% disp(xNewton);
% disp('Number of iterations required to reach tolerance:  ');
% disp(itNew);
% 
% [xNewton,itNew]=newton_exact(f,fprime,-7*i,100,tol,verbose);
% disp('Root value through Newton method:  ');
% disp(xNewton);
% disp('Number of iterations required to reach tolerance:  ');
% disp(itNew);


%% Multidimensional function example
fm=@objfun2Df;
gm=@objfun2Dg;
gradfm=@grad_objfun2Df;
gradgm=@grad_objfun2Dg;

%this is for plotting
x=linspace(-1.5,1.5,20);
y=linspace(-1.5,1.5,20);
[X,Y]=meshgrid(x,y);
F=fm(X,Y);
G=gm(X,Y);


%% Newton's method for multi-variable nonlinear equations
x0=i;
y0=0.258*i;
[xm,ym,it2D,success2D]=newton2D_exact(fm,gradfm,gm,gradgm,x0,y0,100,1e-6,true);

figure;
surf(X,Y,F);
hold on;
surf(X,Y,G);
plot3(xm,ym,0,'wo','MarkerSize',32,'LineWidth',8);
