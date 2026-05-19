import 'dart:io';
import '../models/pasien.dart';
import '../models/dokter.dart';
import '../models/jadwal.dart';
import '../models/transaksi.dart';

const _r      = '\x1B[0m';
const _bold   = '\x1B[1m';
const _abu    = '\x1B[90m';

class AppUtil {
  static void bersihkanLayar() {
    stdout.write("\x1B[2J\x1B[H");
  }

  static void header() {
    const IW = 60;

    String lnC(String teks, [String format = '']) {
      final padL = (IW - teks.length) ~/ 2;
      final padR = IW - teks.length - padL;
      return '${' ' * padL}$format$teks$_r${' ' * padR}';
    }

    print("-" * IW);
    print("");
    print(lnC('RUMAH SAKIT MEDIKA SEJAHTERA', _bold));
    print(lnC('Jl. Kesehatan No. 1  |  Telp: (021) 555-0199\n', _abu));
    print("-" * IW);
  }

  static void tungguEnter() {
    stdout.write("\nTekan Enter untuk kembali...");
    stdin.readLineSync();
  }

  static void tambahPasien(List<Pasien> daftarPasien) {
    stdout.write("Masukkan ID Pasien: ");
    String idPasien = stdin.readLineSync()!;
    stdout.write("Masukkan nama pasien: ");
    String? nama = stdin.readLineSync();
    stdout.write("Masukkan umur pasien: ");
    int umur = int.parse(stdin.readLineSync()!);
    stdout.write("Masukkan riwayat penyakit pasien: ");
    String riwayatPenyakit = stdin.readLineSync()!;
    daftarPasien.add(Pasien(nama!, umur, idPasien, riwayatPenyakit));
  }

  static void tambahDokter(List<Dokter> daftarDokter) {
    stdout.write("Masukkan ID Dokter: ");
    String idDokter = stdin.readLineSync()!;
    stdout.write("Masukkan Nama Dokter: ");
    String? nama = stdin.readLineSync();
    stdout.write("Masukkan Umur Dokter: ");
    int umur = int.parse(stdin.readLineSync()!);
    stdout.write("Masukkan Spesialis Dokter: ");
    String spesialis = stdin.readLineSync()!;
    daftarDokter.add(Dokter(nama!, umur, idDokter, spesialis));
  }

  static void tambahJadwal(List<Jadwal> daftarJadwal) {
    stdout.write("Masukkan Tanggal: ");
    String tanggal = stdin.readLineSync()!;
    stdout.write("Masukkan ID Pasien: ");
    String idPasien = stdin.readLineSync()!;
    stdout.write("Masukkan Nama Pasien: ");
    String namaPasien = stdin.readLineSync()!;
    stdout.write("Masukkan ID Dokter: ");
    String idDokter = stdin.readLineSync()!;
    stdout.write("Masukkan Nama Dokter: ");
    String namaDokter = stdin.readLineSync()!;
    daftarJadwal.add(Jadwal(tanggal, Pasien(namaPasien, 0, idPasien, ""), Dokter(namaDokter, 0, idDokter, "")));
  }

  static void tambahTransaksi(List<Transaksi> daftarTransaksi) {
    stdout.write("Masukkan Nama Pasien: ");
    String namaPasien = stdin.readLineSync()!;
    stdout.write("Masukkan Biaya: ");
    int biaya = int.parse(stdin.readLineSync()!);
    daftarTransaksi.add(Transaksi(biaya, Pasien(namaPasien, 0, "", "")));
  }
}