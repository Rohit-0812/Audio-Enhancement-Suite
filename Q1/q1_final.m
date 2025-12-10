AtFac = 0.5;
NumEchoes = 3;
TimeDelays = 4*ones(1,NumEchoes);
[y,fs,L,T] = LoadAudioFile("justtosuffer.mpeg");


[h,time,x] = Echo_Gen(TimeDelays,NumEchoes,y,fs,AtFac);

sound(x,fs);
% audiowrite("output1.wav",x,fs);

disp(fs);

figure;

subplot(3,1,1);
l = 1/fs;
t1 = 0:l:(L-1)*l;
plot(t1, y);
title('Input Signal');
xlabel("t(in s)");
ylabel("Amplitude");grid on;

subplot (3,1,2);
stem(time/fs, h);
title("Impulse Response");
xlabel("t(in s)");
ylabel("Amplitude");grid on;

subplot(3,1,3);
t2 = 0:l:(length(x)-1)*l;
plot(t2, x);
title('Output Signal');
xlabel("t(in s)");
ylabel("Amplitude");grid on;

sgtitle("Plot of the Signals ");