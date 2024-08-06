import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:pmb_app/pages/bantuan_page.dart';
import 'package:pmb_app/pages/home_page.dart';
import 'package:pmb_app/pages/ketentuan_page.dart';
import 'package:pmb_app/pages/notif.dart';
import 'package:pmb_app/pages/pengaturan_page.dart';
import 'package:pmb_app/pages/riwayat_page.dart';
import 'package:pmb_app/pages/splash_page.dart';
import 'package:pmb_app/pages/ubahpass_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 3; // Set the default selected index to "Profil" page
  List<Color> _iconColors = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.orange
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
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd9d9d9),
      appBar: AppBar(
        backgroundColor: const Color(0xff0d3559),
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 35,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(0),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xff0d3559),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(95, 150),
                    bottomRight: Radius.elliptical(600, 100),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 80,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "SITI AYU HERMALIAH",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "ayucantek29@gmail.com",
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1, horizontal: 25),
                child: Column(
                  children: [
                    _buildProfileOption(Icons.settings, "Pengaturan Akun", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PengaturanPage(
                                  namaLengkap: '',
                                  tempatLahir: '',
                                  tanggalLahir: '',
                                  jenisKelamin: '',
                                  email: '',
                                )),
                      );
                    }),
                    _buildProfileOption(Icons.lock, "Ubah Kata Sandi", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UbahPassPage()),
                      );
                    }),
                    _buildProfileOption(Icons.language, "Bahasa", () {
                      _showLanguageSelection(context);
                    }),
                    _buildProfileOption(Icons.help, "Bantuan", () {
                      // Tambahkan aksi untuk halaman Bantuan jika ada
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => bantuanPage()),
                      );
                    }),
                    _buildProfileOption(Icons.description, "Ketentuan Layanan",
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KetentuanPage()),
                      );
                    }),
                    _buildProfileOption(Icons.logout, "Keluar", () {
                      _showLogoutConfirmation(context);
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color(0xffd9d9d9),
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
        animationDuration: const Duration(milliseconds: 600),
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

  Widget _buildProfileOption(IconData icon, String label, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 1),
      height: 55, // Menentukan tinggi kotak
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 18,
          ),
        ),
        trailing:
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }

  void _showLanguageSelection(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Pilih Bahasa"),
          content: const Text("Fitur ini belum tersedia."),
          actions: <Widget>[
            TextButton(
              child: const Text("Tutup"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            bool isYesTapped = false;
            bool isNoTapped = false;

            return AlertDialog(
              title: const Text("Konfirmasi Keluar"),
              content: const Text("Apakah Anda yakin ingin keluar?"),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    // ignore: dead_code
                    backgroundColor: isYesTapped ? Colors.blue : Colors.white,
                  ),
                  child: const Text("Ya"),
                  onPressed: () {
                    setState(() {
                      isYesTapped = !isYesTapped;
                    });
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SplashScreen()));
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    // ignore: dead_code
                    backgroundColor: isNoTapped ? Colors.blue : Colors.white,
                  ),
                  child: const Text("Tidak Jadi"),
                  onPressed: () {
                    setState(() {
                      isNoTapped = !isNoTapped;
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
