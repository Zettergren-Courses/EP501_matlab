%% Handling multiple time scales (ODE stiffness, book example from Gear's paper)
% dy/dx=-alpha*(y=F(t))+F'(t)
% y(t)=(y0-F(0))exp(-alpha*t)+F(t)
y0=1;
alpha=1000;
figure;

tsmin=0;
tsmax=4;
dts=0.002;
ts=tsmin:dts:tsmax;
ybar=(y0-2)*exp(-alpha*ts)+ts+2;
Ns=numel(ts);

plot(ts,ybar);
hold on;

yfwds=zeros(1,Ns);
yfwds(1)=y0;
ybwds=zeros(1,Ns);
ybwds(1)=y0;
for n=2:Ns
    yfwds(n)=yfwds(n-1)+dts*(-1000*(yfwds(n-1)-ts(n-1)-2)+1);
    ybwds(n)=(ybwds(n-1)+1000*ts(n-1)*dts+2001*dts)/(1+1000*dts);    
end %for
plot(ts,yfwds);
plot(ts,ybwds);
axis([0 4 1 6]);
set(gca,'FontSize',20);
legend('theory','fwd','bwd')


