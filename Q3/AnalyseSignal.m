function Amp = AnalyseSignal(y,fs)
    [s,~,~] = stft(y(:,1),fs,Window=kaiser(1024,5),OverlapLength=220,FFTLength=1024);
    S = sum(transpose(abs(s)));
    Amp = S/max(S);
end