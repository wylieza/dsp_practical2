disp("Hand-in 4");
close('all');

L = 16;
samples = 2000;

[H, W] = DTFT(ones(1,L), samples);

Hdb = 20*log(abs(H));
Hang = angle(H);

for i = 1:length(Hdb)
  if(Hdb(i) < -200)
    Hang(i) = 0;
    Hdb(i) = -200;
  end
end

subplot(2,1,1);
plot(W, Hdb);
axis([W(1) W(samples)]);
title("Magnitude of H in dB");
xlabel("Frquency W (rad/sample)");
ylabel("Magnitude of H");
set(gcf,'name','My DTFT Implementation','numbertitle','off')


subplot(2,1,2);
plot(W, Hang);
axis([W(1) W(samples)]);
angle(H(1:25))
title("Phase of H");
xlabel("Array index of H");
ylabel("Angle of H");

%print(gcf, '-dpng', "-S1280,960" ,'handin4i.png')

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


%Callum sol
[Hc, Wc] = callumDTFT(ones(1,L), samples);

figure();
subplot(2,1,1);
stem(20*log(abs(Hc)));
title("Magnitude of H in dB");
xlabel("Array index of H");
ylabel("Magnitude of H");
set(gcf,'name','callumDTFT Implementation','numbertitle','off')


subplot(2,1,2);
stem(arg(Hc));
angle(H(1:25))
title("Phase of H");
xlabel("Array index of H");
ylabel("Angle of H");