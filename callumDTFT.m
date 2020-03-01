function [H, W] = callumDTFT(h, N=length(h))
  H = zeros(1, N);
  W = zeros(1, N);
  
  d_angle = 2*pi/N;
  
  for k = 0:(N-1)
    omega = d_angle*k;
    
    H_omega = 0+0j;
    for n = 0:(length(h)-1)
      H_omega += h(n+1)*exp(-j*omega*n);
    end
    
    H(k+1) = H_omega;
    W(k+1) = omega;
  end
end
