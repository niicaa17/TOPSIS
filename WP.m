clc;
clear;

disp('-------------------------------------------')
disp('STUDI KASUS PEMILIHAN LOKASI PEMANCAR')
disp('PENYELESAIAN DENGAN FMADM METODE WP')
disp(' ')
disp('Disusun oleh :')
disp('1. Nanda Chairunnisa (23112003)')
disp('2. Suci Syafitri     (231212009)')
disp('-------------------------------------------')

% Menetapkan Atribut
disp(' ')
disp(' ')
disp('Atribut Pemilihan Lokasi Pemancar')
disp('-------------------------------------------')
disp('Ketinggian Lokasi (C1)')
disp('Kepadatan Bangunan (C2)')
disp('Dekat_Pusat_Kota (C3)')
disp('Lokasi_aman (C4)')
disp('Dekat_Pemancar_Lain (C5)')

% Alternatif
disp(' ')
disp('-------------------------------------------')
disp('Alternatif Lokasi')
disp('-------------------------------------------')
disp('Bagan Pete (A1)')
disp('Kota Baru (A2)')
disp('Mendalo (A3)')

% Inisialisasi matriks Xij
X = [ ...
    0.25 1.0  0.1 0.9 0.5;
    1.00 0.5  0.9 0.9 0.9;
    0.75 0.25 0.9 0.5 0.1];
Matriks_Xij = X;

% Inisialisasi matriks cost benefit
cost_benefit = [1 0 0 1 0];
disp('Matriks Cost-Benefit Atribut')
disp(cost_benefit)

% Inisialisasi matriks bobot Wij
W = [1.00 0.75 0.50 0.25 0.75];
disp('Inisialisasi Matriks Bobot')
disp(W)

[m n] = size(X);

% Melakukan penskalaan bobot
W = W ./ sum(W);

% Mencari Nilai S
for j = 1:n
    if cost_benefit(j) == 0
        W(j) = (-1) * W(j);
    end
end

for i = 1:m
    S(i) = prod(X(i,:) .^ W);
end

% Menentukan nilai Preferensi untuk perankingan
V = S / sum(S);

% Mencari nilai Preferensi (V)
disp(' ')
disp('Nilai Preferensi (V) Setiap Alternatif')
disp(V)
disp('Nilai V Terbesar')
disp(max(V))

% Menampilkan Alternatif Terpilih
terpilih = 0;
for i = 1:m
    if V(i) > terpilih
        terpilih = V(i);
        kolom = i;
    end
end

disp(['Alternatif terpilih A' num2str(kolom)])
