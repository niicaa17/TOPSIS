%Baca dan tampilkan data
data = load('pajak.dat');
disp('Data Jumlah Kendaraan, Jumlah Penumpang, dan Pajak')
disp(data)

%Clustering dengan subclust
[C,S] = subclust(data, 0.5);
centers = C;
sigma = S;

%simpan data center (pusat cluster) dan sigma
disp('Pusat Cluster')
disp(centers)
disp('Sigma')
disp(sigma)

%Tampilkan jumlah cluster
num_clusters = size(centers, 1);
disp(['Jumlah cluster : ', num2str(num_clusters)]);

%Tampilkan jumlah data dan jumlah variabel
[num_data, num_features] = size(data);
disp(['Jumlah data : ', num2str(num_data)]);
disp(['Jumlah variabel : ', num2str(num_features)]);

%Menghitung derajat keanggotaan
membership_degree = zeros(num_data, num_clusters);

for i = 1:num_data
    for k = 1:num_clusters
        sum_term = 0;
        for j = 1:num_features
            sum_term = sum_term + ((data(i,j) - centers(k,j))^2) / (2 * sigma(j)^2);
        end
        membership_degree(i,k) = exp(-sum_term);
    end
end

disp('Derajat Keanggotaan')
disp(membership_degree)

%Cari indeks cluster dengan nilai keanggotaan tertinggi
[idx_max] = max(membership_degree, [], 2);
max_membership = max(membership_degree, [], 2);

%Tentukan hasil berdasarkan indeks cluster dominan
Hasil = cell(num_data, 2);

for i = 1:num_data
    Hasil{i,1} = ['Data ke-', num2str(i)];
    Hasil{i,2} = ['cluster ke-', num2str(idx_max(i)), ...
                  ' (', num2str(max_membership(i)), ')'];
end

%Tampilkan hasil
disp('Derajat Keanggotaan Terbesar Setiap Data :')
for i = 1:num_data
    disp([Hasil{i,1}, ' : ', Hasil{i,2}])
end
