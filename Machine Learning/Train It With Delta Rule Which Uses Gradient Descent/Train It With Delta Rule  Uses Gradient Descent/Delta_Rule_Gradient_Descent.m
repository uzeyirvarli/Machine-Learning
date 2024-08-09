clc
clear all
x=class2_tr();

for i=1:3
    w(i)=rand(1);
    deltaw(i)=0;
   
end
n=0.2;
bias=1;
[sample,fea]=size(x);
fea=fea-1;

for i=1:sample
    v(i)=w(1)*x(i,1)+w(2)*x(i,1)+bias*w(3);
    o(i)=1/(1+exp(-v(i)));
    t(i)=x(i,3);
end

for k=1:15
for i=1:fea+1
     for d =1:sample
         if i<=2
        deltaw(i)=deltaw(i)+n*(t(d)-o(d))*x(d,i);
         else
        deltaw(i)=deltaw(i)+n*(t(d)-o(d))*bias;
        end
     end
      w(i)=w(i)+deltaw(i);
      
end
  
    for i=1:sample
    v(i)=w(1)*x(i,1)+w(2)*x(i,1)+bias*w(3);
    o(i)=1/(1+exp(-v(i)));
    end

end

x=class2_test();

[sample,fea]=size(x);
fea=fea-1;
for i=1:sample
    v_test(i)=w(1)*x(i,1)+w(2)*x(i,1)+bias*w(3);
    o_test(i)=1/(1+exp(-v_test(i)));
    t_test(i)=x(i,3);
end

for i=1:sample
    smp(i)=i;
end

plot(smp,o_test,'x',smp,t_test,'r.')
legend('output','reference')
xlabel('sample')
ylabel('value')
[o_test' t_test']