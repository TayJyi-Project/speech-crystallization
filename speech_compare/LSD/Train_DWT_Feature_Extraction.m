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

for i=1:filenum
    x=audioread(CleanWavList{i});
    TmpFea=[];TmpFea=FeatureExtract(x,InputPar);
    switch FeaType
        case 'powspec'
            TmpFea=TmpFea;
        otherwise
            TmpFea=TmpFea;
    end
    ClnPowSpec=[];ClnPowSpec=TmpFea;
    
    x=audioread(NoisyWavList{i});
    TmpFea=[];TmpFea=FeatureExtract(x,InputPar);
    switch FeaType
        case 'powspec'
            TmpFea=TmpFea;
        otherwise
            TmpFea=TmpFea;
    end
    NoyPowSpec=[];NoyPowSpec=TmpFea;
    
    CleanData=[CleanData,(MakePatchesFromX(ClnPowSpec,Ws))];
    NoisyData=[NoisyData,(MakePatchesFromX(NoyPowSpec,Ws))];
    
    CleaMData=[CleaMData,MakePatchesFromX(ClnPowSpec,Ws)];
    NoisMData=[NoisMData,MakePatchesFromX(NoyPowSpec,Ws)];
    
end


%%% Evaluation %%%

dimension_eva=size(CleanData,1);
frame_number=size(CleanData,2);

%%% LSD %%%

distance_dimension_frame_total=0;
for i=1:frame_number
    distance_dimension_total=0;
    for j=1:dimension_eva
        distance=log(NoisyData(j,i))-log(CleanData(j,i));
        distance=distance*distance;
        distance_dimension_total=distance_dimension_total+distance;
    end
    distance_dimension_total=distance_dimension_total/dimension_eva;
    distance_dimension_total=sqrt(distance_dimension_total);
    distance_dimension_frame_total=distance_dimension_frame_total+distance_dimension_total;
end
distance_dimension_frame_total=distance_dimension_frame_total/frame_number;
LSD=distance_dimension_frame_total
