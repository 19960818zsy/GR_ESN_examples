function lowPrecD = setPrecision(D, b, interpol)
% bound numerical precision of data D (number, vec, mat) to b linearly
% spaced values.
% This is done by:
% 1. split [0, max(abs(D))] into b equal intervals;
% 2. round all abs(d_i) toward the interval boundaries;
% 3. re-assign signs
% The flag interpol has possible values 0, 1, 2, 3 and determines how 
% the rounding is done: on a linear data scale (0), on a logarithmic 
% data scale (1), or otherwise (I don't remember ... 
% would have to re-understand my own code..)

if b ~= Inf && max(max(abs(D))) > 0 && interpol == 0
    maxd = max(max(abs(D)));
    lowPrecD = ...
        sign(D) .* ((round(abs(D) * b / maxd))*(maxd / b));
elseif b ~= Inf && max(max(abs(D))) > 0 && interpol == 1
    maxd = max(max(log(abs(D)+1)));
    lowPrecLogDPlus1 = (round(log(abs(D)+1) * b / maxd))*(maxd / b);
    lowPrecD = sign(D) .* (exp(lowPrecLogDPlus1) - 1);
elseif b ~= Inf && interpol == 2
    if b ~= 1
        error('interpol == 2 implies b == 1');
    end
    N = size(D,1) * size(D,2);
    if N < 2
        error('interpol == 2 needs at least 2 data points');
    end
    Dfs = sort(reshape(abs(D), N, 1));
    med = Dfs(floor(N/2));
    lower = mean(Dfs(1:floor(N/2)));
    upper = mean(Dfs(floor(N/2)+1:end));
    Dcut = abs(D);
    Dcut(Dcut <= med) = lower;
    Dcut(Dcut > med) = upper;
    lowPrecD = sign(D) .* Dcut;
elseif b ~= Inf && interpol == 3
    if b ~= 1
        error('interpol == 3 implies b == 1');
    end
    N = size(D,1) * size(D,2);
    if N < 2
        error('interpol == 3 needs at least 2 data points');
    end
    Dfs = sort(reshape(abs(D), N, 1));
    meanD = mean(Dfs);
    Dcut = abs(D);
    Dcut(Dcut <= meanD) = 0;
    Nhigher = sum(sum(Dcut > meanD));
    Dcut(Dcut > meanD) = meanD * N / Nhigher;
    lowPrecD = sign(D) .* Dcut;
  
elseif b ~= Inf && interpol == 4
   maxd = max(max(abs(D)));
    lowPrecD = ...
        round(sign(D) .* ((round(abs(D) * b / maxd))*(maxd / b)));
    
else % don't do anything
    lowPrecD = D;
end
