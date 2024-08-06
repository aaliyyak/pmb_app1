import 'dart:async';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:pmb_app/pages/onboarding_page.dart';
import 'package:pmb_app/themes/themes.dart';

// Definisikan kelas SplashScreen sebagai StatefulWidget
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

// Definisikan state dari SplashScreen
class _SplashScreenState extends State<SplashScreen> {
  double _progressValue = 0.0; // Menyimpan nilai progres dari indikator
  late Timer _timer; // Timer untuk mengatur interval pembaruan progres

  @override
  void initState() {
    super.initState();
    _startProgress(); // Mulai timer untuk memperbarui progres
    // Mengatur timer untuk berpindah ke halaman berikutnya setelah 9 detik
    Timer(Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: OnboardingPage(),
        ),
      );
    });
  }

  // Memulai timer untuk memperbarui nilai progres setiap 150 milidetik
  void _startProgress() {
    _timer = Timer.periodic(Duration(milliseconds: 200), (Timer timer) {
      setState(() {
        // Jika progres mencapai atau lebih dari 1.0, hentikan timer
        if (_progressValue >= 1.0) {
          _timer.cancel();
        } else {
          // Jika belum, tingkatkan nilai progres sebesar 0.01
          _progressValue += 0.01;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Hentikan timer ketika widget dihancurkan
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        // Menggunakan Stack untuk menumpuk widget
        children: [
          Center(
            // Pusatkan konten
            child: Column(
              // Gunakan Column untuk menempatkan gambar dan indikator progress secara vertikal
              mainAxisAlignment:
                  MainAxisAlignment.center, // Pusatkan secara vertikal
              children: [
                Image.asset(
                  // Tampilkan gambar logo
                  'assets/logoigm11.png',
                  width: 160,
                  height: 160,
                ),
                SizedBox(
                    height: 90), // Berikan jarak antara gambar dan indikator
                DotsIndicator(
                  // Tambahkan indikator titik-titik
                  dotsCount: 4, // Jumlah titik
                  position: _progressValue *
                      4, // Posisi titik aktif berdasarkan progres
                  decorator: DotsDecorator(
                    // Dekorasi titik
                    color: Colors.grey, // Warna titik yang belum aktif
                    activeColor: Colors.white, // Warna titik yang aktif
                    size:
                        const Size.square(5.0), // Ukuran titik yang belum aktif
                    activeSize:
                        const Size(12.0, 12.0), // Ukuran titik yang aktif
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            // Posisi teks di bawah layar
            left: 0,
            right: 0,
            bottom: 10,
            child: Text(
              'Copyright © 2024 | UNIVERSITAS INDO GLOBAL MANDIRI',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
