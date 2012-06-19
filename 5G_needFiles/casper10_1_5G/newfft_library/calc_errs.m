in=real(yout(1:64,9));
f=fft(in);

xilsync=find(yout(:,2));
xil=yout(xilsync(1)+[1:64],1);

oldsync=find(yout(:,4));
old=yout(oldsync(1)+[1:64],3);

newsync=find(yout(:,6));
new=yout(newsync(1)+[1:64],5);

qr4sync=find(yout(:,8));
qr4=yout(qr4sync(1)+[1:64],7);

xilerr=f-xil;
olderr=f-old;
newerr=f-new;
qr4err=f-qr4;
