function [H, W] = DTFT(h, N)
  
  W = 0:2*pi/N:(2*pi-2*pi/N); %N equally space freq. points
  H = zeros(1, N);
  
  for index = 1:length(W)
    for n = 1:length(h)
      H(index) += h(n)*exp(-j*W(index)*(n-1));      
    end
  end  
  
end