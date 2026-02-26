function y = kluster(data_baru)
data = load('clususu.dat');
[C, S] = subclust(data, 0.5);

centers = C;      
sigma   = S;      

num_clusters = size(centers, 1);
[num_data, num_features] = size(data);

disp('-------------------------------------')
disp('PREDIKSI CLUSTER DATA BARU')
disp('-------------------------------------')

jml_balita = input('Masukkan jumlah balita : ');
pendapatan = input('Masukkan pendapatan     : ');
ks         = input('Masukkan konsumsi susu  : ');

data_baru = [jml_balita pendapatan ks];
membership_degree_baru = zeros(1, num_clusters);
for k = 1:num_clusters
    sum_term = 0;
    for j = 1:num_features
        sum_term = sum_term + ((data_baru(j) - centers(k,j))^2) / (2 * sigma(j)^2);
    end
    membership_degree_baru(k) = exp(-sum_term);
end
[max_membership, idx_max_baru] = max(membership_degree_baru);

disp(['Data baru diprediksi masuk ke CLUSTER ', num2str(idx_max_baru)])
disp(['Derajat keanggotaan terbesar = ', num2str(max_membership)])

end