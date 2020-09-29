clear all
close all
clc
%loading data for problem
load C:\Users\Vittorio\EP501_assignments\assignments\HW2\iterative_testproblem.mat
%initial guess vector
x0=zeros(size(Ait,1),1);
%vector of omegas, in order to get the best one for the problem
%it was observed that solution could not converge for an omega over around
%1.35, and either way, iteration had an increasing trend
omega=linspace(1.01,1.32,80);

%% Part a) and b)
%for loop to calculate the SOR method solution for each omega
for k=1:length(omega)
    [x(:,k),nit(k)]=SOR_method(x0,Ait,bit,1e-8,omega(k));
end

%checking results with the built-in MatLab function
xcheck=Ait\bit;

%outputs
disp('SOR method solution:')
disp(x(:,1))
disp('Built-in MatLab solution:')
disp(xcheck)
%% Part c)
%minimum number of iteration needed
iter=min(nit);

%extracting the best omega, knowing the position of the minimum number of
%iterations used in the iteration array
for i=1:length(nit)
    if iter==nit(i)
        bestomega=omega(i);
        break
    end
end
%outputs
fprintf('The optimal value for omega is = %1.4f\n', bestomega)


%% Part d)
%Gauss-Seidel iteration (omega=1)
[xgauss,nitgauss]=SOR_method(x0,Ait,bit,1e-8,1);
diff=nitgauss-iter;
%checking which omegas do worse than Gauss-Seidel in terms of iterations
%needed
for i=1:length(nit)
    if nit(i)>nitgauss
        fprintf('Omega values over %1.4f do worse than the Gauss-Seidel method!\n',omega(i))
        fprintf('The SOR method takes %i iterations less than the Gauss-Seidel method\n',diff)
        break
    end
end