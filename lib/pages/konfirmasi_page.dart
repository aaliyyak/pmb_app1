import 'package:flutter/material.dart';
import 'package:pmb_app/pages/forgot_password.dart';
import 'package:pmb_app/pages/home_page.dart';
import 'package:pmb_app/themes/themes.dart';

class KonfirmasiPage extends StatefulWidget {
  @override
  _KonfirmasiPageState createState() => _KonfirmasiPageState();
}

class _KonfirmasiPageState extends State<KonfirmasiPage> {
  TextEditingController _controller = TextEditingController();

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
        padding: EdgeInsets.all(10),
        color: Color(0xFFB6C5D1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Text(
              'Konfirmasi Akun Anda',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Kami mengirim kode melalui Email\nMasukkan kode itu untuk mengkonfirmasi akun Anda.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 60),
            Text(
              'Tidak bisa mengkonfirmasi akun?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20), // Jarak antara tulisan dan input
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Masukkan Kode',
                border: OutlineInputBorder(),
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () => _controller.clear(),
                      )
                    : null,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
              onChanged: (text) {
                setState(() {}); // Perbarui UI saat teks berubah
              },
            ),
            SizedBox(height: 20), // Jarak antara input dan tombol
            Container(
              width: double.infinity, // Mengatur lebar tombol
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10),
                ),
                onPressed: () {
                  // Navigasi ke halaman login ketika tombol Lanjutkan ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Center(
                  child: Text(
                    'Lanjutkan',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
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
          ],
        ),
      ),
    );
  }
}
