clc;clear all;
%% Web 1-100:
num_web=100;
num_measure=100;
samples=3000;
L=num_measure*samples;
cluster=20;
k = 1;
for i=1:cluster:num_web
    x=rmmissing(xlsread(strcat('tor',num2str(i),'_',num2str(i+cluster-1),'.csv')));
    for j=1:L:length(x)
        low_lim=j;
        up_lim=j+L-1;
        web(:,k) = x(low_lim:up_lim,1);
        k=k+1;
    end
end
%% Final X
for i=1:num_web
    p = 1;
    for k=1:num_measure
        X(:,k,i)=web(p:p+samples-1,i);
        p=p+samples;
    end
end
X=reshape(X,samples,num_web*num_measure);
X=X';

%% Final Y
for i=1:num_web
    n(:,:,i)=repmat(i-1,1,num_measure);
end
Y=reshape(n,[1,num_web*num_measure]);
Y=Y';

%%
dlmwrite('Data\X_100.csv',X);
dlmwrite('Data\Y_100.csv',Y);

%% Train data
N = size(X,1)*0.8;
interval=N/num_web;
k=1;
m=0;
for i=1:interval:N
    x_train(i:i+interval-1,:)=X(k:k+interval-1,:);
    y_train(i:i+interval-1,1)=m;
    k=k+num_measure;
    m=m+1;
end
%% validation data
N = size(X,1)*0.1;
num_measure=100;
k=interval+1;
interval=N/num_web;
m=0;
for i=1:interval:N
    x_val(i:i+interval-1,:)=X(k:k+interval-1,:);
    y_val(i:i+interval-1,1)=m;
    k=k+num_measure;
    m=m+1;
end 
%% Test data
N = size(X,1)*0.1;
num_measure=100;
k=(num_measure-interval)+1;
interval=N/num_web;
m=0;
for i=1:interval:N
    x_test(i:i+interval-1,:)=X(k:k+interval-1,:);
    y_test(i:i+interval-1,1)=m;
    k=k+num_measure;
    m=m+1;
end 
%% Saving data
dlmwrite('Data\X_train_100.csv',x_train);
dlmwrite('Data\Y_train_100.csv',y_train);
dlmwrite('Data\X_val_100.csv',x_val);
dlmwrite('Data\Y_val_100.csv',y_val);
dlmwrite('Data\X_test_100.csv',x_test);
dlmwrite('Data\Y_test_100.csv',y_test);
