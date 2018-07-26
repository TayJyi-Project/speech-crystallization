function All_Proc_Matlab_Python_VC
%% Parameter Setting
clc; close all; clear;
%projectPath = pwd;

InputPar.ClusterNum  =1;
InputPar.FeaType     ='powspec'; 

%%%% For GLOBAL SETTING
InputPar.SampleRate  =44100;        % 8k Hz, sampling rate
InputPar.FFT_SIZE    =2048;
% InputPar.FFT_SIZE    =256;
%%%% For GLOBAL SETTING

%%%% For STFT
InputPar.FrameSize   =1024; %16ms per frame (256 points)
InputPar.FrameRate   =256 ; %8ms frame shift
InputPar.FeaDim      =InputPar.FrameSize/2+1;
%%%% For STFT

%%%% List pathes of training data
%InputPar.TriNoisyPath = 'D:\speech-crystallization\data\List\hawa_kp3_kp_snr30.list';
%InputPar.TriCleanPath = 'D:\speech-crystallization\data\List\kp.list';
InputPar.TriNoisyPath = '/home/tsung/data/speech-crystallization/data/List/nowiener.list';
InputPar.TriCleanPath = '/home/tsung/data/speech-crystallization/data/List/kp.list';


%%%% Parameters for NN training
InputPar.Ws              =0;
InputPar.HiddenLayerSizes=[512 512 512];
InputPar.MaxEpoch        =100;

Train_DWT_Feature_Extraction(InputPar); 
fprintf('Finished Evaluation.\n');

