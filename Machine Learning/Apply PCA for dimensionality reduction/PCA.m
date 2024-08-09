%%
clc;
data=iris_data_tb();
[length,element]=size(data);

%% seperated class
i=1;
j=1;
k=1;
for m=1:length
    if(data(m,2)==0)
        class3(i,:)=data(m,:);
        class3(i,1)=i;
        i=i+1;
    elseif (data(m,2)==1)
        class2(j,:)=data(m,:);
        class2(j,1)=j;
        j=j+1;
        elseif (data(m,2)==2)
        class3(k,:)=data(m,:);
        class3(k,1)=k;
        k=k+1;
    end
end

%% Obtain feature
  class3_1=class3(:,3); class3_2=class3(:,2);  class3_3=class3(:,3); class3_2=class3(:,4);
  class2_1=class2(:,3); class2_2=class2(:,2);  class2_3=class2(:,3); class2_2=class2(:,4);
  class3_1=class3(:,3); class3_2=class3(:,2);  class3_3=class3(:,3); class3_2=class3(:,4);
  
 mean_class3_1=mean(class3_1); mean_class3_2=mean(class3_2); mean_class3_3=mean(class3_3); mean_class3_2=mean(class3_2);
 fea_class3=[class3_1 class3_2 class3_3 class3_2];
 mean_class3=[ mean_class3_1  mean_class3_2  mean_class3_3  mean_class3_2];

 mean_class2_1=mean(class2_1); mean_class2_2=mean(class2_2); mean_class2_3=mean(class2_3); mean_class2_2=mean(class2_2);
 fea_class3=[class2_1 class2_2 class2_3 class2_2];
 mean_class2=[ mean_class2_1  mean_class2_2  mean_class2_3  mean_class2_2];
 
 mean_class3_1=mean(class3_1); mean_class3_2=mean(class3_2); mean_class3_3=mean(class3_3); mean_class3_2=mean(class3_2);
 fea_class3=[class3_1 class3_2 class3_3 class3_2];
 mean_class3=[ mean_class3_1  mean_class3_2  mean_class3_3  mean_class3_2];
  %%  QUESTION1  Apply PCA for dimensionality reduction to have only one-dimensional data
  %%
fea_class1=fea_class1-mean_class1;
fea_class1(:,1)=(fea_class1(:,1)-min(fea_class1(:,1)))/(max(fea_class1(:,1))-min(fea_class1(:,1)));
fea_class1(:,2)=(fea_class1(:,2)-min(fea_class1(:,2)))/(max(fea_class1(:,2))-min(fea_class1(:,2)));
fea_class1(:,3)=(fea_class1(:,3)-min(fea_class1(:,3)))/(max(fea_class1(:,3))-min(fea_class1(:,3)));
fea_class1(:,4)=(fea_class1(:,4)-min(fea_class1(:,4)))/(max(fea_class1(:,4))-min(fea_class1(:,4)));
covariance_class1=cov(fea_class1);
[eigen_vectors_class1,eigen_value_class1]=eig(covariance_class1);
A_class1=[eigen_vectors_class1(:,4)];


fea_class2=fea_class2-mean_class2;
fea_class2(:,1)=(fea_class2(:,1)-min(fea_class2(:,1)))/(max(fea_class2(:,1))-min(fea_class2(:,1)));
fea_class2(:,2)=(fea_class2(:,2)-min(fea_class2(:,2)))/(max(fea_class2(:,2))-min(fea_class2(:,2)));
fea_class2(:,3)=(fea_class2(:,3)-min(fea_class2(:,3)))/(max(fea_class2(:,3))-min(fea_class2(:,3)));
fea_class2(:,4)=(fea_class2(:,4)-min(fea_class2(:,4)))/(max(fea_class2(:,4))-min(fea_class2(:,4)));
covariance_class2=cov(fea_class2);
[eigen_vectors_class2,eigen_value_class2]=eig(covariance_class2);
A_class2=[eigen_vectors_class2(:,4)];


fea_class3=fea_class3-mean_class3;
fea_class3(:,1)=(fea_class3(:,1)-min(fea_class3(:,1)))/(max(fea_class3(:,1))-min(fea_class3(:,1)));
fea_class3(:,2)=(fea_class3(:,2)-min(fea_class3(:,2)))/(max(fea_class3(:,2))-min(fea_class3(:,2)));
fea_class3(:,3)=(fea_class3(:,3)-min(fea_class3(:,3)))/(max(fea_class3(:,3))-min(fea_class3(:,3)));
fea_class3(:,4)=(fea_class3(:,4)-min(fea_class3(:,4)))/(max(fea_class3(:,4))-min(fea_class3(:,4)));
covariance_class3=cov(fea_class3);
[eigen_vectors_class3,eigen_value_class3]=eig(covariance_class3);

A_class3=[eigen_vectors_class3(:,4)];
sample=1:50;
for i=1:50
   y_class1=A_class1'*fea_class1';
   y_class2=A_class2'*fea_class2';
   y_class3=A_class3'*fea_class3';
end
% plot(sample,y_class1,'bo',sample,y_class2,'*',sample,y_class3,'*');
% xlabel('Feature');
% ylabel('Feature');
% legend('class1','class2','class3')
%% QUESTION2  Apply PCA for dimensionality reduction to have only two-dimensional data
%% Obtain transform matriv 
T_class1_12=[eigen_vectors_class1(:,1),eigen_vectors_class1(:,2)];
T_class1_13=[eigen_vectors_class1(:,1),eigen_vectors_class1(:,3)];
T_class1_14=[eigen_vectors_class1(:,1),eigen_vectors_class1(:,4)];
T_class1_23=[eigen_vectors_class1(:,2),eigen_vectors_class1(:,3)];
T_class1_24=[eigen_vectors_class1(:,2),eigen_vectors_class1(:,4)];
T_class1_34=[eigen_vectors_class1(:,3),eigen_vectors_class1(:,4)];

T_class2_12=[eigen_vectors_class2(:,1),eigen_vectors_class2(:,2)];
T_class2_13=[eigen_vectors_class2(:,1),eigen_vectors_class2(:,3)];
T_class2_14=[eigen_vectors_class2(:,1),eigen_vectors_class2(:,4)];
T_class2_23=[eigen_vectors_class2(:,2),eigen_vectors_class2(:,3)];
T_class2_24=[eigen_vectors_class2(:,2),eigen_vectors_class2(:,4)];
T_class2_34=[eigen_vectors_class2(:,3),eigen_vectors_class2(:,4)];

T_class3_12=[eigen_vectors_class3(:,1),eigen_vectors_class3(:,2)];
T_class3_13=[eigen_vectors_class3(:,1),eigen_vectors_class3(:,3)];
T_class3_14=[eigen_vectors_class3(:,1),eigen_vectors_class3(:,4)];
T_class3_23=[eigen_vectors_class3(:,2),eigen_vectors_class3(:,3)];
T_class3_24=[eigen_vectors_class3(:,2),eigen_vectors_class3(:,4)];
T_class3_34=[eigen_vectors_class3(:,3),eigen_vectors_class3(:,4)];
%%

for i=1:50
   y1_class1=T_class1_12'*fea_class1'; y1_class1=y1_class1';
   y1_class2=T_class2_12'*fea_class2'; y1_class2=y1_class2';
   y1_class3=T_class3_12'*fea_class3'; y1_class3=y1_class3';
end



for i=1:50
   y2_class1=T_class1_13'*fea_class1'; y2_class1=y2_class1';
   y2_class2=T_class2_13'*fea_class2'; y2_class2=y2_class2';
   y2_class3=T_class3_13'*fea_class3'; y2_class3=y2_class3';
end


for i=1:50
   y3_class1=T_class1_14'*fea_class1'; y3_class1=y3_class1';
   y3_class2=T_class2_14'*fea_class2'; y3_class2=y3_class2';
   y3_class3=T_class3_14'*fea_class3'; y3_class3=y3_class3';
end

for i=1:50
   y4_class1=T_class1_23'*fea_class1'; y4_class1=y4_class1';
   y4_class2=T_class2_23'*fea_class2'; y4_class2=y4_class2';
   y4_class3=T_class3_23'*fea_class3'; y4_class3=y4_class3';
end

for i=1:50
   y5_class1=T_class1_24'*fea_class1'; y5_class1=y5_class1';
   y5_class2=T_class2_24'*fea_class2'; y5_class2=y5_class2';
   y5_class3=T_class3_24'*fea_class3'; y5_class3=y5_class3';
end

for i=1:50
   y6_class1=T_class1_34'*fea_class1'; y6_class1=y6_class1';
   y6_class2=T_class2_34'*fea_class2'; y6_class2=y6_class2';
   y6_class3=T_class3_34'*fea_class3'; y6_class3=y6_class3';
end
figure(1);
plot(y1_class1(:,1),y1_class1(:,2),'*',y1_class2(:,1),y1_class2(:,2),'.',y1_class3(:,1),y1_class3(:,2),'*')
plot(sample,y_class1,'bo',sample,y_class2,'*',sample,y_class3,'*');
xlabel('Pair1');
ylabel('Pair2');
legend('class1','class2','class3')

figure(2);
plot(y2_class1(:,1),y2_class1(:,2),'*',y2_class2(:,1),y2_class2(:,2),'.',y2_class3(:,1),y2_class3(:,2),'*')
xlabel('Pair1');
ylabel('Pair3');
legend('class1','class2','class3')

figure(3);
plot(y3_class1(:,1),y3_class1(:,2),'*',y3_class2(:,1),y3_class2(:,2),'.',y3_class3(:,1),y3_class3(:,2),'*')
xlabel('Pair1');
ylabel('Pair4');
legend('class1','class2','class3')

figure(4);
plot(y4_class1(:,1),y4_class1(:,2),'*',y4_class2(:,1),y4_class2(:,2),'.',y4_class3(:,1),y4_class3(:,2),'*')
xlabel('Pair2');
ylabel('Pair3');
legend('class1','class2','class3')

figure(5);
plot(y5_class1(:,1),y5_class1(:,2),'*',y5_class2(:,1),y5_class2(:,2),'.',y5_class3(:,1),y5_class3(:,2),'*')
xlabel('Pair2');
ylabel('Pair4');
legend('class1','class2','class3')

figure(6);
plot(y6_class1(:,1),y6_class1(:,2),'*',y6_class2(:,1),y6_class2(:,2),'.',y6_class3(:,1),y6_class3(:,2),'*')
xlabel('Pair3');
ylabel('Pair4');
legend('class1','class2','class3')




















