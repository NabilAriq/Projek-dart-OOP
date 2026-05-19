DateTime get _now => DateTime.now();

final bulan = ['', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
               'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'];

final hari = ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];

String get now => '${tgl} | ${jam}';

String get tgl => '${hari[_now.weekday % 7]}, ${_now.day} ${bulan[_now.month]} ${_now.year}';

String get jam => '${_now.hour.toString().padLeft(2, '0')}:'
                  '${_now.minute.toString().padLeft(2, '0')}:'
                  '${_now.second.toString().padLeft(2, '0')} WIB';

String get noInv => 'INV-${_now.year}${_now.month.toString().padLeft(2, '0')}'
                    '${_now.day.toString().padLeft(2, '0')}'
                    '-${(_now.millisecondsSinceEpoch % 900 + 100)}';