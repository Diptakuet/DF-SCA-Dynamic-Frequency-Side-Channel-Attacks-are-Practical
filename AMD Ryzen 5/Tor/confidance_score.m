clc;clear all;
a=readmatrix('Raw_prediction_cnn.txt');  % Update the file name for other ML models except for CNN

num_web=100;
num_measure=1000;
col_name={};
for k=1:num_web
    col_name=[col_name,num2str(k)];
end
row_name={};
for k=1:num_measure
    row_name=[row_name,num2str(k)];
end

a_new=array2table(a,'RowNames',row_name,'VariableNames',col_name);
b=rows2vars(a_new);

for i=1:num_measure
    [sorted,index]=sortrows(b,strcat('x',num2str(i)),'descend');
    web_index(:,i)=index(1:5);
end

p=1;
c=1;
tp=0;
interval=10;
for i=1:interval:num_measure
    for j=i:i+interval-1
        for k=1:5
            if web_index(k,j)==c
                tp=tp+1;
            end
        end
    end
    c=c+1;
end

score=(tp/1000)*100
