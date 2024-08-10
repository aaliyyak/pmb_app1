import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:pmb_app/pages/home_page.dart';
import 'package:pmb_app/pages/profil_page.dart';
import 'package:pmb_app/pages/riwayat_page.dart';
import 'package:pmb_app/themes/themes.dart';

class NotifikasiPage extends StatefulWidget {
  @override
  _NotifikasiPageState createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage> {
  int _selectedIndex = 2; // Set the default selected index to "Notifikasi" page
  List<Color> _iconColors = [
    Colors.black,
    Colors.black,
    Colors.orange,
    Colors.black
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      for (int i = 0; i < _iconColors.length; i++) {
        _iconColors[i] = i == index ? Colors.orange : Colors.black;
      }
    });
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RiwayatPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NotifikasiPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: abuColor,
      appBar: AppBar(
        title: Text('Notifikasi(4)'),
        backgroundColor: whiteColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 4, // Ganti dengan jumlah notifikasi sebenarnya
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      "Informasi Lebih Lanjut", // Ganti dengan isi notifikasi sebenarnya
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xffd9d9d9),
        items: <Widget>[
          _buildNavItem(Icons.home, "Beranda", 0),
          _buildNavItem(Icons.history, "Riwayat", 1),
          _buildNavItem(Icons.notifications, "Notifikasi", 2),
          _buildNavItem(Icons.person, "Profil", 3),
        ],
        index: _selectedIndex,
        height: 55,
        onTap: _onItemTapped,
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 25, color: _iconColors[index]),
        Text(
          label,
          style: TextStyle(
            fontSize: 9,
            color: _iconColors[index],
          ),
        ),
      ],
    );
  }
}
