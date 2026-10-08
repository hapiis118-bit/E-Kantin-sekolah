@echo off
echo ===================================================
echo SETUP REACT 19 + INERTIA.JS UNTUK ECOBITES CANTEEN
echo ===================================================

echo [1/3] Menginstal dependensi PHP (Inertia Laravel)...
call composer require inertiajs/inertia-laravel

echo [2/3] Menerbitkan middleware Inertia...
call php artisan inertia:middleware

echo [3/3] Menginstal dependensi Node.js (React, Vite, dll)...
call npm install react react-dom @inertiajs/react @vitejs/plugin-react
call npm install

echo ===================================================
echo SETUP SELESAI!
echo ===================================================
echo Silakan tambahkan 'HandleInertiaRequests::class' ke dalam bootstrap/app.php
echo Lalu jalankan:
echo 1. npm run dev
echo 2. php artisan serve
pause
