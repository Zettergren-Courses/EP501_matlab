%% Illustration of stability
alpha2=10;
dtmargin=2/alpha2;
dtstable=1/10*dtmargin;
dtunstable=1.01*dtmargin;

dt2=dtunstable;
t2=0:dt2:5;
N=numel(t2);
y0=1;
y2bar=y0*exp(-alpha2*t2);

y2fwd=zeros(1,N);
y2fwd(1)=y0;
for n=2:N
    y2fwd(n)=y2fwd(n-1)*(1-alpha2*dt2);
end %for

figure(1);
clf;
plot(t2,y2bar,'o-');
xlabel('t');
ylabel('y(t)');
set(gca,'FontSize',20);
hold on;
plot(t2,y2fwd,'--');
legend('exact','fwd Eul')
hold off;


%% Illustration of convergence
%run the code above with finer mesh, etc.