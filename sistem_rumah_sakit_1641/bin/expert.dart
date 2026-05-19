// NIM      : 251240001641
// NAMA     : MUHAMMAD NABIL 'ARIQ
// TEMA     : SISTEM MANAJEMEN RUMAH SAKIT

import 'dart:io';

// ==========================
//  CLASS & ENCAPSULATION
// ==========================
// Super Class
class User {
  // Private Field / Atribute ditandai dengan underscore (_...)
  String _nama;
  int _umur;

  // constructor
  User(this._nama, this._umur);

  // Getter
  String get nama => _nama;
  int get umur => _umur;

  // Setter dengan validasi inputan
  set nama(String value){
    if (value.isNotEmpty){
      _nama = value;
      print("[Sukses] Nama berhasil diubah menjadi $_nama");
    } else {
      print("[Error] Nama tidak boleh kosong!");
    }
  }

  set umur(int value){
    if (value < 0){
      print("[Error] Umur tidak boleh negatif!");
    } else {
      _umur = value;
      print("[Sukses] Umur berhasil diubah menjadi $_umur");
    }
  }

  // Method utama (untuk di-override / polymorphism)
  void tampilkanInfo(){
    print("-" * 50);
    print("Nama : $_nama");
    print("Umur : $_umur");
    print("-" * 50);
  }
}

// ================================================
//  INHERITANCE (PEWARISAN) & POLYMORPHISM
// ================================================
// Sub Class Pertama (Mewarisi superclass(User))
class Pasien extends User {
    String idPasien;
    String riwayatPenyakit;

    // Menggunakan "Super" untuk memanggil constructor dari superclass (User)
    Pasien(String nama, int umur, this.idPasien, this.riwayatPenyakit) : super(nama, umur);

    // Polymorphism : method override dari superclass (User)
    @override
  void tampilkanInfo() {
    print(Process.runSync("cls", [], runInShell: true).stdout);
    print("-" * 50);
    print("Data Pasien".padLeft(30));
    print("-" * 50);
    print("ID Pasien\t : $idPasien");
    print("Nama\t\t : $nama");
    print("Umur\t\t : $umur");
    print("Riwayat Penyakit : $riwayatPenyakit");
    print("-" * 50);
  }
}

// Sub Class Kedua (Mewarisi superclass(User))
class Dokter extends User {
  String idDokter;
  String spesialis;

  Dokter(String nama, int umur, this.idDokter, this.spesialis) : super(nama, umur);

    // Polymorphism :  method override dari superclass (User), menghasilkan detail info yang berbeda dari superclass (User)
    @override
  void tampilkanInfo() {
    print(Process.runSync("cls", [], runInShell: true).stdout);
    print("-" * 50);
    print("Data Dokter".padLeft(30));
    print("-" * 50);
    print("ID Pasien\t : $idDokter");
    print("Nama\t\t : $nama");
    print("Umur\t\t : $umur");
    print("Spesialis\t : $spesialis");
    print("-" * 50);
  }
}

// ======================================
//  ASSOCIATION (HUBUNGAN ANTAR CLASS)
// ======================================
// Association pertama class jadwal menggunakan field dari sub class pasien dan dokter.
class Jadwal {
  String tanggal;
  // Menggunakan class pasien & dokter
  Pasien pasien;
  Dokter dokter;

  Jadwal(this.tanggal, this.pasien, this.dokter);

  void tampilkanJadwal() {
    print(Process.runSync("cls", [], runInShell: true).stdout);
    print("-" * 50);
    print("Jadwal".padLeft(27));
    print("-" * 50);
    print("Tanggal\t : $tanggal");
    print("Pasien\t : ${pasien.nama}");
    print("Dokter\t : ${dokter.nama}");
    print("-" * 50);
  }
}

// Association kedua class transaksi menggunakan field dari sub class pasien.
class Transaksi {
  int _biaya;
  // Menggunakan class pasien
  Pasien pasien;

  Transaksi(this._biaya, this.pasien);

  int get biaya => _biaya;
  
  set biaya(int value){
    if (value < 0){
      print("[Error] Biaya tidak boleh negatif!");
    } else {
      _biaya = value;
      print("[Sukses] Biaya berhasil diubah menjadi Rp$biaya");
    }
  }

  void tampilkanTransaksi(){
    print(Process.runSync("cls", [], runInShell: true).stdout);
    print("-" * 50);
    print("Biaya".padLeft(27));
    print("-" * 50);
    print("Pasien\t : ${pasien.nama}");
    print("Biaya\t : Rp$biaya");
    print("-" * 50);
  }
}

void tambahPasien(List<Pasien> daftarPasien) {
  stdout.write("Masukkan ID Pasien: ");
  String idPasien = stdin.readLineSync()!;
  stdout.write("Masukkan nama pasien: ");
  String? nama = stdin.readLineSync();
  stdout.write("Masukkan umur pasien: ");
  int umur = int.parse(stdin.readLineSync()!);
  stdout.write("Masukkan riwayat penyakit pasien: ");
  String riwayatPenyakit = stdin.readLineSync()!;
  return daftarPasien.add(Pasien(nama!, umur, idPasien, riwayatPenyakit));
}

void tambahDokter(List<Dokter> daftarDokter) {
  stdout.write("Masukkan ID Dokter: ");
  String idDokter = stdin.readLineSync()!;
  stdout.write("Masukkan Nama Dokter: ");
  String? nama = stdin.readLineSync();
  stdout.write("Masukkan Umur Dokter: ");
  int umur = int.parse(stdin.readLineSync()!);
  stdout.write("Masukkan Spesialis Dokter: ");
  String spesialis = stdin.readLineSync()!;
  return daftarDokter.add(Dokter(nama!, umur, idDokter, spesialis));
}

void tambahJadwal(List<Jadwal> daftarJadwal) {
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
  return daftarJadwal.add(Jadwal(tanggal, Pasien(namaPasien, 0, idPasien, ""), Dokter(namaDokter, 0, idDokter, "")));
}

void tambahTransaksi(List<Transaksi> daftarTransaksi) {
  stdout.write("Masukkan Nama Pasien");
  String namaPasien = stdin.readLineSync()!;
  stdout.write("Masukkan Biaya: ");
  int biaya = int.parse(stdin.readLineSync()!);
  return daftarTransaksi.add(Transaksi(biaya, Pasien(namaPasien, 0, "", "")));
}

// ==========================
//  MAIN FUNCTION
// ==========================
void main(List<String> args) {
  List<Pasien> daftarPasien = [];
  List<Dokter> daftarDokter = [];
  List<Jadwal> daftarJadwal = [];
  List<Transaksi> daftarTransaksi = [];

  print("menu : ");
  print("1. Tambah Pasien");
  print("2. Tambah Dokter");
  print("3. Tambah Jadwal");
  print("4. Tambah Transaksi");
  print("5. Tampilkan Data Pasien");
  print("6. Tampilkan Data Dokter");
  print("7. Tampilkan Data Jadwal");
  print("8. Tampilkan Data Transaksi");
  print("9. Keluar");

  while (true) {

  stdout.write("\nMasukkan pilihan menu (1-9): ");

  switch (stdin.readLineSync()) {
    case "1":
      tambahPasien(daftarPasien);
      break;
    case "2":
      tambahDokter(daftarDokter);
      break;
    case "3":
      tambahJadwal(daftarJadwal);
      break;
    case "4":
      tambahTransaksi(daftarTransaksi);
      break;
    case "5":
      stdout.write("\x1B[2J\x1B[H");
      for (Pasien pasien in daftarPasien) {
        pasien.tampilkanInfo();
      }
      break;
    case "6":
      stdout.write("\x1B[2J\x1B[H");
      for (Dokter dokter in daftarDokter) {
        dokter.tampilkanInfo();
      }
      break;
    case "7":
      stdout.write("\x1B[2J\x1B[H");
      for (Jadwal jadwal in daftarJadwal) {
        jadwal.tampilkanJadwal();
      }
      break;
    case "8":
      stdout.write("\x1B[2J\x1B[H");
      for (Transaksi transaksi in daftarTransaksi) {
        transaksi.tampilkanTransaksi();
      }
      break;
    case "9":
      exit(0);
  }
  }
}
