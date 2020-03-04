function energyratio=energyratio(y,~,name,number)
    A=zeros(size(y,1)-11,2);
    for t=1:size(y,1)-11
        for i=1:10
            A(t,1)=A(t,1)+y(t+i,1).^2;
            A(t,2)=A(t,2)+y(t+i,2).^2;
        end
    end
    energyratio = sum(A(:,1))/sum(A(:,2));
    save(".\G"+name+"\G"+name+number+"energyratio.mat",'energyratio');
end