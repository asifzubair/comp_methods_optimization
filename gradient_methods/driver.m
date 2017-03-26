%% Driver implementation
e2 = 1e-2;
e7 = 1e-7;
TOL = e7;
MAX_ITR = 10000;
ALPHA = 0.0001;
FIXED_FILE=fopen('fixed.txt','w');
NEWTON_FILE=fopen('newton.txt','w');
CONJUGATE_FILE=fopen('conjugate.txt','w');
fprintf(FIXED_FILE,'count\tX0(1)\tX0(2)\tXs(1)\tXs(2)\tf(Xs)\tItrs\tConv.\n');
fprintf(NEWTON_FILE,'count\tX0(1)\tX0(2)\tXs(1)\tXs(2)\tf(Xs)\tItrs\tConv.\n');
fprintf(CONJUGATE_FILE,'count\tX0(1)\tX0(2)\tXs(1)\tXs(2)\tf(Xs)\tItrs\tConv.\n');
count = 1;
for ii=0:100
    for jj=0:100
        x = [-2 + 4*ii/100; -2 + 4*jj/100];
e2);
...
e2);
...
e2);
[xf, vf, gf, itf] = fixed(@vfunc, @gfunc, ALPHA, x, TOL, MAX_ITR);
[xn, vn, gn, itn] = newton(@vfunc, @gfunc, @hfunc, x, TOL, MAX_ITR);
[xc, vc, gc, itc] = conjugate(@vfunc, @gfunc, x, TOL, MAX_ITR);
fprintf(FIXED_FILE,'%5i\t%4.3f\t%4.3f\t%4.3f\t%4.3f\t%4.3f\t%5i\t%i\n', ...
  count, x(1), x(2), xf(1), xf(2), vf, itf, itf < MAX_ITR && norm(xf) >
fprintf(NEWTON_FILE, '%5i\t%4.3f\t%4.3f\t%4.3f\t%4.3f\t%4.3f\t%5i\t%i\n',
  count, x(1), x(2), xn(1), xn(2), vn, itn, itn < MAX_ITR && norm(xn) >
fprintf(CONJUGATE_FILE, '%5i\t%4.3f\t%4.3f\t%4.3f\t%4.3f\t%4.3f\t%5i\t%i\n', count, x(1), x(2), xc(1), xc(2), vc, itc, itc < MAX_ITR && norm(xc) >
        count = count + 1;
    end
end