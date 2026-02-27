function y=kluster()
% Input Data
Jml_balita=input('Masukan Jumlah Balita : ');
Pendapatan=input('Masukan Pendapatan : ');
Ks=input('Masukan Konsumsi Susu : ');

%Inisialisasi matriks data
data=[Jml_balita Pendapatan Ks];

%Panggil data
x=load('clususu.dat');

%Clustering dengan FCM
[centerKs,U,ObjFcn]=fcm(x,3);

%Baca data center (pusat cluster)
center1=centerKs(1,:);
center2=centerKs(2,:);
center3=centerKs(3,:);

%Hitung jarak data dengan masing-masing pusat cluster
jarakA=norm(data-center1)
jarakB=norm(data-center2)
jarakC=norm(data-center3)

%Menenrukan kelompok cluster setiap data
%Hasil cluster ditentukan dari jarak yang paling dekat
%atau selisih jarak paling pendek
if jarakA < jarakB & jarakA < jarakC
    Hasil='Konsumsi susu cluster 1'
else if jarakB < jarakC & jarakB < jarakA
    Hasil='Konsumsi susu cluster 2'
else 
    Hasil='Konsumsi susu cluster 3'
end
end