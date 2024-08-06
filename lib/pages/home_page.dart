import 'dart:async';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:pmb_app/pages/agenda_page.dart';
import 'package:pmb_app/pages/notif.dart';
import 'package:pmb_app/pages/pmb_page.dart';
import 'package:pmb_app/pages/profil_page.dart';
import 'package:pmb_app/pages/riwayat_page.dart';
import 'package:pmb_app/pages/uigm_page.dart';

import '../themes/themes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentPage = 0;
  final List<String> _images = [
    'assets/kjuara.jpeg',
    'assets/akrditas.jpeg',
    'assets/MottoG.jpeg',
    'assets/kurikulum.jpeg',
    'assets/andin.jpeg',
    'assets/Beasisw.jpeg',
  ];
  int _selectedIndex = 0;
  List<Color> _iconColors = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
  ];

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
    _iconColors[_selectedIndex] =
        Colors.orange; // Set the initial selected icon color
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < _images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

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
      backgroundColor: Color(0xffd9d9d9),
      appBar: AppBar(
        automaticallyImplyLeading: false, // Menyembunyikan tanda panah
        backgroundColor: Color(0xff0d3559),
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 35,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(0), // Sudut kanan
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff0d3559),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(95, 150),
                    bottomRight: Radius.elliptical(600, 250),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          child: Icon(Icons.person,
                              color: primaryColor,
                              size: 30), // Menggunakan ikon default
                          backgroundColor:
                              Colors.grey, // Menambahkan warna latar belakang
                        ),
                        SizedBox(
                            width: 10), // Add some space between image and text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi, Ayu Cuantek",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 1),
                            Text(
                              "Selamat datang di #PmbUIGM",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UIGMPage()),
                        );
                      },
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Cari Informasi Pendaftaran Mahasiswa Baru',
                          hintStyle: TextStyle(fontSize: 12),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildFeatureCard(
                            context,
                            'UIGM',
                            'Info fasilitas\nUniversitas',
                            'assets/build.jpg', // Updated
                            38,
                            UIGMPage(),
                          ),
                          _buildFeatureCard(
                            context,
                            'Agenda',
                            'Jadwal\nPendaftaran',
                            'assets/genda.jpg', // Updated
                            38,
                            AgendaPage(),
                          ),
                          _buildFeatureCard(
                            context,
                            'PMB',
                            'Daftar Jadi\nMahasiswa',
                            'assets/minmin.jpg', // Updated
                            38,
                            PmbPage(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '  Ayo! Bergabunglah bersama kami',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildImageSlider(),
                    SizedBox(height: 10),
                    Text(
                      '  Berita Terkini',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildNewsCard(
                      context,
                      'assets/impactR.jpeg',
                      'Universitas Indo Global Mandiri Raih PTS Peringkat Pertama di Sumbagsel dan Peringkat 7 PTS se-Indonesia versi Impact Rangkings 2023',
                      'Baca Selengkapnya',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
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

  Widget _buildFeatureCard(BuildContext context, String title, String subtitle,
      String imagePath, double iconSize, Widget targetPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetPage),
        );
      },
      child: Container(
        width: 100,
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Image.asset(imagePath, width: iconSize, height: iconSize),
                SizedBox(height: 5),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageSlider() {
    return Container(
      height: 133,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _images.length,
        itemBuilder: (context, index) {
          return _buildImageCard(_images[index]);
        },
      ),
    );
  }

  Widget _buildImageCard(String imagePath) {
    return Card(
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildNewsCard(BuildContext context, String imagePath, String newsText,
      String buttonText) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                height: 400,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Universitas Indo Global Mandiri Raih PTS Peringkat Pertama di Sumbagsel dan Peringkat 7 PTS se-Indonesia versi The Impact Rankings 2023',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '\nKiprah Universitas Indo Global Mandiri (IGM) di dunia pendidikan kian meroket dan terbukti.'
                        ' Times Higher Education (THE) merilis daftar universitas terbaik di dunia 2023 berdasarkan kinerjanya dalam mencapai Tujuan Pembangunan Berkelanjutan.\n'
                        '\nTerdapat 1.591 universitas dari 112 negara yang ikut masuk THE Impact Rankings tahun ini, baik perguruan tinggi negeri maupun swasta.\nTHE Impact Rankings adalah satu-satunya tabel kinerja global yang menilai universitas berdasarkan Tujuan Pembangunan Berkelanjutan atau Sustainable Development Goals (SDGs) PBB.\n\nPeninjauan kinerja perguruan tinggi menggunakan bidang indikator penelitian, tata layanan, penjangkauan, dan pengajaran dalam mendukung 17 SDGs.'
                        ' Posisi PTS terbaik di Indonesia versi THE Impact Rankings diraih oleh Telkom University. Universitas Indo Global Mandiri (IGM) yang berada di bawah naungan Yayasan Indo Global Mandiri berhasil meraih peringkat 7 tingkat nasional. Ini sekaligus membuktikan jika Universitas IGM merupakan Perguruan Tinggi Swasta peringkat pertama di Sumatera Bagian Selatan.\n\n'
                        'Rektor Universitas Indo Global Mandiri, Dr H Marzuki Alie, mengucapkan rasa syukur atas raihan yang diperoleh Universitas IGM. Hal ini menunjukkan jika Universitas IGM benar-benar serius dan fokus dalam memajukan pendidikan berkualitas di Indonesia. Tak hanya itu, alumni yang telah menyelesaikan masa studinya akan menjadi tolok ukur jika Universitas IGM melahirkan orang-orang yang memiliki kapabilitas yang mumpuni sesuai dengan bidangnya.'
                        ' Selain terbaik di Sumbagsel, Universitas IGM juga berada di peringkat 7 terbaik dalam rangking dunia, pungkasnya (andhiko tungga alam).',
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 125, // Set the desired height for the image container
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 12, color: Colors.black),
                    children: [
                      TextSpan(
                        text:
                            'Universitas Indo Global Mandiri Raih PTS Peringkat Pertama di Sumbagsel dan Peringkat 7 PTS se-Indonesia versi The Impact Rangkings 2023\n\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal),
                      ),
                      WidgetSpan(
                        child: Icon(Icons.calendar_today,
                            size: 14, color: Colors.orange),
                      ),
                      TextSpan(
                        text: ' Selasa, 06 Juni 2023\n',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, color: Colors.orange),
                      ),
                      WidgetSpan(
                        child: Icon(Icons.admin_panel_settings,
                            size: 14, color: Colors.orange),
                      ),
                      TextSpan(
                        text: ' Universitas Indo Global Mandiri\n',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, color: Colors.orange),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 20,
                      bottom: 10), // Adjust the padding values as needed
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
