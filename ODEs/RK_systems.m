%% RK2 and systems of equations, oscillating charge example
q=-1.6e-19;
m=9.1e-31;
B=10000e-9;
omega=q*B/m;
tmin=0;
tmax=2*2*pi/abs(omega);
t=linspace(tmin,tmax,50);
dt=t(2)-t(1);
lt=numel(t);

vx=zeros(1,lt);
vy=zeros(1,lt);
vy(1)=1e3;
vx(1)=1e3;
for n=2:lt
    %step x and y components together, this is the half update
    vxhalf=vx(n-1)+dt/2*(omega*vy(n-1));
    vyhalf=vy(n-1)-dt/2*(omega*vx(n-1));
    
    %now the full update
    vx(n)=vx(n-1)+dt*(omega*vyhalf);
    vy(n)=vy(n-1)-dt*(omega*vxhalf);    
end %for
figure;
ax=plotyy(t,vx,t,vy);
set(ax(1),'FontSize',20);
set(ax(2),'FontSize',20);
xlabel('time (s)');
ylabel(ax(1),'v_x');
ylabel(ax(2),'v_y');


%integrate velocity to get position as a fn. of time
x=cumtrapz(t,vx);    %Matlab built-in for accumulating an integral value
y=cumtrapz(t,vy);
vz=1e3;
z=vz*t;

%comet plot demo
figure;
comet3(x,y,z)
set(gca,'FontSize',20);
xlabel('x');
ylabel('y');
zlabel('z');