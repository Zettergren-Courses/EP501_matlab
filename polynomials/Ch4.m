%% Quick demo of Matlab random number generation features
figure;
uniform_noise=rand([10000,1]);
hist(uniform_noise,25);
xlabel('random number');
ylabel('# of occurences');

figure;
gaussian_noise=randn([10000,1]);
hist(gaussian_noise,25);
xlabel('random number');
ylabel('# of occurences');

%Create noise with a given standard deviation and mean
xmean=5;
xstdev=3;
gaussian_noise2=xstdev.*gaussian_noise+xmean;

figure;
hist(gaussian_noise2,25);
xlabel('random number');
ylabel('# of occurences');


%% Linear least squares example (fitting to a line - a first-order poly)
% y=a+b*x
n=100;
a=2;
b=3;
xdata=linspace(-5,5,n);         %independent variable
ynoise=8*randn(size(xdata));     %noise with standard dev. of 8, zero mean.
ytrue=a+b*xdata;
ydata=ytrue+ynoise;

%Plot of noisy data
figure;
plot(xdata,ytrue,'k-');
xlabel('x');
ylabel('y');
title('Illustrating a linear fit')
hold on;
plot(xdata,ydata,'o','MarkerSize',20);

%Set up the Jacobian for an elimination fit to a line
addpath ../linear_algebra/;
 
J=cat(2,ones(n,1),xdata(:));
M=J'*J;
yprime=J'*ydata(:);
[Mmod,ord]=Gauss_elim(M,yprime);
avec=backsub(Mmod(ord,:));
yfit=avec(1)+avec(2)*xdata;

rmpath ../linear_algebra/;

plot(xdata,yfit,'--');
legend('true function','data','linear fit');
hold off;


%% Illustration of bilinear interpolation, single interval of interest
x=[1,2];
y=[2,3];
f=[10, 11; 12, 13];
[X,Y]=meshgrid(x,y);
x1=1.5;
y1=2.5;

% Manually written
fvec=f(:);
xvec=X(:);
yvec=Y(:);
M=[ones(4,1),xvec(:),yvec(:),xvec(:).*yvec(:)];
avec=M\fvec;    %could be elimination or some other method...
finterpmanual=avec(1)+avec(2)*x1+avec(3)*y1+avec(4)*x1*y1;

% Matlab version
finterp=interp2(X,Y,f,x1,y1);


%% Illustrate cubic spline approximations using Matlab functions
x=linspace(-5,5,15);
y=sin(x);
plot(x,y,'o','MarkerSize',20);

splinedef=spline(x,y);
x2=linspace(min(x),max(x),256);
y2=ppval(splinedef,x2);
hold on;
plot(x2,y2,'.');

y2true=sin(x2);
plot(x2,y2true,'-');






