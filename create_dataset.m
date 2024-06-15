function [X,Y] = create_dataset(dataset, look_back,x)
X = pyrun("X = []","X");
Y = pyrun("Y = []","Y");
x = length(dataset.tolist())-look_back;
for i = 0:x-1
    a = pyrun("a = dataset[int(i):(int(i)+int(look_back))]","a",dataset = dataset,i = i, look_back = look_back);
    X = pyrun("X.append(a)","X",a = a);
    Y = pyrun("Y.append(dataset[int(i) + int(look_back), 0])","Y",dataset = dataset,i = i, look_back = look_back);
end
X = pyrun("X = np.array(X)","X");
Y = pyrun("Y = np.array(Y)","Y");
end
