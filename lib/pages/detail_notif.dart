import 'package:flutter/material.dart';
import 'package:pmb_app/themes/themes.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailNotif extends StatelessWidget {
  const DetailNotif({super.key});

  // Fungsi untuk membuka URL
  void _launchURL() async {
    const url = 'https://student.uigm.ac.id/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Detail Notifikasi'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: Icon(
                    Icons.chat,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 12), // Perlebar jarak antara avatar dan teks
                Expanded(
                  child: Text(
                    'Daftar Ulangmu sudah diverifikasi',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pendaftaran Ulang kamu sudah di verifikasi, silahkan lanjutkan proses pendaftaran dengan melakukan pembayaran ke rekening yang ditentukan. Pastikan data kamu sudah benar.',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 20),
            // BoxDecoration for "Program Sarjana (S1)"
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(5), // Add padding inside the box
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Program Sarjana (S1)',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Fakultas Ilmu Komputer dan Sains',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Teknik Informatika',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 8),
            // BoxDecoration for "NIM" and "Password" section
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'NIM',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    Text(
                      '2021110088',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Password',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    Text(
                      '2021110088',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Nama Mahasiswa',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    Text(
                      'Siti Ayu Hermaliah',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Kelas Karyawan',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    Text(
                      'Senin-Jumat 18:30-21:00',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Divider(
              color: Colors.grey,
              thickness: 0,
            ),
            Row(
              children: [
                Text(
                  'Masuk ke website ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: _launchURL,
                  child: Text(
                    'https://student.uigm.ac.id/',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Gunakan NIM dan Password yang tertera di atas untuk mengecek informasi lebih lanjut dan mengisi KRS',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
