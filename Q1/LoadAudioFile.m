function [y,fs,L,T] = LoadAudioFile(InputFile)
    [y,fs] = audioread(InputFile);
    L = length(y);
    T = L/fs;
end