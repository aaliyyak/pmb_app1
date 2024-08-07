import 'package:flutter/material.dart';
import 'package:pmb_app/themes/themes.dart';
import 'package:pmb_app/pages/prodi_page.dart'; // Pastikan import halaman prodi_page

class PmbPage extends StatefulWidget {
  const PmbPage({super.key});

  @override
  _PmbPageState createState() => _PmbPageState();
}

class _PmbPageState extends State<PmbPage> {
  bool isSarjanaSelected = true;

  Widget _buildContentBox(String title, String description, Color color,
      String imageAsset, String programLabel) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 4),
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
                        fontSize: 16,
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProdiPage(),
                          ),
                        );
                      },
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
                        'Lihat Program Studi',
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
                width: 120, // Fixed width to maintain box size
                height: 120, // Fixed height to maintain box size
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

  Widget _buildToggleButton(String title, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.grey[300],
          borderRadius: BorderRadius.circular(30),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Penerimaan Mahasiswa Baru',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 50,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        //actions: [
        // IconButton(
        //  icon: Icon(Icons.search, color: Colors.black),
        //  onPressed: () {
        // Add search functionality here
        // },
      ),
      // ],
      //  ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _buildToggleButton(
                          'Sarjana (S1)', isSarjanaSelected, () {
                        setState(() {
                          isSarjanaSelected = true;
                        });
                      }),
                    ),
                    SizedBox(width: 1), // Reduced space between buttons
                    Expanded(
                      child: _buildToggleButton(
                          'Pascasarjana', !isSarjanaSelected, () {
                        setState(() {
                          isSarjanaSelected = false;
                        });
                      }),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                if (isSarjanaSelected) ...[
                  _buildContentBox(
                    'Ilmu Komputer',
                    'Fakultas Teknik',
                    Colors.purple,
                    'assets/qwbb.jpg',
                    'S1',
                  ),
                  _buildContentBox(
                    'Matematika',
                    'Fakultas MIPA',
                    Colors.teal,
                    'assets/qww.jpg',
                    'S1',
                  ),
                  _buildContentBox(
                    'Akuntansi',
                    'Fakultas Ekonomi',
                    Colors.orange,
                    'assets/qwr.jpg',
                    'S1',
                  ),
                  _buildContentBox(
                    'Psikologi',
                    'Fakultas Psikologi',
                    Colors.blue,
                    'assets/ayor.jpg',
                    'S1',
                  ),
                  _buildContentBox(
                    'Teknologi Hasil Pertanian',
                    'Fakultas Pertanian',
                    Colors.red,
                    'assets/qwb.jpg',
                    'S1',
                  ),
                  _buildContentBox(
                    'mencintai dia',
                    'Fakultas cinta',
                    secondaryColor,
                    'assets/qwbb.jpg',
                    'S1',
                  ),
                ] else ...[
                  _buildContentBox(
                    'Magister Manajemen',
                    'Fakultas Ekonomi',
                    Colors.purple,
                    'assets/5r.jpg',
                    'S2',
                  ),
                  _buildContentBox(
                    'Magister Teknik Informatika',
                    'Fakultas Teknik',
                    Colors.teal,
                    'assets/5.jpg',
                    'S2',
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
