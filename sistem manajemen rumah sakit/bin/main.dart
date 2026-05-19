import 'dart:io';
import 'package:sistem_manajemen_rumah_sakit/models/pasien.dart';
import 'package:sistem_manajemen_rumah_sakit/models/dokter.dart';
import 'package:sistem_manajemen_rumah_sakit/models/jadwal.dart';
import 'package:sistem_manajemen_rumah_sakit/models/transaksi.dart';
import 'package:sistem_manajemen_rumah_sakit/utils/utilitas.dart';
void main() {
  List<Pasien> daftarPasien = [];
  List<Dokter> daftarDokter = [];
  List<Jadwal> daftarJadwal = [];
  List<Transaksi> daftarTransaksi = [];

  AppUtil.bersihkanLayar();
  while (true) {
    // Kami tidak membersihkan layar di sini agar output validasi (Sukses/Error) 
    // dari setter masih bisa terlihat sebelum user memilih menu baru.
    
    print("\n=== MENU SISTEM RUMAH SAKIT ===");
    print("1. Tambah Pasien");
    print("2. Tambah Dokter");
    print("3. Tambah Jadwal");
    print("4. Tambah Transaksi");
    print("5. Tampilkan Data Pasien");
    print("6. Tampilkan Data Dokter");
    print("7. Tampilkan Data Jadwal");
    print("8. Tampilkan Data Transaksi");
    print("9. Keluar");

    stdout.write("\nMasukkan pilihan menu (1-9): ");
    String? pilihan = stdin.readLineSync();

    switch (pilihan) {
      case "1":
        AppUtil.tambahPasien(daftarPasien);
        break;
      case "2":
        AppUtil.tambahDokter(daftarDokter);
        break;
      case "3":
        AppUtil.tambahJadwal(daftarJadwal);
        break;
      case "4":
        AppUtil.tambahTransaksi(daftarTransaksi);
        break;
      case "5":
        AppUtil.bersihkanLayar();
        if (daftarPasien.isEmpty) print("Data kosong!");
        for (Pasien pasien in daftarPasien) {
          pasien.tampilkanInfo();
          AppUtil.tungguEnter();
        }
        break;
      case "6":
        AppUtil.bersihkanLayar();
        if (daftarDokter.isEmpty) print("Data kosong!");
        for (Dokter dokter in daftarDokter) {
          dokter.tampilkanInfo();
          AppUtil.tungguEnter();
        }
        break;
      case "7":
        AppUtil.bersihkanLayar();
        if (daftarJadwal.isEmpty) print("Data kosong!");
        for (Jadwal jadwal in daftarJadwal) {
          jadwal.tampilkanJadwal();
          AppUtil.tungguEnter();
        }
        break;
      case "8":
        AppUtil.bersihkanLayar();
        if (daftarTransaksi.isEmpty) print("Data kosong!");
        for (Transaksi transaksi in daftarTransaksi) {
          transaksi.tampilkanTransaksi();
          AppUtil.tungguEnter();
        }
        break;
      case "9":
        exit(0);
      default:
        print("Pilihan tidak valid!");
    }
  }
}