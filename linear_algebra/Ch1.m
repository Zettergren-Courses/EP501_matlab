%% Solve a diagonally dominant system using Jacobi iteration
nit=10;
Ait=diag(-1*ones(nit-1,1),-1)+diag(-1*ones(nit-1,1),1)+diag(4*ones(nit,1),0);    %this must be diagonally dominant or else the method won't converge
%Ait=randn(nit,nit);    %see if code can detect non-diagonal dominance and exit gracefully...
x0=randn(nit,1);
bit=ones(nit,1);
tol=1e-9;
disp('Verbose Jacobi iterations:  ')
[xit,iterations]=Jacobi(x0,Ait,bit,tol,true);

disp('Solution with Jacobi iterations:  ')
disp(xit);
disp('Number of iterations required and tolerance:  ')
disp(iterations);
disp(tol);
disp('Matlab built-in solution:  ')
disp(Ait\bit);


%% Evaluate performance and scaling of Gaussian elimination by solving systems of different size
nvals=50:50:500;
testtimes=zeros(size(nvals));
lrep=1;     %how many times to repeat each test

disp('Start of tests of Gaussian-elimination scaling');
for in=1:numel(nvals)
    nlarge=nvals(in);
    Blarge=randn(nlarge,nlarge);
    blarge=randn(nlarge,1);
    
    for irep=1:lrep     %benchmark will repeat the same solution several times to eliminate random variations from CPU load, etc.
        tstart=cputime;
        [Blargemod,ordlarge]=Gauss_elim(Blarge,blarge);
        xlarge=backsub(Blargemod(ordlarge,:));
        tend=cputime;
        testtimes(in)=testtimes(in)+(tend-tstart)/lrep;
    end %for
    disp([' solution for system of size ',num2str(nlarge),' takes average time ',num2str(testtimes(in)),' s']);
end %for

figure(2);
plot(nvals,testtimes,'o','LineWidth',2,'MarkerSize',20,'MarkerFaceColor','blue')
xlabel('system size');
ylabel('time to solve (s)');
title('Empirical Performance of Gaussian Elimination');
