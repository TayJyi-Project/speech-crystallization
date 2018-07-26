function [Path,List_Content,Total_Data]=Data_check(Path,List_Content,Total_Data)

Data=dir(Path);

for Data_index=3:length(Data)
    
    if Data(Data_index).isdir==1
        folder_name=[Data(Data_index).name];
        SubPath=[Path,folder_name,'\'];
        [TempPath,List_Content,Total_Data]=Data_check(SubPath,List_Content,Total_Data);
        
    else
        Total_Data=Total_Data+1;
        file_name=[Data(Data_index).name];
        List_Content{1,Total_Data}=[Path,file_name];
        
    end
    
end

return