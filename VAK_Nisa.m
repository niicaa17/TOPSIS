X = load('gayabelajarku.dat');
Inp = X(:,1);
Out = X(:,3);
% fismat = genfis2(Inp,Out,0.2);
% fuzout = evalfis(Inp,fismat);
% disp([Out fuzout])
% RMSE = norm(fuzout-Out)/sqrt(length(fuzout))
plot(Inp,Out,'bo');
title('Visual Vs Kinestetik');
xlabel('Visual');
ylabel('Kinestetik');
pause
X = load('gayabelajarku.dat');
Inp = X(:,2);
Out = X(:,3);
% fismat = genfis2(Inp,Out,0.2);
% fuzout = evalfis(Inp,fismat);
% disp([Out fuzout])
% RMSE = norm(fuzout-Out)/sqrt(length(fuzout))
plot(Inp,Out,'bo');
title('Auditori vs Kinestetik');
xlabel('Auditori');
ylabel('Kinestetik');
pause
X = load('gayabelajarku.dat');
Inp = X(:,1);
Out = X(:,2);
% fismat = genfis2(Inp,Out,0.2);
% fuzout = evalfis(Inp,fismat);
% disp([Out fuzout])
% RMSE = norm(fuzout-Out)/sqrt(length(fuzout))
plot(Inp,Out,'bo');
title('Visual vs Auditori');
xlabel('Visual');
ylabel('Kinestetik');