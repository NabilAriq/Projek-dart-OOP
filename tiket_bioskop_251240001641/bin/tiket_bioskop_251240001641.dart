import "dart:io";

class Film{
  String judul;
  String sutradara;
  int durasiMenit;
  String genre;
  
  Film(this.judul, this.sutradara, this.durasiMenit, this.genre);

  Film.dokumenter(String judul, int durasiMenit):
    this.judul = judul,
    this.durasiMenit = durasiMenit,
    genre = "Dokumenter",
    sutradara = "unkown";

  void tampilkanInfo(){
    print("\n================= Informasi Film =================\n");
    print("Judul\t\t : $judul");
    print("Sutradara\t : $sutradara");
    print("Durasi Film\t : $durasiMenit menit");
    print("Genre\t\t : $genre\n");
  }
}

class Tiket{
  String namaFilm;
  String kursi;
  String kelas;
  final double harga;

  Tiket(this.namaFilm, this.kursi, this.kelas, this.harga);

  Tiket.vip(String namaFilm, String kursi):
    this.namaFilm = namaFilm,
    this.kursi = kursi,
    kelas = "VIP",
    harga = 150000;

  Tiket.reguler(String namaFilm, String kursi):
    this.namaFilm = namaFilm,
    this.kursi = kursi,
    kelas = "Reguler",
    harga = 50000;

  void cetakTiket(){
    print("Sedang mencetak tiket...");
    sleep(Duration(seconds: 3));
    print("-"*61);
    print("\n${" "*24} BILL CINEMA ${" "*24}\n");
    print("-"*61);
    print("\n  Nama Film\t : $namaFilm");
    print("  Kursi\t\t : $kursi");
    print("  Kelas\t\t : $kelas");
    print("  Harga\t\t : Rp $harga\n");
    print("-"*61);
    print("${" "*16}----- SELAMAT MENONTON -----${" "*16}");
    print("-"*61);
  }
}

void main(List<String> args) {
  Film harryPotter = Film("Harry Potter and the Sorcerer's Stone", "Chris Colombus", 152, "Fantasi / Petualangan");
  Film jagal = Film.dokumenter("Jagal", 159);
  Film fantasticBeast = Film("Fantastic Beasts and Where to Find Them", "David Yates", 133, "Fantasi / Petualangan");

  harryPotter.tampilkanInfo();
  jagal.tampilkanInfo();
  fantasticBeast.tampilkanInfo();

  Tiket tiket1 = Tiket.vip("Harry Potter and the Sorcerer's Stone", "A - 5");
  Tiket tiket2 = Tiket.reguler("Harry Potter and the Sorcerer's Stone", "C - 2");
  Tiket tiket3 = Tiket("Jagal", "D - 3", "Reguler", 50000);
  Tiket tiket4 = Tiket.vip("Fantastic Beasts and Where to Find Them", "A - 1");

  tiket1.cetakTiket();
  tiket2.cetakTiket();
  tiket3.cetakTiket();
  tiket4.cetakTiket();

}