disp("Hand-in 4ii");
clear
close('all');

L = 16;
samples = 1000;

h = [0:(L-1)];
h = [h(1:L/2)*2/L, 2.-(h(L/2+1:L)*2/L)];

[H, W] = DTFT(h, samples);

subplot(2,1,1);
plot(W, 20*log(abs(H)));
axis([0 2*pi]);
ylim([-300, 100]);
title("Magnitude Plot");
xlabel("Frquency W (rad/sample)");
ylabel("Magnitude of H (dB)");
set(gcf,'name','Hand-in 4ii','numbertitle','off')

subplot(2,1,2);
plot(W, arg(H));
axis([0 2*pi]);
title("Phase Plot");
xlabel("Frquency W (rad/sample)");
ylabel("Phase of H (rad)");

print(gcf, '-dpng', "-S1280,960" ,'handin4ii.png')