dirname = './input';
filelist = dir(strcat(dirname, '*.wav')); 
outputdir = './output/';
for i = 1 : numel(filelist)
    a = strcat(dirname, filelist(i).name);
    b = strcat(outputdir, filelist(i).name);
    wiener_as(a,b);
end

