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

kw={};
for i=1:numel(papers)
    kw = [kw ;split(papers{i}.(info{4}),';')];
end
kw = unique(lower(kw));



while 1
    kw_srch = input('Keyword (Press ENTER to exit): ','s');
    kw_srch = lower(kw_srch);
    
    if ~isempty(kw_srch)
        
        disp([' - - - - - - - - - - - - - -']);
        disp(kw(contains(kw,kw_srch)))
        disp([' - - - - - - - - - - - - - -']);
    else
        break
    end
end

