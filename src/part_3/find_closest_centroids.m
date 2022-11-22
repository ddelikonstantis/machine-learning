function idx = find_closest_centroids(X,centroids)

    K = size(centroids, 1);
    idx = zeros(size(X,1), 1);
    
    for i=1:size(X,1)
        for j=1:K
            if (j==1)
                distMin = sum( (X(i,:)-centroids(j,:)).^2 ) ;
                idx(i) = j;
            else 
                dist = sum( (X(i,:)-centroids(j,:)).^2 );

                if (dist <= distMin)
                    distMin = dist;
                    idx(i) = j;
                end
            end

        end
    end
end

