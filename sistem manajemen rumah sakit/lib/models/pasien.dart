import "user.dart";
import '../utils/utilitas.dart';

class Pasien extends User {
    String idPasien;
    String riwayatPenyakit;

    // Menggunakan "Super" untuk memanggil constructor dari superclass (User)
    Pasien(String nama, int umur, this.idPasien, this.riwayatPenyakit) : super(nama, umur);

    // Polymorphism : method override dari superclass (User)
    @override
  void tampilkanInfo() {
    const IW = 60;
    
    AppUtil.header();
    print("Data Pasien".padLeft(60));
    print("-" * IW);
    print("\nID Pasien\t : $idPasien");
    print("Nama\t\t : $nama");
    print("Umur\t\t : $umur");
    print("Riwayat Penyakit : $riwayatPenyakit\n");
    print("-" * IW);
  }
}