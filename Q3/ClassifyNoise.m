function noiseType = ClassifyNoise(InputFile)
    [yIn,fsIn,~,~] = LoadAudioFile(InputFile);
    AmpIn = AnalyseSignal(yIn,fsIn);

    [y1,fs1,~,~] = LoadAudioFile("music_ceiling-fan.wav");
    Amp1 = AnalyseSignal(y1,fs1);
    r1 = rmse(Amp1(1:300),AmpIn(1:300));

    [y2,fs2,~,~] = LoadAudioFile("music_city-traffic.wav");
    Amp2 = AnalyseSignal(y2,fs2);
    r2 = rmse(Amp2(1:300),AmpIn(1:300));

    [y3,fs3,~,~] = LoadAudioFile("music_pressure-cooker.wav");
    Amp3 = AnalyseSignal(y3,fs3);
    r3 = rmse(Amp3(1:300),AmpIn(1:300));

    [y4,fs4,~,~] = LoadAudioFile("music_water-pump.wav");
    Amp4 = AnalyseSignal(y4,fs4);
    r4 = rmse(Amp4(1:300),AmpIn(1:300));
    
    RArray = [r1 r2 r3 r4];
    r = min(RArray);
    
    if r == r1
        noiseType = "Ceiling Fan";
    elseif r == r2
        noiseType = "Traffic";
    elseif r == r3
        noiseType = "Pressure Cooker";
    elseif r == r4
        noiseType = "Water Pump";
    end    
end