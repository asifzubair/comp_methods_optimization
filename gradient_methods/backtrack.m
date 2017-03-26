function t = backtrack(vfunc, gfunc, xk, dk, T)
%% Backtracking algorithm
    ALPHA = 0.5;
    BETA= 0.5;
    MAX_ITR = 100;
    R = -(gfunc(xk)'*dk)/(norm(gfunc(xk)));
    t = T;
    g1 = vfunc(xk + t*dk);
    h1 = vfunc(xk) - R*ALPHA*t*norm(gfunc(xk));
    itr = 1;
    while (g1 > h1 && itr < MAX_ITR)
t = BETA*t;
g1 = vfunc(xk + t*dk);
        h1 = (vfunc(xk) - R*ALPHA*t*norm(gfunc(xk)));
        itr = itr + 1;
end end