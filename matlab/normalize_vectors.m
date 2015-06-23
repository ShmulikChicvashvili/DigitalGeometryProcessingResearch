function [ v ] = normalize_vectors( vectors )
%NORMALIZE_VECTORS Summary of this function goes here
%   Detailed explanation goes here

reshape_back = false;
if size(vectors,2) == 1
    reshape_back = true;
    vectors = reshape(vectors,[],3);
end
v = vectors ./ repmat(sqrt(sum(vectors.^2,2)),1,3);

if reshape_back
    v = reshape(v,[],1);
end
    

end

