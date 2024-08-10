import 'package:flutter/material.dart';
import 'package:pmb_app/themes/themes.dart';

class ProdiPage extends StatefulWidget {
  const ProdiPage({super.key});

  @override
  _ProdiPageState createState() => _ProdiPageState();
}

class _ProdiPageState extends State<ProdiPage> {
  Widget _buildContentBox(String title, String description, Color color,
      String imageAsset, String programLabel) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Text(
                programLabel,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30), // Add spacing to avoid overlap
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      description,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor, // Button color
                        padding: EdgeInsets.symmetric(
                            vertical: 1, horizontal: 15), // Adjust padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20), // Button radius
                        ),
                      ),
                      child: Text(
                        'Lihat Detail Program Studi',
                        style: TextStyle(
                          fontSize: 10, // Smaller text size
                          color: Colors.white,
                          fontWeight: FontWeight.bold, // Text color
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 110, // Fixed width to maintain box size
                height: 110, // Fixed height to maintain box size
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imageAsset,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 60,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Container(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'cari prodi berdasarkan minatmu....',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ), // Set hint text color
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding: EdgeInsets.all(15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              suffixIcon: Icon(Icons.search, color: Colors.grey),
            ),
            onTap: () {
              // Behavior when the search box is tapped
            },
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                _buildContentBox(
                  'Teknik Informatika',
                  'Fakultas Ilmu Komputer & sains',
                  Colors.lightBlue.shade900,
                  'assets/it3.png',
                  'S1',
                ),
                _buildContentBox(
                  'Sistem Komputer',
                  'Fakultas Ilmu Komputer & sains',
                  Colors.lightBlue.shade900,
                  'assets/it3.png',
                  'S1',
                ),
                _buildContentBox(
                  'Sistem Informasi',
                  'Fakultas Ilmu Komputer & sains',
                  Colors.lightBlue.shade900,
                  'assets/it3.png',
                  'S1',
                ),
                _buildContentBox(
                  'Biologi',
                  'Fakultas Ilmu Komputer & sains',
                  Colors.lightBlue.shade900,
                  'assets/it3.png',
                  'S1',
                ),
                _buildContentBox(
                  'Kimia',
                  'Fakultas Ilmu Komputer & sains',
                  Colors.lightBlue.shade900,
                  'assets/it3.png',
                  'S1',
                ),
                _buildContentBox('Manajemen', 'Fakultas Ekonomi',
                    Colors.teal.shade300, 'assets/Mn4.png', 'S1'),
                _buildContentBox('Akuntansi', 'Fakultas Ekonomi',
                    Colors.teal.shade300, 'assets/Mn4.png', 'S1'),
                _buildContentBox(
                  'Teknik Sipil',
                  'Fakultas Teknik',
                  Colors.blueGrey.shade800,
                  'assets/Spil1.png',
                  'S1',
                ),
                _buildContentBox(
                  'Arsitektur',
                  'Fakultas Teknik',
                  Colors.blueGrey.shade800,
                  'assets/Spil1.png',
                  'S1',
                ),
                _buildContentBox(
                  'Perencanaan Wilayah & Kota',
                  'Fakultas Teknik',
                  Colors.blueGrey.shade800,
                  'assets/Spil1.png',
                  'S1',
                ),
                _buildContentBox(
                  'Kesehatan & Keselamatan Kerja',
                  'Fakultas Teknik',
                  Colors.blueGrey.shade800,
                  'assets/Spil1.png',
                  'D4',
                ),
                _buildContentBox(
                  'Ilmu Pemerintahan',
                  'Fakultas Ilmu Pemerintahan &\nBudaya Desain Komunikasi Visual',
                  Colors.lightBlue.shade700,
                  'assets/Ip3.png',
                  'S1',
                ),
                _buildContentBox(
                  'Desain Komunikasi Visual',
                  'Fakultas Ilmu Pemerintahan &\nBudaya Desain Komunikasi Visual',
                  Colors.lightBlue.shade700,
                  'assets/Ip3.png',
                  'S1',
                ),
                _buildContentBox(
                  'Bahasa Inggris',
                  'Fakultas Keguruan &\nIlmu Pendidikan',
                  Colors.deepPurple.shade400,
                  'assets/ttt11.png',
                  'S1',
                ),
                _buildContentBox(
                  'Magister Ilmu Komputer',
                  'Fakultas Ilmu Komputer & sains',
                  Colors.indigoAccent.shade200,
                  'assets/Sk2.png',
                  'S2',
                ),
                _buildContentBox('Magister Manajemen', 'Fakultas Ekonomi',
                    Colors.teal.shade300, 'assets/Mn4.png', 'S2'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
