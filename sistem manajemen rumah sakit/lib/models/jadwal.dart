import 'pasien.dart';
import 'dokter.dart';
import '../utils/utilitas.dart';

class Jadwal {
  String tanggal;
  // Menggunakan class pasien & dokter
  Pasien pasien;
  Dokter dokter;

  Jadwal(this.tanggal, this.pasien, this.dokter);

  void tampilkanJadwal() {
    const IW = 60;

    AppUtil.header();
    print("Data Jadwal".padLeft(30));
    print("-" * IW);
    print("\nTanggal\t : $tanggal");
    print("Pasien\t : ${pasien.nama}");
    print("Dokter\t : ${dokter.nama}\n");
    print("-" * IW);
  }
}

