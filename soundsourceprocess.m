close all; clear;
key="0";
[y,Fs] = audioread("E:\MATLABprogram\AcousticAttack\soundsource\wav\"+key+".wav");
%mkdir("E:\MATLABprogram\AcousticAttack\soundsource\splitsp\"+key);
y=bandpass(y,[1000 1500],Fs);
%plot(y(:,1));
peaks=hitpeak(y,0.005);
count=1;
for left=1:20
    if peaks(left,1)~=0
        for right=1:20
            if peaks(left,1)-peaks(right,2)<500 && peaks(left,1)-peaks(right,2)>-500 %match left and right peaks
                if peaks(left,1)<peaks(right,2)
                    audiowrite("E:\MATLABprogram\AcousticAttack\soundsource\splitsp\"+key+"\"+key+count+".wav",...
                    y(peaks(left,1)-882:peaks(right,2)+7938,:),Fs);
                    count=count+1;
                    peaks(left,1)
                    peaks(right,2)
                else
                    audiowrite("E:\MATLABprogram\AcousticAttack\soundsource\splitsp\"+key+"\"+key+count+".wav",...
                    y(peaks(right,2)-882:peaks(left,1)+7938,:),Fs);
                    count=count+1;
                    peaks(left,1)
                    peaks(right,2)
                end
                break;
            end
        end
    end
end