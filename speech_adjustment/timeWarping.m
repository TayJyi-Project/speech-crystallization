% Load two speech waveforms of the same utterance (from TIMIT)
[slow, fs] = audioread('0001.wav');
[fast, fs] = audioread('chunk001.wav');

windowSize = 1024;
noverlap = 768;
nfft = 2048;

% Calculate STFT features for both sounds (25% window overlap)
slowSTFT = spectrogram(slow, windowSize, noverlap, nfft, fs); % (signal, window, noverlap, nfft, fs)
fastSTFT = spectrogram(fast, windowSize, noverlap, nfft, fs); % (signal, window, noverlap, nfft, fs)

%calculate dtw
[dist, wp1, wp2] = dtw(slowSTFT, fastSTFT);
wp1 = wp1';
wp2 = wp2';


% Calculate the frames in fastSTFT that are indicated to match each frame
% in slowSTFT, so we can resynthesize a warped, aligned version
D2i1 = zeros(1, size(slowSTFT,2));
for i = 1:length(D2i1); D2i1(i) = wp2(min(find(wp1 >= i))); end

% Phase-vocoder interpolate D2's STFT under the time warp
D2x = pvsample(fastSTFT, D2i1-1, windowSize);

% Invert it back to time domain
what = invspecgram(D2x, windowSize, noverlap, nfft, fs); % (signal, window, noverlap, nfft, fs)

out = zeros(length(slow),1);
[row,col] = size(what);
out(1:row,1:col) = what;
audiowrite('dtwchunk001.wav', out, fs)
