clc;
clear;

disp('===========================================')
disp('STUDI KASUS PEMILIHAN LOKASI PEMANCAR')
disp('FMADM - METODE SAW (BERBASIS FUZZY)')
disp(' ')
disp('Disusun oleh :')
disp('1. Nanda Chairunnisa (23112003)')
disp('2. Suci Syafitri     (231212009)')
disp('===========================================')

%% Alternatif
alternatif = {'A1','A2','A3'};
disp(' ')
disp('Alternatif :')
disp(alternatif')

%% Matriks Keputusan (hasil defuzzifikasi Excel)
% C1 = Ketinggian Lokasi
% C2 = Kepadatan Bangunan
% C3 = Dekat Pusat Kota
% C4 = Kondisi Keamanan
% C5 = Dekat Pemancar Lain

X = [ ...
    0.25 1.0 0.10 0.9 0.5;   % A1
    1.00 0.5 0.9 0.9 0.9;   % A2
    0.75 0.25 0.9 0.5 0.1];  % A3

disp(' ')
disp('Matriks Keputusan X (Defuzzifikasi)')
disp(X)

%% Cost / Benefit
% 1 = Benefit, 0 = Cost
cost_benefit = [1 0 0 1 0];

disp(' ')
disp('Cost / Benefit')
disp(cost_benefit)

%% Bobot Kriteria (sesuai Excel)
W = [1 0.75 0.5 0.25 0.75];

disp(' ')
disp('Bobot Kriteria (W)')
disp(W)

%% Normalisasi SAW
[m,n] = size(X);
R = zeros(m,n);

for j = 1:n
    if cost_benefit(j) == 1
        R(:,j) = X(:,j) ./ max(X(:,j));
    else
        R(:,j) = min(X(:,j)) ./ X(:,j);
    end
end

disp(' ')
disp('Matriks Normalisasi R')
disp(R)

%% Perhitungan Nilai Preferensi
V = zeros(m,1);
for i = 1:m
    V(i) = sum(W .* R(i,:));
end

disp(' ')
disp('Nilai Preferensi (V)')
for i = 1:m
    fprintf('%s = %.4f\n', alternatif{i}, V(i))
end

%% Menentukan Alternatif Terbaik
[Vmax, idx] = max(V);

disp(' ')
disp('===========================================')
disp(['Nilai Preferensi Terbesar = ' num2str(Vmax)])
disp(['Alternatif Terpilih = ' alternatif{idx}])
disp('===========================================')
