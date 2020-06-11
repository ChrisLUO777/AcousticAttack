clear; close all;
   elev=0;
   c=zeros(1,72);
   result=[];
for letter = ["A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"]
     for count = 1:10
         filename = strcat(num2str(letter),num2str(count));
         [Y,~] = audioread("..\soundsource\splitletter\G"+letter+"\G"+filename+".wav");
         YL=Y(:,1);
         YR=Y(:,2);
         for k=1:9
            elev=10*(k-1);
            %[HL,~]=audioread('..\full\elev0\L0e000a.wav');
            [HL,~] = audioread(['..\full\elev' num2str(elev) '\L' num2str(elev) 'e090a.wav']);
            [HR,~] = audioread(['..\full\elev' num2str(elev) '\R' num2str(elev) 'e090a.wav']);      

            XL(1:size(YL,1)+511,k)=conv(YL,HL);
            XR(1:size(YL,1)+511,k)=conv(YR,HR);
            c(1,k)=corr(XL(1:size(YL,1)+511,k),XR(1:size(YL,1)+511,k));
         end
            Confidence = max(c);
            degree=10*(find(c==max(c(:)))-1);

            a = [letter degree Confidence];
            result = [result;a];

            % dlmwrite('results.csv',result,'delimiter',',','-append');
             count = count+1 ; 
     end
end
