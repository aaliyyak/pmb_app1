import 'package:flutter/material.dart';
import 'package:pmb_app/pages/daftarulang.dart';
import 'package:pmb_app/themes/themes.dart';

class DetailRiwayat extends StatelessWidget {
  const DetailRiwayat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Detail Riwayat"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ), // Adjust the spacing from the app bar to the image
            Center(
              child: Column(
                children: [
                  Container(
                    width: 75, // Set the width of the image
                    height: 75, // Set the height of the image
                    decoration: BoxDecoration(
                      color: Colors.green, // Warna latar belakang lingkaran
                      shape: BoxShape.circle, // Membuat bentuk lingkaran
                    ),
                    child: Icon(
                      Icons.check, // Ikon ceklis
                      color: Colors.white, // Warna ikon
                      size: 40, // Ukuran ikon
                    ),
                  ),
                  SizedBox(height: 5), // Gap between the image and the text
                  Text(
                    "Selamat! Kamu Diterima",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 25), // Gap between the text and the box
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Detail Pendaftaran",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Pogram Sarjana(S1)",
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              "No. Pendaftaran",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Fakultas Ilmu Komputer",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "123456",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Teknik Informatika",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Waktu Pendaftaran",
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "10 September 2023  18:25",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nama Calon Mahasiswa",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Siti Ayu Hermaliah",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "ayucuantek1@gmail.com",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "No. Handphone",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "081325456809",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 110,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DaftarUlangPage()),
                      );
                      // Implementasi logika ketika tombol ditekan
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor, // Warna background tombol
                      padding: EdgeInsets.symmetric(
                          horizontal: 130, vertical: 13), // Padding tombol
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Sudut tombol
                      ),
                    ),
                    child: Text(
                      "Daftar Ulang",
                      style: TextStyle(
                        color: Colors.white, // Warna teks
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
