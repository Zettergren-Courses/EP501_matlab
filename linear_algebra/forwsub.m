function x=forwsub(A)

% This function performs forward substitution on a lower triangular matrix


n=size(A,1);                   %number of unknowns in the system
x=zeros(n,1);                  %space in which to store our solution vector
x(1)=A(1,n+1)/A(1,1);          %finalized solution for last variable, resulting from upper triangular conversion

for ir1=2:n
    x(ir1)=A(ir1,n+1);       %assume we're only dealing with a single right-hand side here.
    fact=A(ir1,ir1);         %diagonal element to be divided through doing subs for the ir2 row
    for ic=ir1-1:-1:1
        x(ir1)=x(ir1)-A(ir1,ic)*x(ic);
    end %for
    x(ir1)=x(ir1)/fact;      %divide once at the end to minimize number of ops
end %for

end %function