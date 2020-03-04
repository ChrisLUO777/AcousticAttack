function energyvalue=energyvalue(y,~,name,number)
    A=zeros(size(y,1)-11,2);
    for t=1:size(y,1)-11
        for i=1:10
            A(t,1)=A(t,1)+y(t+i,1).^2;
            A(t,2)=A(t,2)+y(t+i,2).^2;
        end
    end
    energyvalue(1,1) = sum(A(:,1));
    energyvalue(1,2) = std(A(:,1));
    energyvalue(1,3) = sum(A(:,2));
    energyvalue(1,4) = std(A(:,2));
    save(".\G"+name+"\G"+name+number+"energyvalue.mat",'energyvalue');
end