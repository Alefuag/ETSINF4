function [m, W] = pca(X)
	Xm = X - mean(X);
	covar = (Xm'*Xm)/rows(Xm);
	[eigvec, eigval] = eig(covar);

	[S, I] = sort(diag(eigval), "descend");
	W = eigvec(:, I);
endfunction