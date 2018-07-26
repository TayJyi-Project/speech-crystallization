clc; close all; clear;
projectPath = pwd;

%% Source %%
Dirfolder = strcat(projectPath, '\VC\Training\Source\');
Listfolder = strcat(projectPath, '\VC\\List\');
listname = 'Evaluation_Source.list';

Path = Dirfolder;
List_Content = {};
Total_Data = 0;
listpath = sprintf('%s%s',Listfolder,listname);
listid = fopen(listpath,'w');

[Path,List_Content,Total_Data] = Data_check(Path,List_Content,Total_Data);

for list_index = 1:Total_Data;
    fprintf(listid,'%s\n',List_Content{list_index});
end
%% Source %%

%% Target %%
Dirfolder = strcat(projectPath, '\VC\Training\Target\');
Listfolder = strcat(projectPath, '\VC\\List\');
listname = 'Evaluation_Target.list';

Path = Dirfolder;
List_Content = {};
Total_Data = 0;
listpath = sprintf('%s%s',Listfolder,listname);
listid = fopen(listpath,'w');

[Path,List_Content,Total_Data] = Data_check(Path,List_Content,Total_Data);

for list_index = 1:Total_Data;
    fprintf(listid,'%s\n',List_Content{list_index});
end
%% Target %%

fclose('all');