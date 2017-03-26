function z = gfunc(t)
%% Gradient evaluation at (x,y)
    x = t(1);
    y = t(2);
    z = [8*x^7 - 8*x^3 + 24*x^3*y^4 + 24*x^5*y^2 + 8*x*y^6 + 24*x*y^2;
         8*y^7 - 8*y^3 + 24*x^4*y^3 + 8*x^6*y + 24*x^2*y^5 + 24*x^2*y];
end