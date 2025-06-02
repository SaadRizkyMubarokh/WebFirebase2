# Gunakan image Nginx resmi versi ringan
FROM nginx:alpine

# Hapus file HTML default dari Nginx
RUN rm -rf /usr/share/nginx/html/*

# Salin semua file HTML ke direktori Nginx
COPY login.html /usr/share/nginx/html/index.html
COPY produk.html Transaksi.html user-orders.html /usr/share/nginx/html/

# Buka port 8080 (untuk Cloud Run atau container lain)
EXPOSE 8080

# Ubah konfigurasi default Nginx agar menggunakan port 8080
RUN sed -i 's/80;/8080;/g' /etc/nginx/conf.d/default.conf

# Jalankan Nginx
CMD ["nginx", "-g", "daemon off;"]
