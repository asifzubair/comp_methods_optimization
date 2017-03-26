function [a,b] = l2_reg(x,y)
    %% L2 Regression
    m = length(x);
    X = [ones(m,1) x];
    beta = (X'*X) \ X' * y;
    a = beta(1);
    b = beta(2);
end