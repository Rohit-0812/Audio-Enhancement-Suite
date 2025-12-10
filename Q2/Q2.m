[DesiredSignal,fs] = audioread("hindi_2s.wav");
sound(DesiredSignal,fs);
pause(length(DesiredSignal)/fs + 0.1);
[InputSignal,fs1] = audioread("max_echo.wav");
sound(InputSignal,fs1);
pause(length(DesiredSignal)/fs + 0.1);
[OutputSignal , ErrorSignal ] = nlms(DesiredSignal,InputSignal,1024);
sound(OutputSignal,fs1);
pause(length(DesiredSignal)/fs + 0.1);

figure;
subplot 221;
plot(DesiredSignal);
xlabel("Time t");
ylabel("Amplitude");
title("Desired Signal");
subplot 222;
plot(InputSignal);
xlabel("Time t");
ylabel("Amplitude");
title("Input Signal with Echo")
subplot 223;
plot(OutputSignal);
xlabel("Time t");
ylabel("Amplitude");
title("Signal without Echo");
subplot 224;
plot(ErrorSignal);
xlabel("Time t");
ylabel("Amplitude");
title("Error Signal");
sgtitle("Plots for the Signals");

[Corr,Lags] = xcorr(InputSignal,DesiredSignal);
figure;
plot(Lags,Corr);
xlabel("Time t");
ylabel("Amplitude")