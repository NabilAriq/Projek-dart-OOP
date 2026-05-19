import 'user.dart';
import '../utils/utilitas.dart';

class Dokter extends User {
  String idDokter;
  String spesialis;

  Dokter(String nama, int umur, this.idDokter, this.spesialis) : super(nama, umur);

    @override
  void tampilkanInfo() {
    const IW = 60;
    
    AppUtil.header();
    print("Data Dokter".padLeft(30));
    print("-" * IW);
    print("ID Pasien\t : $idDokter");
    print("Nama\t\t : $nama");
    print("Umur\t\t : $umur");
    print("Spesialis\t : $spesialis");
    print("-" * IW);
  }
}