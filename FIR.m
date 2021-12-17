%% DIRECT FORM BY W[n]=1

clc; clear all; close all;
Ws=0.75*pi;
Wp=0.5*pi;
delta=0.1;
delW=Ws-Wp;
Wc=(Wp+Ws)/2;
A=-1*20*log10(delta);
M=(A-8)/(2.28*delW);
M=ceil(M);
alpha=M/2;
h=zeros(1,(M+1));

for n=1:(M+1)
a=sin(Wc*(n-alpha));
b=pi*(n-alpha);
h(n)=a/b;                % COMPUTING H(n) or Bk's
end
x1=[1 2 3 4];
len=length(x1);
x=[x1 zeros(1,(M-len))];  % PADDING ZEROS

temp=zeros(1,(M+1));
y=zeros(1,(M+1));
out=zeros(1,(M+1));

for i=1:M
    temp(1)=x(i);
    temp1=[0 temp];
    temp=temp1;
    temp(end)=[];
    y= h.*temp;
    out(i)=sum(y);
end

