import 'package:flutter/material.dart';
import 'package:pmb_app/themes/themes.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({
    super.key,
    required this.nama,
    required this.jenjang,
    required this.imageUrl,
    required this.namaLengkap,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.alamat,
    required this.namaSekolah,
    required this.jurusan,
    required this.tahunLulus,
    required this.pilihanKelas,
    required this.ukJaket,
    required this.noHp,
    required this.email,
    required this.biayaUKT,
    required this.namaOrtu,
    required this.penghasilan,
    required this.pekerjaanOrtu,
  });

  final String namaLengkap;
  final String tempatLahir;
  final String tanggalLahir;
  final String alamat;
  final String namaSekolah;
  final String jurusan;
  final String tahunLulus;
  final String pilihanKelas;
  final String ukJaket;
  final String noHp;
  final String email;

  final String namaOrtu;
  final String penghasilan;
  final String pekerjaanOrtu;

  final String nama, jenjang, imageUrl, biayaUKT;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: Text(
          "Konfirmasi Pendaftaran",
          style: blackTextstyle,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: greyColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Bagian informasi program studi
            Container(
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // Mengubah posisi bayangan
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/it3r.jpg",
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Program Studi Teknik Informatika",
                              style: blackTextstyle.copyWith(
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Biaya UKT: $biayaUKT",
                              style: greyTextstyle,
                            ),
                            Text(
                              "S1",
                              style: greyTextstyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 0),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Informasi Pendaftar",
                      style: blackTextstyle.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  _buildInfoRow("Nama Lengkap", namaLengkap),
                  _buildInfoRow("Tempat Lahir", tempatLahir),
                  _buildInfoRow("Tanggal Lahir", tanggalLahir),
                  _buildInfoRow("Alamat", alamat),
                  _buildInfoRow("Nama Sekolah", namaSekolah),
                  _buildInfoRow("Jurusan", jurusan),
                  _buildInfoRow("Tahun Lulus", tahunLulus),
                  _buildInfoRow("Pilihan Kelas", pilihanKelas),
                  _buildInfoRow("Ukuran Jaket", ukJaket),
                  _buildInfoRow("No HP", noHp),
                  _buildInfoRow("Email", email),
                  _buildInfoRow("Nama Orang Tua", namaOrtu),
                  _buildInfoRow("Pekerjaan Orang Tua", pekerjaanOrtu),
                  _buildInfoRow("Penghasilan Orang Tua", penghasilan),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Text(
                "*Pastikan semua data sudah benar sebelum klik tombol Daftar.",
                style: greyTextstyle,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80,
        color: whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextButton(
            style: TextButton.styleFrom(backgroundColor: primaryColor),
            onPressed: () {
              // Menampilkan Snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Pendaftaran Berhasil'),
                  duration: Duration(seconds: 2), // Durasi snackbar
                  backgroundColor:
                      Colors.green, // Warna latar belakang snackbar
                ),
              );

              // Logika tambahan bisa ditambahkan di sini
            },
            child: Padding(
              padding: const EdgeInsets.only(
                top: 5,
                bottom: 5,
                left: 19,
                right: 19,
              ),
              child: Text(
                "Daftar Sekarang",
                style: whiteTextstyle,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: blackTextstyle.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 4), // Memberikan jarak antara label dan nilai
          Text(
            value,
            style: greyTextstyle,
          ),
        ],
      ),
    );
  }
}
