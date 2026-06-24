@echo off
title C# Compiler (csc.exe) - Drag and Drop
color 0F

:: 1. Memeriksa apakah ada file yang ditarik (drag & drop) ke file bat ini
if "%~1"=="" goto :usage

:: 2. Memeriksa apakah file yang dimasukkan memiliki ekstensi .cs
if /i not "%~x1"==".cs" goto :invalid_extension

:: 3. Mencari lokasi csc.exe (.NET Framework 4.0/4.5+ adalah standar di Windows 10/11)
set "CSC_PATH="
if exist "%WINDIR%\Microsoft.NET\Framework64\v4.0.30319\csc.exe" (
    set "CSC_PATH=%WINDIR%\Microsoft.NET\Framework64\v4.0.30319\csc.exe"
) else if exist "%WINDIR%\Microsoft.NET\Framework\v4.0.30319\csc.exe" (
    set "CSC_PATH=%WINDIR%\Microsoft.NET\Framework\v4.0.30319\csc.exe"
)

:: Jika versi 4.0 tidak ditemukan, cari versi lain yang tersedia di folder .NET Framework
if "%CSC_PATH%"=="" (
    for /d %%d in ("%WINDIR%\Microsoft.NET\Framework*") do (
        if exist "%%d\csc.exe" set "CSC_PATH=%%d\csc.exe"
    )
)

:: Jika compiler tetap tidak ditemukan
if "%CSC_PATH%"=="" goto :compiler_not_found

:: 4. Proses Kompilasi
echo ===================================================
echo             C# COMPILER PORTABLE (csc.exe)
echo ===================================================
echo Compiler : %CSC_PATH%
echo File     : %~nx1
echo Folder   : %~dp1
echo ===================================================
echo.
echo Sedang mengompilasi...
echo.

:: Menjalankan compiler csc.exe
"%CSC_PATH%" /target:exe /out:"%~dp1%~n1.exe" "%~1"

echo.
if %ERRORLEVEL% equ 0 (
    color 0A
    echo [SUKSES] Kompilasi berhasil!
    echo File output: "%~dp1%~n1.exe"
) else (
    color 0C
    echo [GAGAL] Terjadi kesalahan saat kompilasi. Silakan periksa log error di atas.
)

echo.
echo ===================================================
pause
exit /b


:: Bagian Penanganan Error dan Petunjuk Penggunaan
:usage
echo [ERROR] Silakan drag and drop file .cs Anda ke file bat ini.
echo.
echo Cara penggunaan:
echo 1. Pilih file C# (.cs) Anda.
echo 2. Geser (drag) dan lepaskan (drop) file tersebut di atas file compile.bat ini.
echo.
pause
exit /b

:invalid_extension
echo [ERROR] File yang Anda masukkan bukan file C# (.cs).
echo File yang terdeteksi: %~nx1
echo.
pause
exit /b

:compiler_not_found
echo [ERROR] Compiler .NET Framework (csc.exe) tidak ditemukan di sistem ini.
echo Pastikan fitur .NET Framework sudah terpasang/aktif di Windows Anda.
echo.
pause
exit /b