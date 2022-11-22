function centroids = compute_centroids(X,idx,K)
    [m n] = size(X);
    centroids = zeros(K, n);

    for i = 1 : K
        C = numel(find(idx==i));
        a = find(idx==i);
        sum1 = sum(X(a,:));
        centroids(i,:) = (1/C) * sum1;
    end

end

