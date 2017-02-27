function out = randomSample(data, n)

datasize = size(data, 1);
out = zeros(n, size(data, 2));

index = randsample(datasize, n);

for i = 1:n
    out(i, :) = data(index(i), :);
end

end