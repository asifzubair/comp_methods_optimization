x = sort(rand(100,1));
a = 4;
b = 2;
y = a+b*x + rand(size(x))-.5;
fprintf('Coeff.: a = %3.3f, b = %3.3f\n', a, b)
[a,b] = l1_reg(x, y);
fprintf('L1 reg.: a = %3.3f, b = %3.3f\n', a, b)
plot(x,a + b*x,'r-')
title 'L1/L2 Regression lines'
xlabel 'x'
ylabel 'y'
hold on
[a,b] = l2_reg(x, y);
fprintf('L2 reg.: a = %3.3f, b = %3.3f\n', a, b)
plot(x,a + b*x,'b-')
plot(x, y, 'ko')
legend('L1 reg.', 'L2 reg.');
hold off