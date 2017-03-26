function [xs, v, g, itr] = conjugate(vfunc, gfunc, x0, TOL, MAX_ITR)
%% Conjugate gradient algorithm implementation
    xk = x0;
    if norm(gfunc(xk)) < TOL
return else
        itr = 1;
        dk = -gfunc(xk);
        ndk = norm(dk);
        ak = backtrack(vfunc, gfunc, xk, dk/ndk, ndk);
        xk1 = xk +ak*dk/ndk;
        while (norm(gfunc(xk1)) > TOL && itr < MAX_ITR)
            bk = (gfunc(xk1)'*gfunc(xk1))/(gfunc(xk)'*gfunc(xk));
            dk = -gfunc(xk1) + bk*dk;
            ndk = norm(dk);
            ak = backtrack(vfunc, gfunc, xk, dk/ndk, ndk);
            xk = xk1;
            xk1 = xk1 + ak*dk/ndk;
            itr = itr + 1;
end end
    xs = xk1;
    v = vfunc(xs);
    g = gfunc(xs);
end