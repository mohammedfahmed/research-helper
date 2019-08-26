clear
clc

[file_name,~] = uigetfile('*.mat');
eval(['load ' file_name])
a = whos('papers*');


eval([ 'papers = ' a.name ';'])

info = {...
    'title',
    'author',
    'abstract',
    'keywords',
    'journal',
    'booktitle',
    'month',
    'year',
    'volume',
    'number',
    'pages',
    'doi',
    'ISSN'};

titles = cellfun(@(a)extractfield(a,'title'),papers)';


kw_srch = 'test';

while ~isempty(kw_srch)
    kw_srch = input('Keyword: ','s');
    kw_srch = split(kw_srch,' ');
    I = find(contains(cellfun(@(a)extractfield(a,'title'),papers),kw_srch));
    disp(titles(I))
    disp([ 'No. of papers: ' num2str(length(I))]);
end



kw_g = {};
for i=1:numel(kw)
    kw_g = [ kw_g ; split(kw(i),' ')];
end

kw_g = unique(lower(kw_g));


jr={};

for i=1:numel(papers)
    if isfield(papers{i},info{5})
        j=papers{i}.(info{5});
    elseif isfield(papers{i},info{6})
        j=papers{i}.(info{6});
    else
    end
    
    jr = [jr ;j];
end

jr = unique(jr);


authors = {};

for i=1:numel(papers)
    authors = [authors ;split(papers{i}.(info{2}),' and ')];
end

authors = unique(authors);

for i=1:numel(papers)
    disp(papers{i});
    disp('--------------------------------------------------------------------------------------------');
    pause;
end

