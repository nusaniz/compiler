# C# to EXE Compiler

Aplikasi utilitas portabel untuk mengonversi kode sumber C# (`.cs`) menjadi file aplikasi (`.exe`) secara cepat menggunakan compiler .NET Framework bawaan Windows.

## Sistem yang Didukung
* Windows 8
* Windows 10
* Windows 11

## Cara Penggunaan

1. **Unduh Program**
   Unduh file `compiler.exe` versi terbaru dari halaman [Releases].

2. **Drag & Drop File**
   Pilih file C# (`.cs`) yang ingin Anda kompilasi, lalu geser (*drag*) dan lepaskan (*drop*) file tersebut tepat di atas ikon `compiler.exe`.

3. **Proses Kompilasi**
   Jendela Command Prompt (CMD) akan terbuka secara otomatis untuk memproses kompilasi kode Anda. Tunggu hingga proses selesai.

4. **Selesai**
   File hasil kompilasi (`.exe`) akan otomatis terbentuk di folder yang sama dengan file C# (`.cs`) asal Anda, menggunakan nama yang sama.

---

## Catatan
* Aplikasi ini memanfaatkan `csc.exe` bawaan dari .NET Framework 4.0/4.5+ yang sudah ada di sistem Windows modern.
* Hanya mendukung sintaksis bahasa C# versi 5 ke bawah.
