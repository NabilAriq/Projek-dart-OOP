import 'dart:io';

void main(List<String> args) {
  Map<String, int> menu = {
    'nasi goreng' : 15000,
    'nasi padang' : 13000,
    'bakso' : 12000, 
  };

  print("-"*50);
  print("Kasir".padLeft(28));
  print("-"*50);
  print("Daftar Menu ");
  print("Nasi Goreng\t: 15000");
  print("Nasi Padang\t: 13000");
  print("Bakso\t\t: 12000\n");

  stdout.write("Masukkan Menu yang ingin dipesan : ");
  String? inputMenu = (stdin.readLineSync() ?? "").toLowerCase();
  stdout.write("Masukkan jumlah porsi yang ingin dipesan : ");
  String? inputPorsi = stdin.readLineSync();

  int jumlahPorsi = int.parse(inputPorsi ?? '0');

  var hargaMenu = menu[inputMenu] ?? 0;
  int harga = hargaMenu * jumlahPorsi;

  var ppn = harga * 0.11;
  var totalHarga = harga + ppn.toInt(); 

  if (totalHarga >= 100000) {
    totalHarga - 10000;
  }

  String barisKiri = "${inputMenu.toUpperCase()} x $inputPorsi";
  String barisKanan = "Rp $totalHarga";

  print("\n" + "-" * 50);
  print("STRUK PEMBAYARAN".padLeft(33));
  print("-" * 50);

  print("\n${barisKiri.padRight(28)}${barisKanan.padLeft(22)}\n\n\n");
  print("-"*18 + " Terima Kasih " + "-"*18);
}