import 'package:flutter/material.dart';
import 'package:pmb_app/widget/neon_button.dart';
import 'login_page.dart';
import 'regist_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF0D3559), // Warna latar belakang biru
        child: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.start, // Posisikan children di bagian atas
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height *
                      0.04, // Tambahkan margin atas
                  bottom: 15,
                ),
              ),
              SizedBox(
                height: 60,
              ), // Jarak antar elemen
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(30), // Membulatkan sudut gambar
                child: Image.asset(
                  'assets/qwbb.png', // Gambar onboarding
                  width: 290,
                  height: 290,
                ),
              ),
              // Jarak antar elemen
              Text(
                'Daftar kuliah lebih mudah dan cepat\ndi #PmbUIGM', // Teks deskripsi
                style: TextStyle(
                  color: Colors.blueGrey[100], // Warna teks
                  fontSize: 12, // Ukuran font
                ),
                textAlign: TextAlign.center, // Rata tengah
              ),
              SizedBox(height: 40), // Jarak antar elemen
              NeonButton(
                text: 'BUAT AKUN',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            RegistPage()), // Navigasi ke halaman registrasi
                  );
                },
              ),
              SizedBox(height: 20), // Jarak antar elemen
              NeonButton(
                text: 'MASUK',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LoginScreen()), // Navigasi ke halaman login
                  );
                },
              ),
              Expanded(
                child: Align(
                  alignment:
                      Alignment.bottomCenter, // Posisikan teks di bagian bawah
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10.0), // Padding bawah
                    child: Text(
                      'Copyright © 2024 | UNIVERSITAS INDO GLOBAL MANDIRI', // Teks hak cipta
                      textAlign: TextAlign.center, // Rata tengah
                      style: TextStyle(
                        fontSize: 10, // Ukuran font
                        color: Colors.white, // Warna teks
                      ),
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
