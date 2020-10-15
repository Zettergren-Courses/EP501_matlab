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






