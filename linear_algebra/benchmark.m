% Evaluate performance and scaling of Gaussian elimination by solving systems of different size

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
