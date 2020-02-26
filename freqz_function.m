disp("Section 3");
clear;

fb_coeff = [1, -1.8*cos(pi/16), 0.81]; %These determine the poles
ff_coeff = [1, 0.5]; %These determine the zeros



disp("Expected result")
H = freqz(ff_coeff, fb_coeff, 512, 'whole');

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

%print(gcf, '-dpng', 'handin3modelanswer.png') %Save as png
print(gcf, '-dsvg', 'handin3modelanswer.svg') %Save as svg for infinite resolution
