clc
clear all
iter=1000;
a=1;
x_class=class3_tr();

for i=1:3
    for j=1:3
    w_hid(i,j)=rand(1);
    end
end

for i=1:3
    for j=1:2
  w_out(i,j)=rand(1);
    end
end

n=1; bias=1; n_h=3; n_o=2; n_i=3;[sample,fea]=size(x_class);
x_bias=1;
t=[x_class(:,3) x_class(:,4)];
while a<=iter
for d=1:sample
    x=[x_bias x_class(d,1)  x_class(d,2)]';
    o_hid=(x'*w_hid)';
    o_hid=power((1+exp(-o_hid)),-1);
    o_out=(o_hid'*w_out)';
    o_out=power((1+exp(-o_out)),-1);
    for k=1:n_o
        s_out(k)= o_out(k)*(1-o_out(k))*(t(d,k)-o_out(k));
    end
    for j=1:n_h
        s_hid(j)=o_hid(j)*(1-o_hid(j))*(w_out(j,:)*s_out');
    end
    
   for j=1:n_h
         for j=1:n_i
        w_hid(j,i)=w_hid(j,i)+n*s_hid(j)*x(j);
        end
   end
    
  for k=1:n_o
         for j=1:n_h
          w_out(j,k)=w_out(j,k)+n*s_out(k)*o_hid(j);
        end
    end
end
a=a+1;
end

