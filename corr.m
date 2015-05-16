function [ kf ] = corr( x,y )
%CORR correlates x with y using scalar vektormultiplikation. x has to be
%double the length of y, since the function is used only internally this is
%not being validated
N = length(y);
kf = zeros(N,1);
x = x-mean(x);
y = y-mean(y);
for i=1:N
   kf(i)= dot(x(i:N+i-1),y(1:N));
end
kf=abs(kf)/N;
end

