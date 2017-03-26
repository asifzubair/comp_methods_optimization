function [xs, v, g, itr] = fixed(vfunc, gfunc, alpha, x0, TOL, MAX_ITR)
%% Fixed-step algorithm implementation
    itr = 1;
    xk = x0;
    dk = -gfunc(xk);
    xk1 = xk + alpha*dk;
    while(norm(xk1 - xk)/norm(xk) > TOL && norm(dk) > TOL && itr < MAX_ITR)
        xk = xk1;
        dk = -gfunc(xk);
        xk1 = xk + alpha*dk;
        itr = itr + 1;
    end
    xs = xk1;
    v = vfunc(xs);
    g = gfunc(xs);
end