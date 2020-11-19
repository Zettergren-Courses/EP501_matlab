%% RK2 and systems of equations, oscillating charge example
% charged particle moving in the x-y direction in a magnetic field which
% has only a z-component...
%
% m dv/dt = q v x B 
% (ma = F)
%
% v = (vx,vy); B=(0,0,B);
%
% Resulting in the following system of equations:
%    m dvx/dt = q vy B
%    m dvy/dt = -q vx B

q=-1.6e-19;
m=9.1e-31;
B=10000e-9;
omega=q*B/m;    %frequency of oscillation (can be shown via solution by hand gives a SHO)
tmin=0;
tmax=2*2*pi/abs(omega);    % follow particle for two oscillation periods
t=linspace(tmin,tmax,50);
dt=t(2)-t(1);
lt=numel(t);

vx=zeros(1,lt);
vy=zeros(1,lt);
vx(1)=1e3;     % vx initial conditions
vy(1)=1e3;     % vy initial conditions
% Loop for applying RK2 to a system of two equations
for n=2:lt
    %step x and y components together, this is the half update
    vxhalf=vx(n-1)+dt/2*(omega*vy(n-1));
    vyhalf=vy(n-1)-dt/2*(omega*vx(n-1));
    
    %now the full update
    vx(n)=vx(n-1)+dt*(omega*vyhalf);
    vy(n)=vy(n-1)-dt*(omega*vxhalf);    
end %for


%Integrate velocity to get position as a fn. of time, this assumes that the
%particle is initially at x,y = (0,0)
x=cumtrapz(t,vx);    %Matlab built-in for accumulating an integral value
y=cumtrapz(t,vy);
vz=1e3;
z=vz*t;


% Plot velocity solutions
figure(1);
ax=plotyy(t,vx,t,vy);
set(ax(1),'FontSize',20);
set(ax(2),'FontSize',20);
xlabel('time (s)');
ylabel(ax(1),'v_x');
ylabel(ax(2),'v_y');

% Comet plot demo
figure(2);
comet3(x,y,z)
set(gca,'FontSize',20);
xlabel('x');
ylabel('y');
zlabel('z');