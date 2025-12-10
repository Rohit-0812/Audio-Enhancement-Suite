InputFile = "q3_music/music_water-pump_hp.wav";

run Short_FT.m

noiseType = ClassifyNoise(InputFile);
disp('The detected noise type is: ' + noiseType);