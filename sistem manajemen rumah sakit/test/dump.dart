import 'pasien.dart';

// ─────────────────────────────────────────────────────────────────────────────
// ANSI ESCAPE CODE untuk warna teks di terminal.
// Format umum: '\x1B[<kode>m'
//   \x1B  = karakter escape (ASCII 27), penanda awal perintah warna
//   [0m   = reset (kembalikan ke default)
//   [1m   = bold (tebal)
//   [9Xm  = warna terang (bright): 91=merah, 92=hijau, 93=kuning, 94=biru, 96=cyan, 97=putih
//   [90m  = abu-abu (dark/dim)
// Kode-kode ini hanya mengubah warna, TIDAK menambah karakter yang terlihat.
// ─────────────────────────────────────────────────────────────────────────────
const _r      = '\x1B[0m';    // Reset: kembalikan semua warna ke default
const _bold   = '\x1B[1m';   // Teks tebal
const _cyan   = '\x1B[96m';  // Warna cyan terang (untuk border ║ ╔ ╗ dll.)
const _biru   = '\x1B[94m';  // Warna biru terang (untuk judul section)
const _hijau  = '\x1B[92m';  // Warna hijau terang (untuk status lunas & total)
const _kuning = '\x1B[93m';  // Warna kuning terang (untuk judul INVOICE)
const _putih  = '\x1B[97m';  // Warna putih terang (untuk isi teks)
const _abu    = '\x1B[90m';  // Warna abu-abu (untuk info sekunder & garis tabel)
const _merah  = '\x1B[91m';  // Warna merah terang (untuk pesan error)

class Transaksi {
  int _biaya;       // Private field (enkapsulasi): diawali _ agar tidak bisa diakses langsung dari luar
  Pasien pasien;    // Komposisi: Transaksi "memiliki" objek Pasien (relasi HAS-A)

  // Constructor: inisialisasi _biaya dan pasien saat objek dibuat
  Transaksi(this._biaya, this.pasien);

  // GETTER: cara aman untuk membaca nilai _biaya dari luar class
  int get biaya => _biaya;

  // SETTER: cara aman untuk mengubah nilai _biaya dengan validasi
  set biaya(int value) {
    if (value < 0) {
      // Validasi: biaya tidak boleh negatif
      print('$_merah$_bold[✗ Error]$_r Biaya tidak boleh negatif!');
    } else {
      _biaya = value;
      print('$_hijau$_bold[✓ Sukses]$_r Biaya berhasil diubah menjadi ${_rupiah(biaya)}');
    }
  }

  // ─── Method pembantu (static = bisa dipanggil tanpa buat objek) ────────────
  // Mengubah angka integer menjadi format Rupiah dengan titik ribuan
  // Contoh: 500000 → "Rp 500.000"
  static String _rupiah(int n) {
    final s = n.toString();       // Ubah int ke String dulu
    final buf = StringBuffer();   // StringBuffer lebih efisien dari String biasa untuk penggabungan
    for (int i = 0; i < s.length; i++) {
      // Tambahkan titik setiap 3 digit dari kiri (contoh: 1.000.000)
      if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
      buf.write(s[i]);
    }
    return 'Rp ${buf.toString()}';
  }

  // ─── Method utama: mencetak invoice ke terminal ───────────────────────────
  void tampilkanTransaksi() {
    // IW = Inner Width: lebar konten di dalam border (tidak termasuk karakter ║)
    // Semua baris harus pas IW karakter agar border kanan ║ sejajar
    const IW = 60;

    // ── Local function: baris dengan teks rata kiri ──────────────────────────
    // Dart mendukung "local function" (fungsi di dalam fungsi).
    // Ini berguna agar fungsi helper hanya bisa dipakai di dalam method ini saja.
    //
    // Cara kerja:
    //   1. Tambahkan 1 spasi di kiri teks
    //   2. Hitung sisa ruang (pad) = IW - 1 spasi - panjang teks
    //   3. Isi sisa ruang dengan spasi agar total = IW
    //   4. Bungkus dengan border ║ berwarna cyan
    String ln(String teks, String warna) {
      final pad = IW - 1 - teks.length;
      return '$_cyan║$_r$warna $teks${' ' * (pad < 0 ? 0 : pad)}$_r$_cyan║$_r';
    }

    // ── Local function: baris dengan teks rata tengah ────────────────────────
    // Membagi sisa ruang (setelah dikurangi panjang teks) ke kiri dan kanan
    String lnC(String teks, String warna) {
      final padL = (IW - teks.length) ~/ 2; // ~/ = pembagian bulat (integer division)
      final padR = IW - teks.length - padL;  // sisa spasi untuk kanan
      return '$_cyan║$_r$warna${' ' * padL}$teks${' ' * padR}$_r$_cyan║$_r';
    }

    // ── Karakter box-drawing untuk border invoice ────────────────────────────
    // Karakter ini adalah Unicode khusus untuk membuat kotak di terminal:
    //   ╔═══╗  → sudut & garis atas/bawah double
    //   ╠═══╣  → pembatas tengah (divider)
    //   ╚═══╝  → sudut bawah
    //   ║      → garis sisi kiri/kanan
    final top    = '$_cyan╔${'═' * IW}╗$_r';   // Baris paling atas
    final bot    = '$_cyan╚${'═' * IW}╝$_r';   // Baris paling bawah
    final div    = '$_cyan╠${'═' * IW}╣$_r';   // Garis pemisah section
    final kosong = '$_cyan║${' ' * IW}║$_r';   // Baris kosong (padding vertikal)

    // ── Format tanggal dan waktu otomatis dari DateTime.now() ────────────────
    final now   = DateTime.now(); // Ambil waktu saat ini dari sistem
    final bulan = ['','Januari','Februari','Maret','April','Mei','Juni',
                   'Juli','Agustus','September','Oktober','November','Desember'];
    final hari  = ['Minggu','Senin','Selasa','Rabu','Kamis','Jumat','Sabtu'];

    // now.weekday: 1=Senin ... 7=Minggu → kita mod 7 agar sesuai index array hari[]
    final tgl   = '${hari[now.weekday % 7]}, ${now.day} ${bulan[now.month]} ${now.year}';

    // padLeft(2,'0') → memastikan jam/menit/detik selalu 2 digit, misal: 8 → "08"
    final jam   = '${now.hour.toString().padLeft(2,'0')}:'
                  '${now.minute.toString().padLeft(2,'0')}:'
                  '${now.second.toString().padLeft(2,'0')} WIB';

    // Nomor invoice dibuat otomatis dari tanggal + bagian millisecond (pseudo-unik)
    final noInv = 'INV-${now.year}${now.month.toString().padLeft(2,'0')}'
                  '${now.day.toString().padLeft(2,'0')}'
                  '-${(now.millisecondsSinceEpoch % 900 + 100)}';

    // ── Tabel rincian biaya di dalam invoice ─────────────────────────────────
    // Layout tabel (di dalam border ║...║):
    //   ║  ┌──────────────────────────────────────┬──────────────┐  ║
    //   ║  │ Keterangan                           │       Biaya  │  ║
    //   ║  ├──────────────────────────────────────┼──────────────┤  ║
    //   ║  │ Biaya Konsultasi & Pelayanan         │  Rp 500.000  │  ║
    //   ║  └──────────────────────────────────────┴──────────────┘  ║
    //
    // cL = lebar kolom kiri, cR = lebar kolom kanan
    const cL = 36;
    const cR = 14;

    // Fungsi untuk membuat satu baris isi tabel dengan padding otomatis
    String tblBaris(String left, String right) {
      final lPad = cL - left.length - 1;  // sisa spasi kolom kiri
      final rPad = cR - right.length - 1; // sisa spasi kolom kanan
      return '  │ $left${' ' * (lPad < 0 ? 0 : lPad)}'
             '│${' ' * (rPad < 0 ? 0 : rPad)}$right │  ';
    }

    // Baris garis horizontal tabel menggunakan karakter box-drawing:
    //   ┌ ┬ ┐  → baris atas
    //   ├ ┼ ┤  → baris tengah (pemisah header & data)
    //   └ ┴ ┘  → baris bawah
    final tblTop = '  ┌${'─' * cL}┬${'─' * cR}┐  ';
    final tblDiv = '  ├${'─' * cL}┼${'─' * cR}┤  ';
    final tblBot = '  └${'─' * cL}┴${'─' * cR}┘  ';

    final hdrBaris = tblBaris('Keterangan', 'Biaya');
    final dtaBaris = tblBaris('Biaya Konsultasi & Pelayanan', _rupiah(biaya));

    // ── Cetak semua baris invoice secara berurutan ───────────────────────────
    print('');
    print(top);
    print(kosong);
    print(lnC('RUMAH SAKIT MEDIKA SEJAHTERA', '$_bold$_putih'));
    print(lnC('Jl. Kesehatan No. 1  |  Telp: (021) 555-0199', _abu));
    print(kosong);
    print(div);
    print(kosong);
    print(lnC('[ I N V O I C E ]', '$_bold$_kuning'));
    print(kosong);
    print(div);
    print(ln('No. Invoice  : $noInv', _putih));
    print(ln('Tanggal      : $tgl', _putih));
    print(ln('Pukul        : $jam', _putih));
    print(div);
    print(ln('INFORMASI PASIEN', '$_bold$_biru'));
    print(ln('Nama Pasien  : ${pasien.nama}', _putih));
    print(div);
    print(ln('RINCIAN BIAYA', '$_bold$_biru'));
    print(kosong);
    // Tabel dicetak langsung tanpa fungsi ln() karena sudah mengandung padding sendiri
    print('$_cyan║$_r$_abu$tblTop$_r$_cyan║$_r');
    print('$_cyan║$_r$_bold$_putih$hdrBaris$_r$_cyan║$_r');
    print('$_cyan║$_r$_abu$tblDiv$_r$_cyan║$_r');
    print('$_cyan║$_r$_putih$dtaBaris$_r$_cyan║$_r');
    print('$_cyan║$_r$_abu$tblBot$_r$_cyan║$_r');
    print(kosong);
    print(ln('TOTAL PEMBAYARAN  :  ${_rupiah(biaya)}', '$_bold$_hijau'));
    print(kosong);
    print(div);
    print(ln('[✓] PEMBAYARAN LUNAS', '$_bold$_hijau'));
    print(ln('    Terima kasih telah mempercayai layanan kami!', _abu));
    print(bot);
    print('');
  }
}