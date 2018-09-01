slowerDir = './outSightData-GMMVC/source/';
fasterDir = './outSightData-GMMVC/kp/';
slowerlist = dir(strcat(slowerDir, '*.wav'));
fasterlist = dir(strcat(fasterDir, '*.wav'));

outputdir = './output/';
for i = 1 : numel(slowerlist)
    display(i);
    slowerwav = strcat(slowerDir, slowerlist(i).name);
    fasterwav = strcat(fasterDir, fasterlist(i).name);
    out = sprintf('dtw_%03d.wav',i); 
    out = strcat(outputdir, out);
    DTWAlignment(slowerwav, fasterwav, out);
end