function [eY]=gaussian(X,xl,Y,yl,a)
  ll=unique(xl); N=rows(X); M=rows(Y); D=columns(X);
  for c=ll'; ic=find(c==ll);
    Xc=X(find(xl==c),:); Nc=rows(Xc); pc(ic)=Nc/N;
    mc=mean(Xc); m(:,ic)=mc'; S{ic}=((Xc-mc)'*(Xc-mc))/Nc; end
  for i=1:length(a)
    for c=ll'; ic=find(c==ll); sS=a(i)*S{ic}+(1-a(i))*eye(D);
      gY(:,ic)=log(pc(ic))+compute_pxGc(m(:,ic),sS,Y); end
    [~,idY]=max(gY'); eY(i)=mean(ll(idY)!=yl)*100; end
end
