[x,fs] = audioread('0001.wav');
dt = 1/fs;
t = 0:dt:(length(x)*dt)-dt;
subplot(3,1,1);
plot(t,x); xlabel('Seconds'); ylabel('Amplitude');
title('0001.wav');

[y,fs] = audioread('chunk001.wav');
dt = 1/fs;
t = 0:dt:(length(y)*dt)-dt;
subplot(3,1,2);
plot(t,y); xlabel('Seconds'); ylabel('Amplitude');
title('chunk');

[z,fs] = audioread('dtwchunk001.wav');
dt = 1/fs;
t = 0:dt:(length(z)*dt)-dt;
subplot(3,1,3);
plot(t,z); xlabel('Seconds'); ylabel('Amplitude');
title('dtw');