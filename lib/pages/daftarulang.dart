import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // untuk Clipboard
//import 'package:pmb_app/pages/daftar_now_page.dart';
import 'package:pmb_app/themes/themes.dart';

class DaftarUlangPage extends StatelessWidget {
  const DaftarUlangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: abuColor,
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Detail Riwayat"),
        centerTitle: true, // Menempatkan judul di tengah
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 2,
            ),
            Text(
              "SELAMAT ANDA LOLOS!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "Sebagai Mahasiswa Baru Program studi Teknik Informatika\nUniversitas Indo Global Mandiri",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Image.asset(
              'assets/congrats1.png',
              height: 170,
              width: 170,
            ),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Prosedur Pendaftaran Mahasiswa Baru : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '1. Upload Berkas untuk verifikasi yaitu:',
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              '  Scan ijazah SMA/SMK/Sederajat, Scan Transkip Nilai Raport/Nilai Ijazah',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: '  Scan KTP dan KK, PasFoto Warna (3 x 4),',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: '  Scan Bukti Bayar Biaya Pendaftaran.',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '2. Melakukan Pembayaran Form Registrasi\ndengan Ketentuan berikut :',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        '- Rp 400.000 ',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '(Sarjana Mahasiswa Baru)',
                        style: TextStyle(fontSize: 13, color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '- Rp 500.000 ',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '(PascaSarjana)',
                        style: TextStyle(fontSize: 13, color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Text(
                      'Bank BCA a.n YAYASAN INDO GLOBAL MANDIRI\n'
                      'Nomor Rekening 0210696393',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(
                        ClipboardData(text: "0210696393"),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Nomor rekening disalin!')),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.copy, color: Colors.blue),
                        SizedBox(
                          width: 5,
                          height: 10,
                        ),
                        Text(
                          'Salin',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Implementasi navigasi ke halaman berikutnya
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor, // Warna background tombol
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                'Mulai Daftar Ulang',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
