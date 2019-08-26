% function c = latex2cell()
clear
clc

[file_name,~] = uigetfile('*.txt');

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


fid = fopen(file_name);

file_name = file_name(1:end-4);

c = 0;

while ~feof(fid)
    
    tline = fgetl(fid);
    if isempty(regexpi(tline,'@\w+{\d+','match'))
        
        [newStr,matches] = split(tline,["=","{","}"]);
        f = regexpi(info,['^' newStr{1}],'match');
        Indx = find(~cellfun(@isempty,f));
        
        eval(['papers_' file_name '{c}.(info{Indx}) = newStr{3};']);
        
    else
        c = c + 1;
    end
    
end


fclose('all');


eval(['save papers_' file_name ' papers_' file_name ';']);