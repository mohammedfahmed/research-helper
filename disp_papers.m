A = uicontrol('Style','text','max',2, 'Units', 'norm',...
    'Position',[0 0 1 1],'FontSize',14);
Sa = {'Title'};
B = uicontrol('Style','text','max',2, 'Units', 'norm', ...
    'Position',[0 0 1 .9],'FontSize',14);
Sb = {'Abstract'};



for K = 1:numel(papers)
Sa{2} = sprintf('%s', papers{K}.(info{1}));
set(A, 'String', Sa);
Sb{2} = sprintf('%s', papers{K}.(info{3}));
set(B, 'String', Sb);
pause(1)
end