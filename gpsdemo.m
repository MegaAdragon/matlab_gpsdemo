load SAT_gold1023x5.txt;
S = SAT_gold1023x5;

S1 = [9.19, 2.82];
S2 = [9.12, 6.63];
S3 = [0.30, 1.39];
S4 = [0.30, 6.11];

T = zeros(1,4);
[z,Fs] = audioread('Testaufnahme1.wav');
for i=1:4
    
    N = length(S(:,i));
    c = xcov(z,S(:,i));
    c=abs(c);
    time =(0:N-1)/Fs;
    plot(time, c(1:N))
    c = c(1:N);
    [y,x] = max(c);
    T(i)=time(x);
end

P = T.*343;

x = 1;
y = 1;

for i=1:10
    L = [sqrt((S1(1)-x)^2+(S1(2) - y)^2), sqrt((S2(1)-x)^2+(S2(2) - y)^2), sqrt((S3(1)-x)^2+(S3(2) - y)^2), sqrt((S4(1)-x)^2+(S4(2) - y)^2)];

    A = [(x - S1(1))/ L(1), (y - S1(2))/L(1), 343; (x - S2(1))/ L(2), (y - S2(2))/L(2), 343; (x - S3(1))/ L(3), (y - S3(2))/L(3), 343; (x - S4(1))/ L(4), (y - S4(2))/L(4), 343;]; 

    b = [P(1)-L(1);P(2)-L(2);P(3)-L(3);P(4)-L(4)];

    E = A\b;
    
    x = x+ E(1);
    y = y+ E(2);
end

x
y