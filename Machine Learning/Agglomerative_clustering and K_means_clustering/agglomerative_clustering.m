clc
clear all
x=load('F:\uzeyir\uygulamalar\machine learning homework\KOM6110_ÜzeyirVARLI_18567025_Assignment4\X4.MAT');
data=struct2array(x);
%data=[0.40 0.53;0.22 0.38;0.35 0.32;0.26 0.19;0.08 0.41;0.45 0.30];
sizeL=size(data);
k=1;
%% 
 while sizeL(1)>=2
%%
for i=1:sizeL(1)
  for j=1:sizeL(1)
    y(i,j)=sqrt((data(i,1)-data(j,1))^2+(data(i,2)-data(j,2))^2);
    m(i,j)=sqrt((data(i,1)-data(j,1))^2+(data(i,2)-data(j,2))^2);
  end
end

%%
for m=1:sizeL(1)
  for i=1:sizeL(1)-1
   for j=1:sizeL(1)-1
    if y(m,j)>y(m,j+1)
        a=y(m,j);
       y(m,j)=y(m,j+1);
       y(m,j+1)=a;
    end
   end
  end
end

for m=1:sizeL(1)
    min_value=min(y(:,2));
end
%%
for i=1:sizeL(1)
  for j=1:sizeL(1)
    y(i,j)=sqrt((data(i,1)-data(j,1))^2+(data(i,2)-data(j,2))^2);
  end
end

%%
for i=1:sizeL(1)
  for j=1:sizeL(1)
   if(min_value==y(i,j))
     i_min(k)=i;
     j_min(k)=j;
      break;
   end
  end
end
   
%%
for i=1:sizeL(1)
    if(i_min(k)~=i && j_min(k)~=j)
       y(i_min(k),i)=min(y(i_min(k),i),y(j_min(k),i));
       y(i_min(k),i)=y(i,i_min(k));
    end
end

 del=max(i_min(k),j_min(k));
 %fprintf('%d,%d \n',i_min,j_min)
y(del,:)=[];
y(:,del)=[];
sizeL(1)=sizeL(1)-1;
k=k+1;
   if sizeL(1)<=13
       y
   end
end

for m=1:k-2
    %fprintf('(%d,%d )',i_min(m),j_min(m));
    plot(i_min(m),j_min(m),'r*','LineWidth',5,'MarkerSize',10);
    hold on;
end
   hold off
