function tdoa=tdoalms(y,~,name,number)
    % Normalization of the input signals
    x1 = y(:,1)/max(y(:,1));
    x2 = y(:,2)/max(y(:,2));
    % Initialization
    M = 600;  % Maxi Value of Estimated TDOA
    x1c = zeros(M,1);
    x2c = zeros(M,1);
    u = zeros(2*M,1);
    u(M/2) = 1;
    N = length(x1);
    e = zeros(1,N);
    peak = zeros(1,N);
    mu = 0.01; %LMS Step
    % LMS loop
    for n=1:N
        x1c= [x1(n);x1c(1:length(x1c)-1)];
        x2c= [x2(n);x2c(1:length(x2c)-1)];
        x = [x1c;x2c];

        e(n) = u'*x;
        u = u-mu*e(n)*x;
        u(M/2) = 1; % Forcing g2 to an impulse response at M/2
        u = u/norm(u); %forcing ||u|| to 1 

        [peak(n),ind] = min(u(M+1:end));
        peak(n) =- peak(n);
        TDOA(n) = ind-M/2;
    end
     [~,ind] = max(peak);
     tdoa = TDOA(ind);
     save(".\G"+name+"\G"+name+number+"tdoalms.mat",'tdoa');
end