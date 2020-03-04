function soundsourcefeatures(y,fs,name,number,valuename)
    sig=y;
    %% BeamPattern for 2 Microphones
    dis = 0.05;
    fftpoint = 1024;
    numfft = 1:1:fftpoint/2;
    f = numfft*fs/fftpoint;
    res = 1;
    theta = -pi:res*pi/180:pi;
    c = 345;
    numMic = 2;
    for i = 1:numMic
        SV(:,:,i) = (exp(1i*2*pi.*f'*(i-1)*dis*sin(theta)/c));
    end
    out = abs(sum(SV,3)/numMic);
    %% Sound Source Localization 
    theta = -pi/2:pi/179:pi/2;
    if numMic == 2
    %i = [1 11];
    %sig1a= sig(i(1):i(2)*fs,1);
    %sig2a= sig(i(1):i(2)*fs,2);
    sig1a= sig(:,1);
    sig2a= sig(:,2);
    s2 = sig2a;
    s1 = sig1a;
    end
    fftpoint = 1024;
    R = fftpoint;
    L = R/4;
    k = 1:1:fftpoint/2;
    w = 2*pi.*(k-1)*fs/fftpoint;
    N = numMic;
    numfft = 1:1:fftpoint/2;
    f = numfft*fs/fftpoint;
    if numMic ==2
        dis = 0.05;
    end
    SV1 = SV(:,:,1);
    SV2 = SV(:,:,2);
    Sig1=zeros(fftpoint/2,1024);
    Sig2=zeros(fftpoint/2,1024);
    for i = 1:fftpoint/2
        for j = 1:length(theta)
            SVt(i,j)= {[SV1(i,j); SV2(i,j)]};
        end 
    end
    % Beampattern

    if numMic == 2 
        for j = 1: length(theta)
            for i = 1:fftpoint/2-1
                steer(i,j) = abs(sum(SVt{i,j},1))/N;
            end 
        end 
    end 
           %%STFT
           if numMic == 2 
               [sig1,t1] = enframe(s1,hamming(R),L);
               [sig2,t2] = enframe(s2,hamming(R),L);
               for i = 1:length(sig1(:,1))
                   Sig1(i,:) = fft(sig1(i,:),fftpoint);
                   Sig2(i,:) = fft(sig2(i,:),fftpoint);
               end
               Sig1 = Sig1(:,1:end/2-1);
               Sig2= Sig2(:,1:end/2-1);
           end 
           if numMic == 2 
               nframe = 500;
               n = [1 nframe];
               for p = 1:floor(length(Sig1(:,1))/nframe)
                   Sigb1(p,:) = {Sig1(n(1):n(2),:)};
                   Sigb2(p,:) = {Sig2(n(1):n(2),:)};
                   n = n + nframe;
               end 
               for i = 1: length(Sigb1)
              % for i = 1: 11
                   for k = 1: fftpoint/2-1
                       SIG(i,k) = {[Sigb1{i}(:,k),Sigb2{i}(:,k)]};
                   end
               end
           end 
           % RXXX
    for i = 1 : length(SIG(:,1))
    %for i = 1 : 512
        for j = 1:fftpoint/2-1
            Rxx(i,j) = {(transpose(SIG{i,j})* conj(SIG{i,j}))};
        end 
    end 
    if numMic == 2
        for k = 1:length(Rxx(:,1))
            for i = 1:fftpoint/2-1
                for j = 1:length(theta)
                   Power1(i,j,k) = ...
                       abs(SVt{i,j}'*(Rxx{k,i})*SVt{i,j});
                end 
            end 
        end
        for k = 1: length(Rxx(:,1))
            for i = 1:fftpoint/2-1
                for j = 1:length(theta)
                    Power2(i,j,k) = ...
                        1/abs(SVt{i,j}'*pinv(Rxx{k,i})*SVt{i,j});
                end 
            end 
        end
        %MUSIC 2
        for k = 1:length(SIG(:,1))
            for i = 1:fftpoint/2-1
                [u,e] = eigs(Rxx{k,i});
                e_diag = diag(e);
                [e_sort,e_idx] = sort(e_diag, 'descend');
                u_sort = u(:,e_idx);
                noise_subspace = u_sort(:,1);
                for j = 1:length(theta)
                Power3(i,j,k)= 1/abs(SVt{i,j}'...
                *(noise_subspace*noise_subspace')*SVt{i,j});
                end 
            end 
        end 
    end 
    for i = 1:length(SIG(:,1))
        PowerSq1(i) = {squeeze(Power1(:,:,1))};
        PowerSq2(i) = {squeeze(Power2(:,:,1))};
        PowerSq3(i) = {squeeze(Power3(:,:,1))};
    end
    for i = 1:length(SIG(:,1))
        sumPower1(i,:) = sum(PowerSq1{i},1);
        sumPower2(i,:) = sum(PowerSq2{i},1);
        sumPower3(i,:) = sum(PowerSq3{i},1);
    end
%     figure; 
%     subplot(1,3,1);plot((theta*180/pi),sumPower1);
%     title('D & S'); xlabel('Angle'); ylabel('Power');
%     subplot(1,3,2);plot((theta*180/pi),sumPower2);
%     title('MVDR'); xlabel('Angle'); ylabel('Power');
%     subplot(1,3,3);plot(((theta)*180/pi)+9,sumPower3);
%     title('Music'); xlabel('Angle'); ylabel('Power');
%     axis([-90 90 2 max(max(sumPower3))*1.2])

%     if numMic == 2
%         x = mean(sumPower1,1);
%         [X , ind] = max(x);
%         vec = [zeros(1,ind-1),...
%             X, zeros(1,size(sumPower1,2)-ind)];
%         er1 = sqrt(norm(x-vec)/(norm(x)*numMic))
%          x = mean(sumPower2,1);
%           [X , ind] = max(x);
%           vec = [zeros(1,ind-1),X,...
%               zeros(1,size(sumPower1,2)-ind)];
%            er2 = sqrt(norm(x-vec)/(norm(x)*numMic))
%         x = mean(sumPower3,1);
%          [X , ind] = max(x);
%           vec = [zeros(1,ind-1),X,...
%               zeros(1,size(sumPower1,2)-ind)];
%            er3 = sqrt(norm(x-vec)/(norm(x)*numMic))
%     else
%          x = mean(sumPower1,1);
%          [X , ind] = max(x);
%         vec = [zeros(1,ind-1),...
%             X, zeros(1,size(sumPower1,2)-ind)];
%         er1 = sqrt(norm(x-vec)/(norm(x)*numMic))
%          x = mean(sumPower2,1);
%           [X , ind] = max(x);
%           vec = [zeros(1,ind-1),X,...
%               zeros(1,size(sumPower1,2)-ind)];
%            er2 = sqrt(norm(x-vec)/(norm(x)*numMic))
%            x = mean(sumPower3,1);
%            [X , ind] = findpeaks(x,'Npeaks',4);
%            vec = [zeros(1,ind(2)-1),X(2)...
%                ,zeros(1,ind(4)-ind(2)-1),X(4),...
%                zeros(1,size(sumPower1,2)-ind(4))];
%                er3 = sqrt(norm(x-vec)/(norm(x)*numMic))
%     end
    maxvalue=max(sumPower3);
    minvalue=min(sumPower3);
    stdvalue=std(sumPower3);
    rmsvalue=rms(sumPower3);
    skewnessvalue=skewness(sumPower3);
    kurtosisvalue=kurtosis(sumPower3);
    iqrvalue=iqr(sumPower3);
    zcrvalue=sum(abs(diff(sumPower3>0)))/length(sumPower3);
    meanvalue=mean(sumPower3);
    medianvalue=median(sumPower3);
    mean1derivalue=mean(diff(sumPower3));
    mean2derivalue=mean(diff(diff(sumPower3)));
    save(".\G"+name+"\G"+name+number+valuename+"max.mat",'maxvalue');
    save(".\G"+name+"\G"+name+number+valuename+"min.mat",'minvalue');
    save(".\G"+name+"\G"+name+number+valuename+"std.mat",'stdvalue');
    save(".\G"+name+"\G"+name+number+valuename+"rms.mat",'rmsvalue');
    save(".\G"+name+"\G"+name+number+valuename+"skewness.mat",'skewnessvalue');
    save(".\G"+name+"\G"+name+number+valuename+"kurtoisis.mat",'kurtosisvalue');
    save(".\G"+name+"\G"+name+number+valuename+"iqr.mat",'iqrvalue');
    save(".\G"+name+"\G"+name+number+valuename+"zcr.mat",'zcrvalue');
    save(".\G"+name+"\G"+name+number+valuename+"mean.mat",'meanvalue');
    save(".\G"+name+"\G"+name+number+valuename+"median.mat",'medianvalue');
    save(".\G"+name+"\G"+name+number+valuename+"mean1deri.mat",'mean1derivalue');
    save(".\G"+name+"\G"+name+number+valuename+"mean2deri.mat",'mean2derivalue');
end
