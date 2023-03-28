clc
clear
close all

min_num = 0; %number of minimum number in dataset
max_num = 9; %number of maximum number in dataset
dim = 2;  %dimension of output data

data = [];
label = [];
for i = min_num:max_num
    path = ['Hand-written Digits dataset\train.',num2str(i)];
    train = load(path);
    data = [data ; train];
    label = [label ; i*ones(size(train,1),1)];
end

D = OR_distance(data,label);
Y = isomap(D,dim);

D2 = pdist(data);
D2 = squareform(D2);
Y2 = isomap(D2,dim);

C = linspecer(max_num-min_num+1);

if dim == 2
    figure(1)
    count = 1;
    for i = min_num:max_num
        range = find(label == i);
        scatter(Y(range,1)',Y(range,2)',[],C(count,:),'filled','DisplayName',num2str(i));
        hold on
        count =count+1;
    end
    title('The result of isomap with our distance function')
    hold off
    legend

    figure(2)
    count = 1;
    for i = min_num:max_num
        range = find(label == i);
        scatter(Y2(range,1)',Y2(range,2)',[],C(count,:),'filled','DisplayName',num2str(i));
        hold on
        count =count+1;
    end
    title('The result of isomap with original distance function')
    hold off
    legend
end


