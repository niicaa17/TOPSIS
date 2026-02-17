clc;
clear;

disp('-------------------------------------------')
disp('STUDI KASUS PEMILIHAN LOKASI PEMANCAR')
disp('PENYELESAIAN DENGAN FMADM METODE TOPSIS')
disp('-------------------------------------------')

% Menetapkan Atribut
disp(' ')
disp(' ')
disp('Atribut Pemilihan Lokasi Pemancar')
disp('-------------------------------------------')
disp('Ketinggian Lokasi (C1)')
disp('Kepadatan Bangunan (C2)')
disp('Dekat_Pusat_Kota (C3)')
disp('Lokasi_Aman (C4)')
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

% Normalisasi dan pembobotan atribut
R = zeros(m,n);
Y = zeros(m,n);

for j = 1:n
    for i = 1:m
        R(i,j) = X(i,j) / sqrt(sum(X(:,j).^2));
    end
end

for i = 1:m
    for j = 1:n
        Y(i,j) = W(j) * R(i,j);
    end
end

disp('Matriks Normalisasi Terbobot (Y)')
disp(Y)

% Solusi ideal positif dan negatif
for j = 1:n
    if cost_benefit(j) == 1
        Aplus(j)  = max(Y(:,j));
        Aminus(j) = min(Y(:,j));
    else
        Aplus(j)  = min(Y(:,j));
        Aminus(j) = max(Y(:,j));
    end
end

disp('Solusi Ideal Positif')
disp(Aplus)
disp('Solusi Ideal Negatif')
disp(Aminus)

% Menghitung jarak D+ dan D-
for i = 1:m
    Dplus(i)  = sqrt(sum((Y(i,:) - Aplus).^2));
    Dminus(i) = sqrt(sum((Y(i,:) - Aminus).^2));
end

% Menentukan nilai preferensi
V = Dminus ./ (Dplus + Dminus);

disp('Nilai Preferensi (V) Setiap Alternatif')
disp(V)
disp('Nilai V Terbesar')
disp(max(V))

% Menentukan alternatif terpilih
terpilih = 0;
for i = 1:m
    if V(i) > terpilih
        terpilih = V(i);
        kolom = i;
    end
end

disp(['Alternatif terpilih A' num2str(kolom)])
