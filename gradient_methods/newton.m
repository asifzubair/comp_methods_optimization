function [xs, v, g, itr] = newton(vfunc, gfunc, hfunc, x0, TOL, MAX_ITR)
%%  Newton's method algorithm implementation
    xk = x0;
    dk = -inv(hfunc(xk))*gfunc(xk);
    ndk = norm(dk);
    tk = backtrack(vfunc, gfunc, xk, dk/ndk, ndk);
    xk1 = xk + tk*dk/ndk;
    itr = 1;
    while (norm(xk1 - xk)/norm(xk) > TOL && norm(gfunc(xk1)) > TOL && itr < MAX_ITR)
        xk = xk1;
        dk = -inv(hfunc(xk))*gfunc(xk);
        ndk = norm(dk);
        tk = backtrack(vfunc, gfunc, xk, dk/ndk, ndk);
        xk1 = xk + tk*dk/ndk;
        itr = itr +1;
    end
    xs = xk1;
    v = vfunc(xs);
    g = gfunc(xs);
end