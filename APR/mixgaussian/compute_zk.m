function [zk]=compute_zk(ic,k,pkGc,mu,sigma,X)
  D=columns(X); zk=log(pkGc{ic}(k))-.5*D*log(2*pi);
  m=mu{ic}(:,k); S=sigma{ic,k}; I=pinv(S);
  zk=zk+-.5*(sum((X*I).*X,2)+logdet(S)+m'*I*m)+X*I*m; end
