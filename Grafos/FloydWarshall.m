function [D,P] = FloydWarshall(D)
prevD = D;
P = zeros(size(D));
for k = 1:length(D)
  D = min(D,D(:,k) + D(k,:));
  P(D<prevD) = k;
  prevD = D;
end
end