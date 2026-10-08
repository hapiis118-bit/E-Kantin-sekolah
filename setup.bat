@echo off
echo ====================================================
echo ECOBITES CANTEEN - AUTOMATED SETUP
echo ====================================================
echo.

echo [1/5] Menginstal Laravel Breeze (Halaman Auth)...
call composer require laravel/breeze --dev
call php artisan breeze:install blade --quiet

echo [2/5] Mengembalikan konfigurasi Routes dan Middleware...
copy /Y routes_backup.php routes\web.php
copy /Y app_backup.php bootstrap\app.php

echo [3/5] Menjalankan Migrasi dan Seeder (Membuat Database)...
call php artisan storage:link
call php artisan migrate:fresh --seed

echo [4/5] Membangun aset frontend...
call npm install
call npm run build

echo.
echo ====================================================
echo SETUP SELESAI!
echo ====================================================
echo Akun Admin  : admin@kantin.com / password
echo Akun Siswa  : budi@sekolah.com / password
echo.
echo Silakan jalankan perintah ini di terminal Anda:
echo php artisan serve
echo ====================================================
pause
