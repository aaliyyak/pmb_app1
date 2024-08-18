import 'package:flutter/material.dart';
import 'package:pmb_app/pages/riwayat_page.dart';
import 'package:pmb_app/themes/themes.dart';
import 'package:pmb_app/widget/product_widget.dart';
import 'cart_page.dart'; // Import DaftarNowPage

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  void _onButtonPressed() {
    // Aksi saat tombol "Daftar Sekarang" ditekan
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(), // Pindah ke halaman DaftarNowPage
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor, // Mengatur warna latar belakang
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .stretch, // Menyusun elemen kolom agar memenuhi lebar secara horizontal
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(190, 90),
                    bottomRight: Radius.elliptical(440, 230),
                  ), // Mengatur border radius elips pada gambar
                  child: Image.asset(
                    "assets/it3r.jpg",
                    width: double.infinity,
                    height: 340, // Menentukan tinggi gambar
                    fit: BoxFit.cover, // Memastikan gambar sesuai dengan wadah
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Kembali ke layar sebelumnya
                    },
                    child: Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 15,
                  right: 120,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(6), // Padding di dalam kontainer
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            13), // Sudut melingkar dengan radius 13
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 2,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .start, // Menyusun elemen secara horizontal di awal
                        children: [
                          Column(
                            children: [
                              Text(
                                "Program Studi Teknik Informatika",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "S1",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 17), // Jarak antara teks dan gambar
                          Image.asset(
                            "assets/Bbru.png",
                            width: 35,
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            _buildDecoratedSection(
              context: context,
              title: "Pilihan Kelas",
              content: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Menyusun elemen agar rata kiri
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 20, color: Colors.grey),
                      SizedBox(width: 8), // Jarak antara ikon dan teks
                      Text(
                        "Reguler (Senin - Jumat 08:00 - 15:30 WIB)",
                        style: greyTextstyle.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2), // Jarak antara dua baris
                  Row(
                    children: [
                      // Icon(Icons.calendar_today, size: 20, color: Colors.grey),
                      SizedBox(width: 28), // Jarak antara ikon dan teks
                      Text(
                        "Karyawan  (Senin - Jumat 16:00 - 22:00 WIB)",
                        style: greyTextstyle.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 10), // Jarak antar bagian
            _buildDecoratedSection(
              context: context,
              title: "Deskripsi",
              content: Text(
                "Teknik Informatika merupakan fakultas ilkom",
                style: greyTextstyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10), // Jarak antar bagian
            _buildDecoratedSection(
              context: context,
              title: "Kegiatan Mahasiswa",
              content: Text(
                "Lomba ui&ux\nLomba build app",
                style: greyTextstyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10), // Jarak antar bagian
            _buildDecoratedSection(
              context: context,
              title: "Fasilitas",
              content: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround, // Mengatur jarak antar ikon
                children: [
                  FacilityIcon(label: 'E-Learning', icon: Icons.laptop),
                  FacilityIcon(label: 'WiFi', icon: Icons.wifi),
                  FacilityIcon(label: 'Laboratorium', icon: Icons.science),
                  FacilityIcon(label: 'Mushola', icon: Icons.mosque),
                  FacilityIcon(label: 'Perpustakaan', icon: Icons.book),
                ],
              ),
            ),
            SizedBox(height: 25), // Jarak antara Fasilitas dan tombol bawah
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity, // Mengatur kontainer agar memenuhi lebar layar
        height: 70, // Mengatur tinggi navigasi bawah
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Padding di sekitar tombol
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        primaryColor, // Mengatur warna latar tombol "Daftar Sekarang"
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Sudut melingkar dengan radius 10
                    ),
                  ),
                  onPressed: _onButtonPressed, // Aksi saat tombol ditekan
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: 15,
                      right: 15,
                    ), // Padding di dalam teks tombol
                    child: Text(
                      "Daftar Sekarang",
                      style: whiteTextstyle, // Mengatur teks menjadi putih
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10), // Jarak antara tombol chat dan tombol daftar
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    side: BorderSide(
                        color: primaryColor,
                        width: 2), // Warna border biru dengan lebar 2
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Sudut melingkar dengan radius 10
                    ),
                  ),
                  onPressed: () {
                    // Aksi saat tombol chat ditekan
                    // Tambahkan logika di sini
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.chat, color: primaryColor), // Ikon chat
                      SizedBox(width: 8), // Jarak antara ikon dan teks
                      Text(
                        "Chat",
                        style: TextStyle(color: primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDecoratedSection({
    required BuildContext context,
    required String title,
    required Widget content,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor, // Mengatur warna latar bagian
        boxShadow: [
          BoxShadow(
            color: Colors.black12, // Mengatur warna bayangan
          ),
        ],
      ),
      width: double.infinity, // Mengatur bagian agar memenuhi lebar layar
      child: Padding(
        padding: const EdgeInsets.all(12.0), // Padding di dalam bagian
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .start, // Menyusun elemen kolom agar dimulai dari kiri
          children: [
            SectionTitle(title: title), // Judul bagian
            SizedBox(height: 5), // Jarak antara judul dan konten
            content, // Konten bagian
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 5.0), // Padding vertikal di sekitar judul
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold, // Mengatur teks judul menjadi tebal
        ),
      ),
    );
  }
}

class FacilityIcon extends StatelessWidget {
  final String label;
  final IconData icon;

  const FacilityIcon({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40), // Ukuran ikon diatur menjadi 40
        SizedBox(height: 8), // Jarak antara ikon dan label
        Text(
          label,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
