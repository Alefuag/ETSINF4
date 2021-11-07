function [pxGc]=compute_pxGc(m,S,X)
  I=pinv(S); pxGc=-.5*(sum((X*I).*X,2)+logdet(S)+m'*I*m)+X*I*m;
end
