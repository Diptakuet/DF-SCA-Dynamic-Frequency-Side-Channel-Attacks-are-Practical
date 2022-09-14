clear all
close all
clc

train6 = importdata('data_train_6.mat');
train7 = importdata('data_train_7.mat');
train8 = importdata('data_train_8.mat');
train9 = importdata('data_train_9.mat');

test6 = importdata('data_test_6.mat');
test7 = importdata('data_test_7.mat');
test8 = importdata('data_test_8.mat');
test9 = importdata('data_test_9.mat');

data_train = train9;
data_train(71:154,1:7) = train8;
data_train(155:224,1:6) = train7;
data_train(225:350,1:5) = train6;

data_test = test9;
data_test(31:66,1:7) = test8;
data_test(67:96,1:6) = test7;
data_test(97:150,1:5) = test6;

for i = 1 : length(data_train)/7
    Y((i-1)*7+1:i*7) = i-1;
end

model = fitcknn(data_train,Y,'Distance','euclidean','NumNeighbors',4);
model.BreakTies = 'nearest';
[label, score] = predict(model,data_test);


cnt = 1;
for i = 1 : length(label)
    if (label(i)==floor((i-1)/3))
        cnt = cnt + 1;
    end
end

cnt/length(label)
