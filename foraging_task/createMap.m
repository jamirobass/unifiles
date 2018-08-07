%Takes as input:
%tR = tree richness
%tRStd = tree richness std
%k = depletion rate
%kstd = depletion rate std
%stdr = reward std

function [rewardMap, decreaseMap] = createMap(tR, tRStd, k, kstd, stdr)
%Big enough?
defBlock = zeros(1000, 1000);
%Tree rich vector
treeRichVec = normrnd(tR, tRStd, 1, 1000);
%add treerich as top row
defBlock(1,:) = treeRichVec;
%initialice rand decrease
randDecrease = normrnd(k, kstd, 1000, 1000);
%init reward with nan
rewardBlock = NaN(1000,1000);
%Create decrease map
for c = 1:1000
    for r = 2:1000
        defBlock(r, c) = defBlock(r-1, c)*randDecrease(r, c);
    end
end
%reward map
for c = 1:1000
    for r = 1:1000
        rewardBlock(r, c) = normrnd(defBlock(r,c), stdr);
    end
end
rewardMap = rewardBlock;
decreaseMap = defBlock;
end