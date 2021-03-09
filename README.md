# ReproIFF-E-scan
Code(s) by Tora Lutnaes from his/her thesis "Probability of Positive Identification with an IFF E-scan System"

## Summary Fungsi

#### FriisTransmission.m
Menghitung Link budgeting berdasarkan Friss Equation, untuk uplink dan downlink. Terdapat dua perhitungan untuk uplink/downlink yaitu: link Main dan Control.

#### activeArray.m
Memilih konstanta yang bergantung pada antena array mana yang sedang aktif. Alternatif keluaran hanya ada 3 yaitu: 1 (referensi front array), 2 (referensi side array), dan 3 (bukan keduanya).

#### checkMTL.m
Mengecek nilai MTL (Minimum Trigger Level) untuk front beam angle dan side beam angle. Terdapat 3 alternatif keluaran.
- 1 = Nilai beam pada sudut terlalu lemah untuk trigger interogator.
- 2 = Control level lebih besar daripada Main level, sehingga Interogator tidak akan ditrigger.
- 3 = Main level lebih besar daripada Control level, sehingga Interogator akan ditrigger.

#### dBconverter.m
Melakukan konversi dari skala linear ke decibels. Jika masukan adalah Watt, maka keluaran adalah dBW. Jika masukan adalah miliwatt, maka keluaran adalah dBm.

#### generateSide.m
Menghasilkan pola radiasi sisi.* Hal ini dilakukan dengan melakukan flip horizontal terhadap loaded vector.

#### misMatch.m
Menghitung nilai mismatch loss (S11 dalam dB), dengan masukan berupa VSWR.

#### plotDetection.m
Merupakan suatu prosedur untuk melakukan plot deteksi.*

#### plotPatternINT.m
Merupakan suatu prosedur untuk melakukan plot beam Main dan Control dari TRU.

#### plotPatternXPDR.m
Merupakan suatu prosedur untuk melakukan plot beam Main dan Control pada target (transponder).

#### radPat_Control1090.m
Menghasilkan pola radiasi Control downlink. Perlu .mat eksternal

#### radPat_side_Main.m
Menghasilkan pola radiasi sisi (side) untuk Main. Parameter masukan dalam fungsi ini adalah berupa steering angle. Perlu .mat eksternal

#### radpat_Main1090.m
Menghasilkan pola radiasi Main downlink. Perlu .mat eksternal

#### radpat_front_Control.m
Menghasilkan pola radiasi sisi utama (front) untuk Control. Parameter masukan dalam fungsi ini adalah berupa steering angle. Perlu .mat eksternal

#### radpat_front_Main.m
Menghasilkan pola radiasi sisi utama (front) untuk Main. Parameter masukan dalam fungsi ini adalah berupa steering angle. Perlu .mat eksternal

#### radpat_side_Control.m
Menghasilkan pola radiasi sisi (side) untuk Control. Parameter masukan dalam fungsi ini adalah berupa steering angle. Perlu .mat eksternal

#### thermalNoise_INT.m
Menghitung nilai thermal noise dari TRU.

#### thermalNoise_XPDR.m
Menghitung nilai thermal noise pada target.

#### trigSLS.m
Fungsi ini akan menentukan kondisi trigger berdasarkan SLS (side lobe suppression). Terdapat 4 kemungkinan keluaran:
- 1 : Nilai Beam pada sudut terlalu lemah untuk mentrigger transponder.
- 2 : SLS dipastikan sedang beraksi, transponder tidak akan ditrigger.
- 3 : SLS berada pada area yang tidak jelas, transponder mungkin akan ditrigger
- 4 : Punch through, transponder akan ditrigger.

#### twoRayProp.m
Menghitung Link budget dengan persamaan propagasi Two-Ray untuk uplink dan downlink. Terdapat dua perhitungan untuk uplink/downlink yaitu: link Main dan Control.



