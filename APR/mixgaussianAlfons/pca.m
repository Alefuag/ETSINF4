function [m, W] = pca(X)
	m = mean(X);
	Xm = X - m;
	covar = (Xm'*Xm)/rows(Xm);
	[eigvec, eigval] = eig(covar);

	[S, I] = sort(diag(eigval), "descend");
	W = eigvec(:, I);
endfunction