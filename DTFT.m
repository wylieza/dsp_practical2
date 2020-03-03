function [H, W] = DTFT(h, N)
  
  W = 0:2*pi/N:(2*pi-2*pi/N); %N equally space freq. points
  H = zeros(1, N);
  
  for index = 1:length(W)
    for n = 1:length(h)
      H(index) += h(n)*exp(-j*W(index)*(n-1));      
    end
  end 
  
 %Phase requires correction when sufficiently close to magnitude of 0
  for i = 1:length(H)
    if(abs(H(i)) < 10^-6)
      H(i) = abs(H(i));
    end
end 
  
end