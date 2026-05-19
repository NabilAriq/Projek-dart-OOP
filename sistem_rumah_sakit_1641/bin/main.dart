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
  String _alamat;
  int _umur;

  // constructor
  User(this._nama, this._alamat, this._umur);

  // Getter
  String get nama => _nama;
  String get alamat => _alamat;
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

  set alamat(String value){
    if (value.isNotEmpty){
      _alamat = value;
      print("[Sukses] Alamat berhasil diubah menjadi $_alamat");
    } else {
      print("[Error] Alamat tidak boleh kosong!");
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
    Pasien(String nama, String alamat, int umur, this.idPasien, this.riwayatPenyakit) : super(nama, alamat, umur);

    // Polymorphism : method override dari superclass (User)
    @override
  void tampilkanInfo() {
    print("...");
    sleep(Duration(seconds: 3));
    print("-" * 50);
    print("Data Pasien".padLeft(30));
    print("-" * 50);
    print("ID Pasien\t : $idPasien");
    print("Nama\t\t : $nama");
    print("Umur\t\t : $umur");
    print("Alamat\t\t : $alamat");
    print("Riwayat Penyakit : $riwayatPenyakit");
    print("-" * 50);
  }
}

// Sub Class Kedua (Mewarisi superclass(User))
class Dokter extends User {
  String idDokter;
  String spesialis;

  Dokter(String nama, String alamat, int umur, this.idDokter, this.spesialis) : super(nama, alamat, umur);

    // Polymorphism :  method override dari superclass (User), menghasilkan detail info yang berbeda dari superclass (User)
    @override
  void tampilkanInfo() {
    print("...");
    sleep(Duration(seconds: 3));
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
    print("...");
    sleep(Duration(seconds: 3));
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
    print("...");
    sleep(Duration(seconds: 3));
    print("-" * 50);
    print("Invoice".padLeft(28));
    print("-" * 50);
    print("ID Pasien\t : ${pasien.idPasien}");
    print("Pasien\t\t : ${pasien.nama}");
    print("Alamat\t\t : ${pasien.alamat}");
    print("Biaya\t\t : Rp$biaya");
    print("-" * 50);
  }
}

// ==========================
//  MAIN FUNCTION
// ==========================
void main(List<String> args) {
  print("\n${"="*10} Sistem Manajemen Rumah Sakit ${"="*10}\n");
  
  // Instansiasi object Subclass
  Pasien pasien1 = Pasien("Budi", "Tahunan, Jepara", 25, "VIP01", "Diabetes");
  Dokter dokter1 = Dokter("Dr. Harry", "Batealit, Jepara",  40, "DR015", "Jantung");
  Jadwal jadwal1 = Jadwal("20-10-2026", pasien1, dokter1);
  Transaksi transaksi1 = Transaksi(1000000, pasien1);
  

  // Mendemokan object subclass
  pasien1.tampilkanInfo();
  dokter1.tampilkanInfo();

  jadwal1.tampilkanJadwal();
  transaksi1.tampilkanTransaksi();

  print("-- Uji Coba Setter ---");

  // Mendemokan Encapsulation (Validasi Setter)
  // Tes 1 Update inputan salah
  pasien1.nama = "";
  pasien1.umur = -1;

  // Tes 2 Update inputan benar
  pasien1.umur = 19;

  print("Sedang memproses update data...");
  sleep(Duration(seconds: 3));
  print("Umur terbaru ${pasien1.nama} dari sistem getter adalah ${pasien1.umur} tahun.");
}
