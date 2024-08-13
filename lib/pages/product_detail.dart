import 'package:flutter/material.dart';
import 'package:pmb_app/themes/themes.dart';
import 'package:pmb_app/widget/product_widget.dart';
import 'daftar_now_page.dart'; // Import the DaftarNowPage

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  Color _buttonColor = abuColor;

  void _onButtonPressed() {
    setState(() {
      _buttonColor = primaryColor; // Change the button color to blue
    });
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DaftarNowPage()), // Navigate to DaftarNowPage
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(220, 250),
                    bottomRight: Radius.elliptical(400, 250),
                  ),
                  child: Image.asset(
                    "assets/it3r.jpg",
                    width: double.infinity,
                    height: 350, // Set the desired height for the image
                    fit: BoxFit.cover, // Ensure the image covers the container
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 40,
                  right: 120,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 2,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Teknik Informatika",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "S1",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 30),
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
            SizedBox(height: 18),
            _buildDecoratedSection(
              context: context,
              title: "Pilihan Kelas",
              content: Text(
                "Reguler (Senin - Jumat 08:00 - 15:30 WIB)\nKaryawan R2 (Senin - Jumat 16:00 - 22:00 WIB)",
                style: greyTextstyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10), // Space between sections
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
            SizedBox(height: 10), // Space between sections
            _buildDecoratedSection(
              context: context,
              title: "Kegiatan Mahasiswa",
              content: Text(
                "Lomba ui&ux\n Lomba build app",
                style: greyTextstyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10), // Space between sections
            _buildDecoratedSection(
              context: context,
              title: "Fasilitas",
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FacilityIcon(label: 'E-Learning', icon: Icons.laptop),
                  FacilityIcon(label: 'WiFi', icon: Icons.wifi),
                  FacilityIcon(label: 'Laboratorium', icon: Icons.science),
                  FacilityIcon(label: 'Mushola', icon: Icons.self_improvement),
                  FacilityIcon(
                      label: 'Perpustakaan', icon: Icons.library_books),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 1.0, vertical: 20.0),
              child: ElevatedButton(
                onPressed: _onButtonPressed,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 8),
                    Text(
                      'DAFTAR SEKARANG',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: _buttonColor, // Use the dynamic button color
                ),
              ),
            ),
          ],
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
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
          ),
        ],
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: title),
            SizedBox(height: 5),
            content,
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
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
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
        Icon(icon, size: 40),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
