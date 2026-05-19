import 'pasien.dart';
import 'package:sistem_manajemen_rumah_sakit/utils/time.dart';  
import 'package:sistem_manajemen_rumah_sakit/utils/utilitas.dart';

const _r      = '\x1B[0m';
const _bold   = '\x1B[1m';
const _abu    = '\x1B[90m';

class Transaksi {
  int _biaya;
  Pasien pasien;

  Transaksi(this._biaya, this.pasien);

  int get biaya => _biaya;
  
  set biaya(int value){
    if (value < 0){
      print("[✗ Error] Biaya tidak boleh negatif!");
    } else {
      _biaya = value;
      print("[✓ Sukses] Biaya berhasil diubah menjadi Rp$biaya");
    }
  }

    static String _rupiah(int n) {
    final s = n.toString();
    final buf = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
      buf.write(s[i]);
    }
    return 'Rp ${buf.toString()}';
  }

  void tampilkanTransaksi(){
    const IW = 60;
    
    AppUtil.header();
    print("\nNo. Invoice\t : $noInv");
    print("Tanggal\t\t : $tgl");
    print("Pukul\t\t : $jam");
    print("Pasien\t\t : ${pasien.nama}");
    print("Biaya\t\t : ${_rupiah(biaya)}\n");
    print("-" * IW);
  }
}