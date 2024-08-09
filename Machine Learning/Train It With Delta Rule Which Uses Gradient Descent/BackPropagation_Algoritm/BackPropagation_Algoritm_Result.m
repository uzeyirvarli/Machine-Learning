clc
x_class=class3_text();
[sample,fea]=size(x_class);
for d=1:sample
    x=[x_bias x_class(d,1)  x_class(d,2)]';
    o_hid=(x'*w_hid)';
    o_hid=power((1+exp(-o_hid)),-1);
    o_out=(o_hid'*w_out)';
    o_out=power((1+exp(-o_out)),-1)
    out1(d)=o_out(1,1);
    out2(d)=o_out(2,1);
end
out=[out1' x_class(:,3) out2'  x_class(:,4)]

smp=1:sample;
plot(smp,out1','x',smp,x_class(:,3),'r.');

%plot(smp,out2','x',smp,x_class(:,4),'r.');