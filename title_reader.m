% title_reader
clear
clc

file_name = [ 'C:\Users\mahmed\Google Drive\Ultra' ...
'\Research\References\AI HetNets\Reinforcement Learning.txt' ];

fclose('all');

fid = fopen(file_name);


s = {'IEEE',
'Year:',
'Volume:',
'Pages:',
'Cited',
'Abstract',
'Kb)',
';',
'Change,Username/Password'
'Update,Address',
',',
'Purchase,Details'
'Payment,Options',
'Order,History',
'View,Purchased,Documents',
',',
'Profile,Information',
'Communications,Preferences',
'Profession,and,Education',
'Technical Interests',
' ',
'Need Help?',
'US & Canada: +1 800 678 4333',
'Worldwide: +1 732 981 0060',
'Contact & Support'};


c = 1;
while ~feof(fid)
    
    
    tline = fgetl(fid);
    kw = split(tline,' ');
    
    if ~any(ismember(kw,s))
        title{c} = tline;
        c = c + 1;
    end
end


fclose('all');

fid = fopen(file_name,'w');
c=1;
for n = 1:numel(title)
    fprintf(fid, [title{c} '\n']);
    c=c+1;
end

fclose('all');