%% Illustrate vanilla forward elimination
nref=6;                 %system size for larger reference problem
A=randn(nref,nref);    %augmented matrix containing RHS of system of equations, in practice you'd want to check conditioning...
b=randn(nref,1);    %RHS


%% Use the Gaussian elimination function to solve the same system (include scaled pivoting)
[Amod,ord]=Gauss_elim(A,b);

disp('Elimination with scaled pivoting on matrix:  ');
disp(Amod(ord,:));
xgauss=backsub(Amod(ord,:));
disp('Back substitution solution using Gaussian elimination result:  ');
disp(xgauss);


% %% Print step by step solution (Gauss elimination) for a simple system to illustrate
% disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
% [Amodsmall,ord]=Gauss_elim(A,b,true);
% disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');


%% Compare against built in MATLAB solution
xmat=A\b;
disp('Built-in MATLAB solution');
disp(xmat);