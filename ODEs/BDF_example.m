%% Handling multiple time scales (ODE stiffness, book example from Gear's paper)
%
% dy/dt=-alpha*(y=F(t))+F'(t)
% y(t)=(y0-F(0))exp(-alpha*t)+F(t)

y0=1;
alpha=1000;
figure;

%% Time grid
tsmin=0;
tsmax=4;
dts=0.02;      % choice of time step
ts=tsmin:dts:tsmax;


%% True solution
ybar=(y0-2)*exp(-alpha*ts)+ts+2;
Ns=numel(ts);


%% Forward and Backward Euler (in one loop)
yfwds=zeros(1,Ns);
yfwds(1)=y0;
ybwds=zeros(1,Ns);
ybwds(1)=y0;
for n=2:Ns
    yfwds(n)=yfwds(n-1)+dts*(-1000*(yfwds(n-1)-ts(n-1)-2)+1);
    ybwds(n)=(ybwds(n-1)+1000*ts(n-1)*dts+2001*dts)/(1+1000*dts);    
end %for


%% Compare different solutions
plot(ts,ybar);
hold on;
plot(ts,yfwds);
plot(ts,ybwds);
xlabel('time')
ylabel('y(t)')
axis([0 4 1 6]);
set(gca,'FontSize',20);
legend('true','fwd','bwd','Location','SouthEast')


