disp("Section 3");
clear;

fb_coeff = [1, 0.13, 0.52, 0.3]; %These determine the poles
ff_coeff = [0.16, -0.48, 0.48, -0.16]; %These determine the zeros

disp("Result")
N = 512
H = myfreqz(ff_coeff, fb_coeff, N, 'whole');

subplot(2,1,1);
plot([0:2*pi/N:2*pi], abs(H));
axis([0 2*pi])
title("Magnitude Plot");
xlabel("Frequncy W (rad/sample)");
ylabel("Magnitude of H");

subplot(2,1,2);
plot([0:2*pi/N:2*pi], angle(H));
axis([0 2*pi])
title("Phase Plot");
xlabel("Frequncy W (rad/sample)");
ylabel("Phase of H");

print(gcf, '-dpng', "-S1280,960" ,'handin3.png')
