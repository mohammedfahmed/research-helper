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

Abst = {};
for i=1:numel(papers)
    Abst = [Abst ;split(papers{i}.(info{3}),'.')];
end
% abst = lower(Abst);



while 1
    kw_srch = input('Keyword (Press ENTER to exit): ','s');
    %     kw_srch = lower(kw_srch);
    
    if ~isempty(kw_srch)
%         if exist('out_file.txt')
%             dos('taskkill /F /IM notepad++.exe');
%             delete('out_file.txt');
%         end
        fid = fopen('out_file.txt','w');
        %         str = Abst(contains(Abst,kw_srch,'IgnoreCase',true));
        %         fprintf(fid, '%s\n', str{Indx});
        kw_srch=split(kw_srch);
        
        Indx = [];
        for i = 1:numel(kw_srch)
            f = regexpi(Abst,kw_srch{i},'match');
            Indx(:,i) = (~cellfun(@isempty,f));
        end
        I = find(all(Indx,2));
        fprintf(fid, '%s\n', Abst{I});
        fclose(fid);
        %         disp([' - - - - - - - - - - - - - -']);
        %         Abst(find(contains(abst,kw_srch)))
        %         disp([' - - - - - - - - - - - - - -']);
        winopen('out_file.txt');
        
    else
        break
    end
end



fclose('all');

