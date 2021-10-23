function v=logdet(S)
  L=eig(S); if any(L<=0) v=log(realmin); else v=sum(log(L)); end
end
