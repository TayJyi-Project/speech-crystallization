fileID = fopen('../data/List/kp_snr15_wie.list', 'r');
outputdir = './output/';
wavPath = fgetl(fileID);
snr = 15
cnt = 1;
while ischar(wavPath)
    % Read standard sample tune that ships with MATLAB.
    [dataIn, Fs] = audioread(wavPath);
    % Filter the signal
    fc = 6000; % Make higher to hear higher frequencies.
    % Design a Butterworth filter.
    [b, a] = butter(6,fc/(Fs/2));
    freqz(b,a)
    % Apply the Butterworth filter.
    filteredSignal = filter(b, a, dataIn);
    outputPath = sprintf('kp_snr%d_low_%03d.wav',snr,cnt); 
    audiowrite(strcat(outputdir, outputPath), filteredSignal, Fs);

    wavPath = fgetl(fileID);
    cnt = cnt + 1;
end
fclose(fileID);