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