%% Illustrate vanilla forward elimination
nref=6;                %system size for larger reference problem
Aref=randn(nref,nref);    %augmented matrix containing RHS of system of equations, in practice you'd want to check conditioning...
bref=randn(nref,1);    %RHS


%% Use the Gaussian elimination function to solve the same system (include scaled pivoting)
[Amod,ord]=Gauss_elim(Aref,bref);

disp('Elimination with scaled pivoting on matrix:  ');
disp(Amod(ord,:));
xgauss=backsub(Amod(ord,:));
disp('Back substitution solution using Gaussian elimination result:  ');
disp(xgauss);


%% Print step by step solution (Gauss elimination) for a simple system to illustrate
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
[Amodsmall,ord]=Gauss_elim(A,b,true);
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');


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
