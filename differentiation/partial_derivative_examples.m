%% Multidimensional function and partial derivatives:  grad and div (laplacian and curl also useful)
lx=20;
ly=20;
x=linspace(-5,5,lx);
y=linspace(-5,5,ly);
[X,Y]=meshgrid(x,y);
f=exp(-(X.^2)/2/2).*exp(-Y.^2/2/1);

figure;
contourf(x,y,f);
xlabel('x');
ylabel('y');
title('f(x,y) and grad(f)');
colorbar;

%gradient of scalar function
dx=x(2)-x(1);
dy=y(2)-y(1);


%% Gradient
gradx=zeros(size(f));
grady=zeros(size(f));

%x component of gradient
gradx(:,1)=(f(:,2)-f(:,1))/dx;
for ix=2:lx-1
    gradx(:,ix)=(f(:,ix+1)-f(:,ix-1))/2/dx;    %\partial/\partial x
end %for
gradx(:,lx)=(f(:,lx)-f(:,lx-1))/dx;

%y component of gradient
grady(1,:)=(f(2,:)-f(1,:))/dy;
for iy=2:ly-1
    grady(iy,:)=(f(iy+1,:)-f(iy-1,:))/2/dy;    %\partial/\partial y
end %for
grady(ly,:)=(f(ly,:)-f(ly-1,:))/dy;

%add quiver on top of color plot
hold on;
quiver(X,Y,gradx,grady,'Color','white','LineWidth',2);
set(gca,'FontSize',24);


%% Take the Laplacian by taking divergence of the previously computed gradient
f=gradx;
g=grady;

%x-derivative part of the divergence
divx=zeros(size(f));
divx(:,1)=(f(:,2)-f(:,1))/dx;
for ix=2:lx-1
    divx(:,ix)=(f(:,ix+1)-f(:,ix-1))/2/dx;
end %for
divx(:,lx)=(f(:,lx)-f(:,lx-1))/dx;

%y-derivative part of the divergence
divy=zeros(size(y));
divy(1,:)=(g(2,:)-g(1,:))/dy;
for iy=2:ly-1
    divy(iy,:)=(g(iy+1,:)-g(iy-1,:))/2/dy;
end %for
divy(ly,:)=(g(ly,:)-g(ly-1,:))/dy;

div=divx+divy;    %this is really laplacian b/c input is gradient

figure;
surface(x,y,div);
set(gca,'FontSize',24);
xlabel('x');
ylabel('y');
title('laplacian(f)');
colorbar;
