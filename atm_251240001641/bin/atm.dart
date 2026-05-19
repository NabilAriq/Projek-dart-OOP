class ATM {
  String _nomorRekening;
  String _pin;
  double _saldo;

  ATM(this._nomorRekening, this._pin, this._saldo);

  // read-only
  double get saldo => _saldo;
  String get nomorRekening => _nomorRekening;

   set pin(String value){
    if (value.length < 1 || value.length > 6){
      print("Error : Pin harus tepat 6 digit Angka!");
    } else {
      _pin = value;
    }
   }

   bool verifikasiPin(String inputPin){
    if (inputPin != _pin){
      print("Error : Pin salah!");
    }
    return true;
   }

   void setor(double jumlah){
    
   }
}