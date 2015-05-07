fileID = fopen('gold1023impulse.txt','r');
formatSpec = '%f %f %f %f';
sizeA = [4 Inf];
A = fscanf(fileID,formatSpec, sizeA);
A = A';
S1 = A(:,1)

[y,Fs] = audioread('Testaufnahme1.wav');
N = length(y);
c = xcov(y,S1);
c=abs(c);
time =(0:N-1)/Fs;
plot(time, c(end-N+1:end));
[x,y] = max(c);
time(x)
