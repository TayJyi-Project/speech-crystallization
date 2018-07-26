fileID = fopen('../data/List/kp.list', 'r');
outputdir = './output/';
wavPath = fgetl(fileID);
cnt = 1;
while ischar(wavPath)
    [oriwav, fs] = audioread(wavPath);
    snr = 15;
    outwav = awgn(oriwav, snr, 'measured');
    outputPath = sprintf('kp_snr%d_%03d.wav',snr,cnt); 
    audiowrite(strcat(outputdir, outputPath), outwav, fs);
    wavPath = fgetl(fileID);
    cnt = cnt + 1;
end
fclose(fileID);