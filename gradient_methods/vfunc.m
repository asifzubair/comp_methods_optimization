function z = vfunc(t)
%% Function evaluation at (x,y)
    x = t(1);
    y = t(2);
    z = (x^4 + y^4 - 6*x^2*y^2 - 1)^2 + (4*x^3*y - 4*x*y^3)^2;
end