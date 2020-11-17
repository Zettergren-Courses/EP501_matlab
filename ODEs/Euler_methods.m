%% Gridding in time
N=25;
tmin=0;
tmax=6;
t=linspace(tmin,tmax,N);
dt=t(2)-t(1);


%% Test problem analytical solution
y0=1;
alpha=2;
ybar=y0*exp(-alpha*t);


%% Forward Euler solution
yfwd=zeros(1,N);
yfwd(1)=y0;
for n=2:N
    yfwd(n)=yfwd(n-1)*(1-alpha*dt);
end %for


%% Backward Euler solution
ybwd=zeros(1,N);
ybwd(1)=y0;
for n=2:N
    ybwd(n)=ybwd(n-1)/(1+alpha*dt);
end %for


%% Plot results for all solutions
figure(1);
plot(t,ybar,'o-');
xlabel('t');
ylabel('y(t)');
set(gca,'FontSize',20);
hold on;
plot(t,yfwd,'--');
plot(t,ybwd,'-.');
legend('exact','fwd Eul.','bwd Eul.')