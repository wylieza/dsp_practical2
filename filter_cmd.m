disp("Question 2");
clear;

n0offset = 10; %Index 11 is 'n0'

y_coeff = [1, -1.8*cos(pi/16), 0.81]; %feedback coeff
x_coeff = [1, 0.5]; %feedforward coeff

ddelta = [zeros(1, 10), 1, zeros(1, 100)]; %h over nE[-10, 100]

h = filter(x_coeff, y_coeff, ddelta); %ff_coef, fb_coef, impulse

stem(-10:100, h);
title("Impulse Response of Difference Equation");
xlabel("n");
ylabel("Value of h(n)");

print(gcf, '-dpng', 'handin2.png') %Save as png