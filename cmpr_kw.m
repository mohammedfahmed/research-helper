clear
clc
load papers

titles = lower(cellfun(@(a)extractfield(a,'title'),papers));
kw_srch = input('Keyword (Press ENTER to exit): ','s');
kw_srch = lower(split(kw_srch,' '));

for i=1:numel(kw_srch)
    I = find(contains(titles,kw_srch{i}));
    L(i)= length(I);
end

if sum(L)>1
pie(L,kw_srch)
end