clear
clc
% cd('C:\Users\mahmed\Google Drive\Ultra\Research\References\AI HetNets')

key_word = 'WIFI';

str = split(key_word,' ');
srch = join(str,'|');
dir_name = join(str,'_');


d = dir('.');
d = d(~cell2mat({d.isdir}));
f = regexpi({d.name},['\w*(' char(srch) ')\w*'],'match');

Indx = find(~cellfun(@isempty,f));

files = {d(Indx).name}';

if ~(exist(char(dir_name),'dir')==7)
    mkdir(char(dir_name))
end

for i=1:numel(files)
    movefile(files{i},['.\' char(dir_name)],'f');
end

