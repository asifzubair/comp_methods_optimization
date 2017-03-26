function [a,b] = l1_reg(x, y)
    %% L1 Regression using Linear Programming
    n = length(x);
    c = [0 0 0 0 ones(1,2*n)]';
    A = [ones(n,1), -ones(n,1), x, -x, eye(n,n), -eye(n,n)];
    b = y;
    [S,bv] = basicsimplex(A, b, c, 5:n+4);
    a = S(1) - S(2);
    b = S(3) - S(4);  
end