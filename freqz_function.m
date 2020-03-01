disp("Section 3");
clear;

fb_coeff = [1, 0.13, 0.52, 0.3]; %These determine the poles
ff_coeff = [0.16, -0.48, 0.48, -0.16]; %These determine the zeros

disp("Result")
H = myfreqz(ff_coeff, fb_coeff, 512, 'whole');

subplot(2,1,1);
stem(abs(H));
title("Magnitude of H");
xlabel("Array index of H");
ylabel("Magnitude of H");

subplot(2,1,2);
stem(angle(H));
title("Angle of H");
xlabel("Array index of H");
ylabel("Angle of H");

print(gcf, '-dpng', "-S1280,960" ,'handin3.png')
