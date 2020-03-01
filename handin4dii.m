disp("Hand-in 4ii");
clear
close('all');

L = 16;
samples = 160;

h = [0:(L-1)];
h = [h(1:L/2)*2/L, 2.-(h(L/2+1:L)*2/L)];

[H, W] = DTFT(h, samples);

subplot(2,1,1);
stem(20*log(abs(H)));
ylim([-150, 100]);
title("Magnitude of H in dB");
xlabel("Array index of H");
ylabel("Magnitude of H");
set(gcf,'name','Hand-in 4ii','numbertitle','off')


subplot(2,1,2);
stem(arg(H));
angle(H(1:25))
title("Phase of H");
xlabel("Array index of H");
ylabel("Angle of H");

print(gcf, '-dpng', "-S1280,960" ,'handin4ii.png')