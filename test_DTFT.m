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
ylim([-100, 80]);
title("Magnitude (dB)");
xlabel("Frquency W (rad/sample)");
ylabel("Magnitude of H");
set(gcf,'name','My DTFT Implementation','numbertitle','off')

subplot(2,1,2);
plot(W, Hang);
axis([W(1) W(samples)]);
angle(H(1:25))
title("Phase");
xlabel("Frquency W (rad/sample)");
ylabel("Phase of H");

print(gcf, '-dpng', "-S1280,960" ,'handin4i.png')

return
%Analytical Solution
R = arrayfun(@(w) (sin(w*L/2)/sin((w+0.000000000001)/2))*exp(-j*w*(L-1)/2), W);

figure();

subplot(2,1,1);
stem(abs(R));
title("Magnitude of H");
xlabel("Array index of H");
ylabel("Magnitude of H");

subplot(2,1,2);
stem(angle(R));
angle(R(1:25))
title("Phase of H");
xlabel("Array index of H");
ylabel("Angle of H");

set(gcf,'name','My Implementation of the Analytic Formula','numbertitle','off')