
str = webread('https://scholar.google.com/citations?user=Dq93mOUAAAAh');
fid = fopen('authors_raw.txt','w+');
fprintf(fid, '%s', str);



fclose(fid);

fid = fopen('authors_raw.txt','r');
line_no = 0;

while ~feof(fid)
    line_no  = line_no + 1;
    tline{line_no} = fgetl(fid);
end

fclose(fid);


Indx = find(~cellfun('isempty',strfind(tline,'user=')));


for i=1:length(Indx)
    t = regexprep(tline{57},'[^\w="><;:&%-_]',''); 
       n = regexpi(t, 'user=\w*', 'match');
    
    
end

n=unique(n)