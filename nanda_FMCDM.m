clc;
clear;

%% ===============================
% INPUT JUMLAH
% ===============================
nAlt  = input('Masukkan jumlah alternatif : ');
nKrit = input('Masukkan jumlah kriteria  : ');

%% ===============================
% INPUT NAMA ALTERNATIF
% ===============================
Alternatif = cell(nAlt,1);
for i = 1:nAlt
    Alternatif{i} = input(['Nama Alternatif ke-',num2str(i),' : '],'s');
end

%% ===============================
% INPUT NAMA KRITERIA
% ===============================
Kriteria = cell(nKrit,1);
for j = 1:nKrit
    Kriteria{j} = input(['Nama Kriteria ke-',num2str(j),' : '],'s');
end

%% ===============================
% DEFINISI FUZZY SEGITIGA (SESUAI TABEL)
% ===============================

% Bobot Kepentingan Kriteria
SR = [0 0 0.25];     % Sangat Rendah
R  = [0 0.25 0.5];  % Rendah
T  = [0.5 0.75 1];  % Tinggi
ST = [0.75 1 1];    % Sangat Tinggi

% Rating Kecocokan Alternatif
TM = [0 0 0.25];    % Tidak Menarik
M  = [0.5 0.75 1];  % Menarik
SM = [0.75 1 1];    % Sangat Menarik

%% ===============================
% INPUT BOBOT KRITERIA
% ===============================
disp('Input Rating Kepentingan Kriteria (SR / R / T / ST)');
W = zeros(nKrit,3);

for j = 1:nKrit
    label = input(['Bobot ',Kriteria{j},' : '],'s');

    if strcmpi(label,'SR')
        W(j,:) = SR;
    elseif strcmpi(label,'R')
        W(j,:) = R;
    elseif strcmpi(label,'T')
        W(j,:) = T;
    elseif strcmpi(label,'ST')
        W(j,:) = ST;
    else
        error('Input salah! Gunakan SR / R / T / ST');
    end
end

%% ===============================
% INPUT KECOCOKAN ALTERNATIF
% ===============================
disp('Input Rating Kecocokan Alternatif (TM / M / SM)');
S = zeros(nAlt,nKrit,3);

for i = 1:nAlt
    disp(['Alternatif : ',Alternatif{i}])
    for j = 1:nKrit
        label = input(['  Kriteria ',Kriteria{j},' : '],'s');

        if strcmpi(label,'TM')
            S(i,j,:) = TM;
        elseif strcmpi(label,'M')
            S(i,j,:) = M;
        elseif strcmpi(label,'SM')
            S(i,j,:) = SM;
        else
            error('Input salah! Gunakan TM / M / SM');
        end
    end
end

%% ===============================
% AGREGASI FUZZY
% ===============================
F = zeros(nAlt,3);

for i = 1:nAlt
    for j = 1:nKrit
        F(i,:) = F(i,:) + squeeze(S(i,j,:))' .* W(j,:);
    end
    F(i,:) = F(i,:) / nKrit;
end

%% ===============================
% NILAI TOTAL INTEGRAL
% ===============================
alpha = 0.5;
TI = (1/2)*(alpha*F(:,0) + F(:,0,5) + (1-alpha)*F(:,1));

%% ===============================
% OUTPUT
% ===============================
disp(' ');
disp('Agregasi Fuzzy (Y Q Z):');
disp(F)

disp('Nilai Total Integral:');
for i = 1:nAlt
    fprintf('%s : %.4f\n', Alternatif{i}, TI(i));
end

[maxVal, idx] = max(TI);

disp(' ');
disp('Alternatif Terbaik:');
fprintf('%s (nilai = %.4f)\n', Alternatif{idx}, maxVal);
