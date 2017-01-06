N = 6;
Xi = zeros(N,1);
Yi = zeros(N,1);

for i=1:N
    Xi(i) = i;
    Yi(i) = StephsFunc(i);
end