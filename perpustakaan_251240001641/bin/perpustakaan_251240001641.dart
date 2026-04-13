import 'dart:io';

class Buku {
  String judul = '';
  String penulis =  '';
  String isbn = '';
  int tahunTerbit = 0;
  bool tersedia = true;

  void tampilkanInfo() {
    print("="*50);
    print("judul        : $judul");
    print("penulis      : $penulis");
    print("isbn         : $isbn");
    print("tahun terbit : $tahunTerbit");
    print("tersedia     : $tersedia");
    print("="*50);
  }

  void pinjam() {
    if (tersedia){
      tersedia = false;
      print("Buku $judul berhasil dipinjam");
      print("...");
      sleep(Duration(seconds: 3));
    } else {
      print("[!] Buku $judul sudah dipinjam");
      print("...");
      sleep(Duration(seconds: 3));
    }
  }

  void kembalikan(){
    if (tersedia == false){
      tersedia = true;
      print("Buku $judul berhasil dikembalikan, Terima kasih");
      print("...");
      sleep(Duration(seconds: 3));
    } else {
      print("Buku $judul masih dipinjam");
      print("...");
      sleep(Duration(seconds: 3));
    }
  }
}

void main(List<String> args) {
  Buku buku1 = Buku();
  buku1.judul = "Harry Potter And The Prisoner of Azkaban";
  buku1.penulis = "J. K. Rowling";
  buku1.isbn = "978-602-03-4273-3";
  buku1.tahunTerbit = 1997;
  buku1.tersedia = true;

  Buku buku2 = Buku();
  buku2.judul = "Fur immer Dein, Ian";
  buku2.penulis = "Valerie";
  buku2.isbn = "978-979-78-0992-8";
  buku2.tahunTerbit = 2022;
  buku2.tersedia = true;

  Buku buku3 = Buku();
  buku3.judul = "A Study in Scarlet";
  buku3.penulis = "Sir Arthur Conan Doyle";
  buku3.isbn = "978-602-06-316-53";
  buku3.tahunTerbit = 1887;
  buku3.tersedia = false;

  buku1.tampilkanInfo();
  buku2.tampilkanInfo();
  buku3.tampilkanInfo();

  buku1.pinjam();
  buku1.pinjam();
  buku2.pinjam();
  buku3.pinjam();

  buku1.kembalikan();
  buku3.kembalikan();
}