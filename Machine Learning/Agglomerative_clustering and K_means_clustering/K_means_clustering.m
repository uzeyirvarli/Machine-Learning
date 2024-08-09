clc
clear all
x=load('F:\uzeyir\uygulamalar\machine learning homework\KOM6110_ÜzeyirVARLI_18567025_Assignment4\X4.MAT');
data=struct2array(x);
sizeL=size(data);
%k=2
k=5;
out=0;
count=0;
for i=1:k
      mean_data(i,:)=data(i,:);
end
%%
%while out==0
    for m=1:1500
    last_data=mean_data;
for m=1:k
for i=1:sizeL(1)
   cluster(m,i)=sqrt((data(i,1)-mean_data(m,1))^2+(data(i,2)-mean_data(m,2))^2);
  end
end
 cluster= cluster';
 
%%
if k==2
    i1=1; i2=1; 
    for i=1:sizeL(1)
        if cluster(i,1)<cluster(i,2)
           data1(i1,:) =data(i,:);
            i1=i1+1;
        else 
        data2(i2,:) =data(i,:);
        i2=i2+1;
        end
        
    end
    mean_data(1,:)=mean(data1);
    mean_data(2,:)=mean(data2);
   

end
%%
if k==3
     i1=1; i2=1; i3=1; 
    for i=1:sizeL(1)
        if cluster(i,1)<cluster(i,2) && cluster(i,1)<cluster(i,3)
           data1(i1,:) =data(i,:);
            i1=i1+1;
        elseif  cluster(i,2)<cluster(i,1) && cluster(i,2)<cluster(i,3)
%             
            data2(i2,:) =data(i,:);
            i2=i2+1;
            else 
              data3(i3,:) =data(i,:);
            i3=i3+1;
        
        end
    end
    mean_data(1,:)=mean(data1);
    mean_data(2,:)=mean(data2);
    mean_data(3,:)=mean(data3);
     plot(mean_data(1,1),mean_data(1,2),'k*','LineWidth',5,'MarkerSize',10);
     hold on
     plot(data1(:,1),data1(:,2),'ro',data2(:,1),data2(:,2),...
         'g*',data3(:,1),data3(:,2),'bo');
     hold off
     xlabel('1st feature')
     ylabel('2nd tfeature')
    
    
end
%%
if k==4
     i1=1; i2=1; i3=1; i4=1;  
    for i=1:sizeL(1)
        if cluster(i,1)<cluster(i,2) && cluster(i,1)<cluster(i,3)  && cluster(i,1)<cluster(i,4)
           data1(i1,:) =data(i,:);
            i1=i1+1;
        elseif  cluster(i,2)<cluster(i,1) && cluster(i,2)<cluster(i,3)  && cluster(i,1)<cluster(i,4)             
            data2(i2,:) =data(i,:);
            i2=i2+1;
       elseif  cluster(i,3)<cluster(i,1) && cluster(i,3)<cluster(i,2)  && cluster(i,3)<cluster(i,4)
            data3(i3,:) =data(i,:);
            i3=i3+1;
          else 
            data4(i4,:) =data(i,:);
            i4=i4+1;        
        end
    end
    mean_data(1,:)=mean(data1);
    mean_data(2,:)=mean(data2);
    mean_data(3,:)=mean(data3);
    mean_data(4,:)=mean(data4);
     plot(data1(:,1),data1(:,2),'ro',data2(:,1),data2(:,2),'g*',data3(:,1),data3(:,2),'bo',data4(:,1),data4(:,2),'ko');
end
%%
if k==5
 i1=1; i2=1; i3=1; i4=1; i5=1; 
for i=1:sizeL(1)
        if cluster(i,1)<cluster(i,2) && cluster(i,1)<cluster(i,3)  && cluster(i,1)<cluster(i,4) && cluster(i,1)<cluster(i,5)
           data1(i1,:) =data(i,:);
            i1=i1+1;
        elseif  cluster(i,2)<cluster(i,1) && cluster(i,2)<cluster(i,3)  && cluster(i,2)<cluster(i,4) && cluster(i,2)<cluster(i,5)
%             
            data2(i2,:) =data(i,:);
            i2=i2+1;
            
        elseif  cluster(i,3)<cluster(i,1) && cluster(i,3)<cluster(i,2)  && cluster(i,3)<cluster(i,4)&& cluster(i,1)<cluster(i,5)
            data3(i3,:) =data(i,:);
            i3=i3+1;
        elseif  cluster(i,4)<cluster(i,1) && cluster(i,4)<cluster(i,2)  && cluster(i,4)<cluster(i,3)&& cluster(i,4)<cluster(i,5)
            data4(i4,:) =data(i,:);
            i4=i4+1;
        else 
            data5(i5,:) =data(i,:);
            i5=i5+1;
            
        end
    end
    mean_data(1,:)=mean(data1);
    mean_data(2,:)=mean(data2);
    mean_data(3,:)=mean(data3);
    mean_data(4,:)=mean(data4);
    mean_data(5,:)=mean(data5);
    plot(data1(:,1),data1(:,2),'ro',data2(:,1),data2(:,2),'g*',data3(:,1),data3(:,2),'bo',data4(:,1),data4(:,2),'ko',data5(:,1),data5(:,2),'m*');
end
%%
if last_data-mean_data==0
    out=1;
    %i1=1; i2=1; i3=1; i4=1; i5=1;
end
count=count+1;
out=1;
    end
 
  if k==2
  
      figure(1)
     plot(mean_data(1,:),mean_data(2,:),'k*','LineWidth',5,'MarkerSize',10);
     hold on
     plot(data1(:,1),data1(:,2),'ro',data2(:,1),data2(:,2),'g*');
     hold off
     xlabel('1st feature')
     ylabel('2nd tfeature')
     legend('center point');
    
 end  

if k==3
  
     plot(mean_data(1,1),mean_data(1,2),'k*','LineWidth',5,'MarkerSize',10);
     hold on
     plot(mean_data(2,1),mean_data(2,2),'k*','LineWidth',5,'MarkerSize',10);
     hold on
     plot(mean_data(3,1),mean_data(3,2),'k*','LineWidth',5,'MarkerSize',10);
     hold on
     plot(data1(:,1),data1(:,2),'ro',data2(:,1),data2(:,2),...
         'g*',data3(:,1),data3(:,2),'bo');
     hold off
     xlabel('1st feature')
     ylabel('2nd tfeature')
     legend('center point');
    
end
 

if k==4
     plot(mean_data(1,1),mean_data(1,2),'k*','LineWidth',5,'MarkerSize',10);
     hold on
     plot(mean_data(2,1),mean_data(2,2),'k*','LineWidth',5,'MarkerSize',10);
     hold on
     plot(mean_data(3,1),mean_data(3,2),'k*','LineWidth',5,'MarkerSize',10);
     hold on
      plot(mean_data(4,1),mean_data(4,2),'k*','LineWidth',5,'MarkerSize',10);
     hold on
      plot(data1(:,1),data1(:,2),'ro',data2(:,1),data2(:,2),'g*',data3(:,1),data3(:,2),'bo',data4(:,1),data4(:,2),'mo');
     hold off
     xlabel('1st feature')
     ylabel('2nd tfeature')
     legend('center point');
    
end
 
if k==5
     plot(mean_data(1,1),mean_data(1,2),'k*','LineWidth',5,'MarkerSize',10);
     hold on
     plot(mean_data(2,1),mean_data(2,2),'k*','LineWidth',5,'MarkerSize',10);
     hold on
     plot(mean_data(3,1),mean_data(3,2),'k*','LineWidth',5,'MarkerSize',10);
     hold on
      plot(mean_data(4,1),mean_data(4,2),'k*','LineWidth',5,'MarkerSize',10);
     hold on
     plot(mean_data(5,1),mean_data(1,2),'k*','LineWidth',5,'MarkerSize',10);
     hold on
     plot(data1(:,1),data1(:,2),'ro',data2(:,1),data2(:,2),'g*',...
     data3(:,1),data3(:,2),'bo',data4(:,1),data4(:,2),'o',data5(:,1),data5(:,2),'m*');
     
     hold off
     xlabel('1st feature')
     ylabel('2nd tfeature')
     legend('center point');
    
 end

