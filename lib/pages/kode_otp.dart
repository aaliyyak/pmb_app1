import 'package:flutter/material.dart';
import 'package:pmb_app/pages/forgot_password.dart';
import 'package:pmb_app/pages/konfirmasi_page.dart';
import 'package:pmb_app/themes/themes.dart';

class OtpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color(0xFFB6C5D1),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Color(0xFFB6C5D1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              'Silahkan Cek Email Anda',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 5, right: 5),
              child: Text(
                'Kami mengirim kode melalui Email. Masukkan kode itu untuk mengkonfirmasi akun Anda.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ),

            SizedBox(height: 20), // Jarak antara input dan tombol
            Container(
              width: double.infinity, // Mengatur lebar tombol
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  // Navigasi ke halaman konfirmasi ketika tombol Masukkan Kode ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KonfirmasiPage()),
                  );
                },
                child: Center(
                  child: Text(
                    'Masukkan Kode',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: TextButton(
                onPressed: () {
                  // Navigasi ke halaman forgot password ketika teks Kirim Kode lagi ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen()),
                  );
                },
                child: Text(
                  'Kirim Kode lagi',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
