function All_Proc_Matlab_Python_VC
%% Parameter Setting
clc; close all; clear;
projectPath = pwd;

InputPar.ClusterNum  =1;
InputPar.FeaType     ='powspec'; 

%%%% For GLOBAL SETTING
InputPar.SampleRate  =16000;        % 8k Hz, sampling rate
InputPar.FFT_SIZE    =256;
% InputPar.FFT_SIZE    =256;
%%%% For GLOBAL SETTING

%%%% For STFT
InputPar.FrameSize   =256; %16ms per frame (256 points)
InputPar.FrameRate   =128 ; %8ms frame shift
InputPar.FeaDim      =InputPar.FrameSize/2+1;
%%%% For STFT

%%%% List pathes of training data
InputPar.TriNoisyPath = strcat(projectPath, '\VC\List\Evaluation_Source.list');
InputPar.TriCleanPath = strcat(projectPath, '\VC\List\Evaluation_Target.list');

%%%% Parameters for NN training
InputPar.Ws              =0;
InputPar.HiddenLayerSizes=[512 512 512];
InputPar.MaxEpoch        =100;

Train_DWT_Feature_Extraction(InputPar); %單純testing(不作training)註解這行

fprintf('Finished Evaluation.\n');

