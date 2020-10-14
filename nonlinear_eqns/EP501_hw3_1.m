%% EP 501 - Numerical Methods
%% Homework 3
% Vittorio Baraldi

clear all; close all; clc

%% Ex. 1
%% Part a) and b)

%array to evaluate bessel function with
x=[0:0.1:80];
%bessel function
J=besselj(0,x);

%plot
figure(1)
plot(x,J)
xlabel('x');
ylabel('J_\nu(x)');
hold on
%getting point from click on the plot
[x0,y0]=ginput(1);

%initial number of iterations
it=1;
%max number of iterations allowed
maxit=600;
%tolerance to achieve
tol=1e-6;
%random value to numerically estimate derivative
epsilon=.1;
root(1)=x0;
root=x0;
fval=besselj(0,root);
converged=false;
while(~converged && it<=maxit) %newton method cycle
    %derivative evaluation
    fprime=(besselj(0,root+epsilon)-besselj(0,root))/epsilon;
    derivative=fprime;
    if (abs(derivative)<100*tol) 
        converged=false; %checking for convergence
        warning(' Derivative close to zero, terminating iterations with failed convergence... ');
        break;
    else
        root=root-fval./derivative; %update root estimate
        fval=besselj(0,root);       %update function               
        it=it+1;
        converged=abs(fval)<tol;    %checking distance from zero
    end %if
end %while
it=it-1;
solution1=root;
if (~converged)
    warning('Used max number of iterations, or derivative near zero...')
end %if

%% Part c)
for i=1:6
    %getting points from first 6 clicks on the plot
    [x0(i),y0(i)] = ginput(1);
     
end
hold off

%from now on, the same procedure as the above Newton method is applied
%using a for cycle in order to evaluate the closest zero for each initial
%guess
for i=1:6
    it=1;
    maxit=600;
    tol=1e-6;
    epsilon=.1;
    root(1)=x0(i);
    root=x0(i);
    fval=besselj(0,root);
    converged=false;
    while(~converged && it<=maxit)
        fprime=(besselj(0,root+epsilon)-besselj(0,root))/epsilon;
        derivative=fprime;
        if (abs(derivative)<100*tol) 
            converged=false;
            warning(' Derivative close to zero, terminating iterations with failed convergence... ');
            break;
        else
            root=root-fval./derivative;
            fval=besselj(0,root);                 
            it=it+1;
            converged=abs(fval)<tol;
        end %if
    end %while
    it=it-1;
    solution2(i)=root;
    if (~converged)
        warning('Used max number of iterations, or derivative near zero...')
    end %if
end %for

%% Solutions

disp('First root of Bessel function of order 0:')
disp(solution1);
disp('First 6 roots of Bessel function of order 0:')
disp(solution2);

%% Final comments
%{
Roots are verified to be correct (see reference below). The success of this
iteration procedure is strictly related to wether the user will pick a
good initial guess or not. Nevertheless, this seems to be the easiest and
most practical procedure.
Although the roots are not found with a pure computational procedure (it
requires indeed the user action), being the Bessel function a periodic
function, it should make it easier to the user to evaluate decent inital
guesses for the roots evaluation.

References
- Abramowitz, M. and Stegun, I. A. (Eds.). "Zeros." §9.5 in Handbook of
Mathematical Functions with Formulas, Graphs, and Mathematical Tables,
9th printing. New York: Dover, pp. 370-374, 1972.
- Olver, F. W. J. (Ed.). "Zeros and Associated Values." Royal Society
Mathematical Tables, Vol. 7: Bessel Functions. Cambridge, England:
Cambridge University Press, 1960.
%}