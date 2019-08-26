% function keywords = extract_keywords()




a = genpath('C:\Users\mahmed\Google Drive\Ultra\Research\References\AI HetNets');
p = split(a,';');

titles = [];

c = 1;

for i=1:numel(p)
d = dir(char(p(i)));
d = d(~cell2mat({d.isdir}));
files = [files;{d.name}'];

end

kw = [];
for i=1:numel(files)  
kw = [kw;split(files{i}(1:end-4),' ')];
end
kw = lower(kw);
kw = kw(~ismember(kw,[{'ad'},{'hoc'},{'edge'},{'design'},{'neural'},{'power'},{'multiagent'},{'next-generation'},{'algorithms'},{'efficient'},{'artificial'},{'intelligence'},{'intelligent'},{'cellular'},     {'challenges'},     {'communications'},     {'control'},     {'dynamic'},     {'heterogeneous'},     {'hetnets'},     {'layer'},     {'optimal'},     {'techniques'},{'5g'}, {'deep'},  {'learning'}, {'machine'}, {'multi-agent'}, {'network'}, {'networks'},  {'q-learning'}, {'reinforcement'}, {'wireless'},{'based'},{'survey'},{'mobile'},{'cell'},{'from'},{'over'},{'with'},{'via'},{'and'},{'desktop'},{'a'},{'an'},{'of'}, {'on'},{'to'}, {'for'}, {'in'},{'the'}]));

kw = categorical(kw);
[N,kw_hist] = histcounts(kw);
[B,I] = sort(N,'desc');
top_kw = kw_hist(I(1:10));

kw = kw(ismember(kw,top_kw));

kw = removecats(kw);
% histogram(kw)
% 
t = pie(kw)
set(findall(gcf,'-property','FontSize'),'FontSize',14)
summary(kw)
%  rose(kw)

% fid = fopen('C:\Users\mahmed\Google Drive\Ultra\Research\References\AI HetNets\a.txt');
% 
% 
% while ~feof(fid)
% 
%     
%     tline = fgetl(fid);
% if ~isempty(strfind(tline, 'keywords'))
%    keywords{c} = tline;
%     c = c +1;
% end
% end
