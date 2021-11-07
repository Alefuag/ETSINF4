function [tee]=mixgaussian(X,xl,Y,yl,K,a)
 ll=unique(xl); C=rows(ll); N=rows(X); M=rows(Y); D=columns(X);
 rand('seed',23); S=cell(C,K);
 for c=ll'; ic=find(c==ll); idc=find(xl==c); Nc=rows(idc);
   pkGc{ic}(1:K)=Nc/(N*K); mu{ic}=X(idc(randperm(Nc,K)),:)';
   S(ic,1:K)=a*cov(X(idc,:),1)/K+(1-a)*eye(D); end
 epsilon=1e-4; L=-inf; it=0;
 printf(" It             oL              L  trerr  teerr\n");
 printf("--- -------------- -------------- ------ ------\n");
 do; oL=L; L=0;
  for c=ll'; ic=find(c==ll); idc=find(xl==c); Nc=rows(idc); Xc=X(idc,:);
   z=[]; for k=1:K; z(:,k)=compute_zk(ic,k,pkGc,mu,S,Xc); end
   mz=max(z,[],2); z=exp(z-mz); sz=sum(z,2); z=z./sz; L=L+sum(mz+log(sz));
   sz=sum(z); pkGc{ic}=sz/Nc; mu{ic}=(Xc'*z)./sz;
   for k=1:K; Sick=Xc-mu{ic}(:,k)';
    S(ic,k)=a*(Sick'*(Sick.*z(:,k)))/sz(k)+(1-a)*eye(D); end; end
  L=L/N;
  for c=ll'; ic=find(c==ll);
   z=[]; for k=1:K; z(:,k)=compute_zk(ic,k,pkGc,mu,S,X); end
   mz=max(z,[],2); z=exp(z-mz); sz=sum(z,2); gtr(:,ic)=mz+log(sz);
   z=[]; for k=1:K; z(:,k)=compute_zk(ic,k,pkGc,mu,S,Y); end
   mz=max(z,[],2); z=exp(z-mz); sz=sum(z,2); gte(:,ic)=mz+log(sz); end
  [~,idx]=max(gtr'); tre=mean(ll(idx)!=xl)*100;
  [~,idy]=max(gte'); tee=mean(ll(idy)!=yl)*100;
  it=it+1; printf("%3d %14.5f %14.5f %6.3f %6.3f\n",it,oL,L,tre,tee);
 until ((L-oL)/abs(oL) < epsilon); end
