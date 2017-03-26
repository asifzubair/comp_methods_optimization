function z = hfunc(t)
%% Hessian evaluation at (x,y)
    x = t(1);
    y = t(2);
    f1 = 56*x^6 - 24*x^2 + 72*x^2*y^4 + 120*x^4*y^2 + 8*y^6 + 24*y^2;
    f2 = 56*y^6 - 24*y^2 + 72*x^4*y^2 + 120*x^2*y^4 + 8*x^6 + 24*x^2;
    f12 = 48*x*y*((x^2 + y^2)^2 + 1);
    z = [f1, f12; f12, f2];
end