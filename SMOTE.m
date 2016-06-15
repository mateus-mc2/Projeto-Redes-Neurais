function syntheticData = SMOTE(samples, N, k)
%SMOTE Summary of this function goes here
%   Detailed explanation goes here
    T = size(samples, 1);
    
    if N < 100
        p = randperm(T);
        samples = samples(p,:);
        T = floor(T*N/100);
        N = 100;
    end
    
    N = floor(N/100);
    index = 0;
    syntheticData = zeros(T*N, size(samples, 2));
    
    for i = 1:T
        nnarray = kNN(samples, i, k);
        aux = N;
        
        while aux > 0
           nn = randi(k);
           diff = samples(nnarray(nn),:) - samples(i,:);
           delta = rand();
           syntheticData(index,:) = samples(i,:) + delta*diff;
           index = index + 1;
        end
    end
end
