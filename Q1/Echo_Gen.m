function [h,time,x] = Echo_Gen(Delays,NumEchoes,y,fs,AttenuationFactor)



% Delays = zeros(1,n);
% for i = 1:n
%     prompt = "time" ;
%     Delays(i) = input(prompt);
% end


AmpScale = zeros(1,NumEchoes+1);
AmpScale(1) = 1;
for i = 2:NumEchoes+1
    AmpScale(i) = AmpScale(i-1)*AttenuationFactor;
end

q = zeros(1,NumEchoes);
for i = 1:NumEchoes
    q(i) = Delays(i)*fs;
end
b = zeros(1,sum(q)+1);
for i = 1:NumEchoes
    start = 1 + sum(q(1:i-1));
    endi = sum(q(1:i)) + 1;
    b(start:endi) = [AmpScale(i), zeros(1, q(i)-1),AmpScale(i+1)];
end
a = 1;


[h,time] = impz(b,a);
x = conv(y(:, 1),h,'full');





end