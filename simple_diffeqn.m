clear;

b = [0.3, 0.6, 0.3]; %Coefficients of x[n] (2rd order)
a = [1, 0, 0.9]; %Coefficients of y[n] (2nd order)

t0offset = 3; %This defines where 'zero' is in the arrays -> 'n = zero' is position 1+t0offset

imp = zeros(1, 128+t0offset);
y = zeros(1, 128+t0offset);

imp(1 + t0offset) = 1; %Create an the 128 samples of diracdelta function

for index = 1:(128)
  n = index + t0offset;
  y(n) = -0.9*y(n-2) + 0.3*imp(n) + 0.6*imp(n-1) + 0.3*imp(n-2);
end

subplot(2, 1, 1);
stem(imp((1+t0offset):(128+t0offset)));
xlim([1 128]);
title("Impulse Vector");
xlabel("n - discrete time variable");
ylabel("delta(n)");

subplot(2, 1, 2);
stem(y((1+t0offset):(128+t0offset)));
xlim([1 128]);
title("Impulse Response of y(n)");
xlabel("n - discrete time variable");
ylabel("y(n)");

print(gcf, '-dpng', 'handin1dall.png') %Save as png

%Create a zoomed view of first 20 points
figure();

subplot(2, 1, 1);
stem(imp((1+t0offset):(128+t0offset)));
xlim([1 20]);
title("Impulse Vector");
xlabel("n - discrete time variable");
ylabel("delta(n)");

subplot(2, 1, 2);
stem(y((1+t0offset):(128+t0offset)));
xlim([1 20]);
title("Impulse Response of y(n)");
xlabel("n - discrete time variable");
ylabel("y(n)");

print(gcf, '-dpng', 'handin1d20pnts.png') %Save as png
