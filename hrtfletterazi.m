clear; close all;
   elev=0;
   azim=0;
   c=zeros(1,72);
   result=[];
for letter = ["A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"]
     for count = 1:10
         filename = strcat(num2str(letter),num2str(count));
         [Y,~] = audioread(".\single key samples\splitsp\G"+letter+"\G"+filename+".wav");
         YL=Y(:,1);
         YR=Y(:,2);
         corrcount=1;
         for referletter = ["A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"]
            for refercount = 1:10
                 referfilename = strcat(num2str(referletter),num2str(refercount));
                 [H,~] = audioread(".\single key samples\splitsp\G"+referletter+"\G"+referfilename+".wav");
                 HL=Y(:,1);
                 HR=Y(:,2);
                 XL(1:size(YL,1)+size(HL,1)-1,corrcount)=conv(YL,HL);
                 XR(1:size(YR,1)+size(HR,1)-1,corrcount)=conv(YR,HR);
                 c(1,corrcount)=corr(XL(1:size(YL,1)+size(HL,1)-1,corrcount),XR(1:size(YR,1)+size(HR,1)-1,corrcount));
                 corrcount=corrcount+1;
            end
         end
            Confidence = max(c);
            degree=find(c==max(c(:)))-1;
            a = [letter degree Confidence];
            result = [result;a];

            % dlmwrite('results.csv',result,'delimiter',',','-append');
             count = count+1 ; 
     end
end
