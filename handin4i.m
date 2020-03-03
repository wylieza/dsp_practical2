disp("Hand-in 4");
close('all');

L = 16;
samples = 2000;

[H, W] = DTFT(ones(1,L), samples);

Hdb = 20*log10(abs(H));
Hang = angle(H);

subplot(2,1,1);
plot(W, Hdb);
axis([W(1), W(samples)]);
ylim([-100, 50]);
title("Magnitude Plot");
xlabel("Frquency W (rad/sample)");
ylabel("Magnitude of H (dB)");
set(gcf,'name','Hand-in 4i','numbertitle','off')


subplot(2,1,2);
plot(W, Hang);
axis([W(1) W(samples)]);
angle(H(1:25))
title("Phase Plot");
xlabel("Frquency W (rad/sample)");
ylabel("Phase of H (rad)");

print(gcf, '-dpng', "-S1280,960" ,'handin4i.png')