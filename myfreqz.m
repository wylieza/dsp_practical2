function H = myfreqz(ff_coef, fb_coef, N, angle)
  if (angle == 'whole')
    angle = 2*pi;
  end
  
  H = exp(j.*[0:angle/N:angle]);
  
  ffdegree = length(ff_coef); %'b'
  fbdegree = length(fb_coef); %'a'
  
  ff_pwrs = [0:1:ffdegree-1];
  fb_pwrs = [0:1:fbdegree-1];
  
  num_vector = arrayfun(@(x) x.^ff_pwrs, H, "UniformOutput", false);
  den_vector = arrayfun(@(x) x.^fb_pwrs, H, "UniformOutput", false);
  
  for index = 1:length(H)
    H(index) = dot(ff_coef, cell2mat(num_vector(index)))/dot(fb_coef, cell2mat(den_vector(index)));
  end 
  
end  