clear all;
close all;
clc;
clear y Fs;
[y,Fs] = audioread('BUMMER.WAV');
sound(y,Fs);
hold on
Y = ['The Sample rate of the signal is ',num2str(Fs)];   
disp(Y);
specgram(y,length(y),Fs);
title('Spectrogram of the Input Audio Signal');
figure;
plot(psd(spectrum.periodogram,y,'Fs',Fs,'NFFT',length(y)));
figure;
N = length(y);
FFT = fft(y) ./ N;
Fn = Fs/2; 
Freq = (( linspace(0,1,fix(N/2)+1)) .* Fn);
Index = 1 : length(Freq);
stem(Freq./1000, abs(FFT(Index))*2);
title('Fourier Transform of the Audio signal');
xlabel('Frequency (kHz)');
ylabel('Amplitude');
figure;
plot(20*log10(abs(FFT)));
title('Graph for Bandwidth of the Signal');
figure;
obw(y,Fs
figure;
d1 = fdesign.lowpass('N,Fc',10,1200,48000);
designmethods(d1);
f1 = design(d1, 'window');
Q = filter(f1,y);
stem(Freq./1000,abs(Q(Index)));
figure;
obw(Q,Fs);
figure;
load handel.mat
filename = 'handel1.wav';
audiowrite(filename,Q,Fs);
clear Q Fs
[Q,Fs] = audioread(filename);
sound(Q,Fs);
hold on
specgram(Q,length(Q),Fs);
title('Spectrogram of the Lowpass Filtered Audio Signal');
figure;
d2 = fdesign.highpass('N,Fc',10,1200,48000);
designmethods(d2);
f2 = design(d2, 'window'); 
I = filter(f2,y);
stem(Freq./1000,abs(I(Index)));
figure;
obw(I,Fs);
figure;
load handel.mat
filename = 'handel2.wav';
audiowrite(filename,I,Fs);
clear I Fs
[I,Fs] = audioread(filename);
sound(I,Fs);
specgram(I,length(I),Fs);
title('Spectrogram of the Highpass Filtered Audio Signal');
