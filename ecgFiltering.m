%loading data
ecg =load('ecg_hfn.dat');
ecg=ecg(1:3000,1)
t=1:3000
rand_noise=ecg+rand(3000,1);
sin_noise=20*sin(2*pi*50*t);
signal=rand_noise+sin_noise;

N=length(signal)
y=zeros(N);

for n=5:N
    y(n)=0.2*signal(n)+0.1*signal(n-1)+0.1*signal(n-2)+0.2*signal(n-3);
end

%sampling frequency 
fs=250;

dft=fft(y);
H=abs(dft);
mag=20*log(H);
f=(0:length(y)-1)*fs/length(y);

k=zeros(3000,2);
k(:,1)=t'
k(:,2)=signal(:,1)



subplot 221
plot(ecg)
subplot 222
plot(signal)
subplot 223
plot(y)
subplot 224
plot(f,mag)
