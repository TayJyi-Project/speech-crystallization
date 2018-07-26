function [InpDim,OutDim]=Train_DWT_Feature_Extraction(InputPar)

%%%%%%%%%%%%%% parameter setting start %%%%%%%%%%%%%%
FeaType =lower(InputPar.FeaType);

MyCleanList=InputPar.TriCleanPath;
MyNoisyList=InputPar.TriNoisyPath;

Ws   = InputPar.Ws;
ClusN= InputPar.ClusterNum;

CleanData=[];NoisyData=[];
CleaMData=[];NoisMData=[];

copyToPath='.';

%%%%%%%%%%%%%% parameter setting end %%%%%%%%%%%%%%

CleanWavList=GetFileNames(MyCleanList);
NoisyWavList=GetFileNames(MyNoisyList);

filenum=length(NoisyWavList);

sum1=0;

for i=1:filenum
    [x,fs_x]=audioread(CleanWavList{i});
%     x=(x-mean(x))/std(x);
    
    [y,fs_y]=audioread(NoisyWavList{i});
%     x=(x-mean(x))/std(x);

    x_size=length(x);
    y_size=length(y);
    
    if x_size>=y_size
        x=x(1:y_size);
    else
        y=y(1:x_size);
    end
    d1 = stoi(x, y, fs_x); %%% stoi or estoi %%%
    sum1=sum1+d1;

end

stoi_average=sum1/filenum
