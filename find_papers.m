clear
clc

[file_name,~] = uigetfile('*.mat');
eval(['load ' file_name])

a = whos('papers*');

Titles = cellfun(@(a)extractfield(a,'title'),eval(a.name))';
titles = lower(Titles);


kw_srch = 'test';

kw_item_indx = input('Type 1 to search the title, 2 for the abstract, 3 for keywords:  ','s');

srch_item = [{'title'},{'abstract'}, {'keywords'}];

while 1
    kw_srch = input('Keyword (Press ENTER to exit): ','s');
    kw_srch = lower(kw_srch);
    if ~isempty(kw_srch)
        kw_srch = split(kw_srch,' ');
        I = find(contains(cellfun(@(a)extractfield(a,char(srch_item(str2num(kw_item_indx)))),eval(a.name)),kw_srch));
        disp(Titles(I))
        disp([' - - - - - - - - - - - - - -']);
        disp([ 'No. of papers: ' num2str(length(I))]);
        disp([' - - - - - - - - - - - - - -']);
    else
        break
    end
end