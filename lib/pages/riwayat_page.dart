import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:pmb_app/pages/home_page.dart';
import 'package:pmb_app/pages/notif.dart';
import 'package:pmb_app/pages/profil_page.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RiwayatPageState createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  int _selectedIndex = 1; // Set the default selected index to "Riwayat" page
  List<Color> _iconColors = [
    Colors.black,
    Colors.orange,
    Colors.black,
    Colors.black
  ];
  int _tabIndex = 0; // Index to track selected tab
  final Color primaryColor = Color(0xff0d3559); // Define your primary color
  final PageController _pageController = PageController(initialPage: 0);

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

  Widget _buildStatusContainer(String status, Color color, IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                child: Icon(icon, color: color, size: 30),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  status,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20), // Add space between text and button
          ElevatedButton(
            onPressed: () {
              // Add any onTap functionality if needed
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    bool isSelected = _tabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _tabIndex = index;
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: 10, horizontal: 40), // Adjusted padding
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  colors: [Color(0xff0d3559), Color(0xff5691c8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isSelected ? null : Colors.transparent,
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd9d9d9),
      appBar: AppBar(
        title: Text('Riwayat'),
        backgroundColor: Color(0xffd9d9d9),
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 50,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(0),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildTabButton("Dalam Proses", 0),
                          _buildTabButton("Hasil Seleksi", 1),
                        ],
                      ),
                      SizedBox(
                          height: 20), // Add space between tabs and content
                      Container(
                        height: MediaQuery.of(context).size.height *
                            0.6, // Adjust the height as needed
                        child: PageView(
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              _tabIndex = index;
                            });
                          },
                          children: [
                            Column(
                              children: [
                                _buildStatusContainer("Berkas Belum Lengkap",
                                    Colors.red, Icons.error_outline),
                                SizedBox(height: 20), // Add space between cards
                                _buildStatusContainer("Menunggu Verifikasi",
                                    Colors.yellow, Icons.hourglass_empty),
                              ],
                            ),
                            Column(
                              children: [
                                _buildStatusContainer("Pendaftaran Diterima",
                                    Colors.green, Icons.check_circle_outline),
                                SizedBox(height: 20), // Add space between cards
                                _buildStatusContainer("Pendaftaran Ditolak",
                                    Colors.grey, Icons.cancel_outlined),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
