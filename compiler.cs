using System;
using System.Diagnostics;
using System.IO;

class Program
{
    static void Main(string[] args)
    {
        // 1. Memeriksa apakah ada file yang di-drag & drop
        if (args.Length == 0)
        {
            Console.WriteLine("Silakan drag & drop file .cs ke EXE ini.");
            Console.ReadKey();
            return;
        }

        string inputCs = args[0]; // Mengambil path file .cs yang di-drop
        string outputExe = Path.ChangeExtension(inputCs, ".exe");

        // 2. Mencari lokasi compiler csc.exe bawaan Windows
        string csc = @"C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe";
        if (!File.Exists(csc)) 
            csc = @"C:\Windows\Microsoft.NET\Framework\v4.0.30319\csc.exe";

        // 3. Menghindari penggunaan "$" (C# 6+) dengan penggabungan string manual (C# 5)
        string arguments = "/target:exe /out:\"" + outputExe + "\" \"" + inputCs + "\"";

        // 4. Menjalankan proses kompilasi
        ProcessStartInfo psi = new ProcessStartInfo(csc, arguments)
        {
            UseShellExecute = false,
            CreateNoWindow = false
        };

        try
        {
            using (Process p = Process.Start(psi))
            {
                p.WaitForExit();
                if (p.ExitCode == 0) 
                    Console.WriteLine("\n[SUKSES] Kompilasi berhasil!");
                else 
                    Console.WriteLine("\n[GAGAL] Kompilasi gagal!");
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine("Error: " + ex.Message);
        }

        Console.WriteLine("\nTekan tombol apa saja untuk keluar...");
        Console.ReadKey();
    }
}