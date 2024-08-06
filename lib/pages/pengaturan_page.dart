import 'package:flutter/material.dart';
import 'package:pmb_app/themes/themes.dart';

class PengaturanPage extends StatefulWidget {
  final String namaLengkap;
  final String tempatLahir;
  final String tanggalLahir;
  final String jenisKelamin;
  final String email;

  PengaturanPage({
    required this.namaLengkap,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.jenisKelamin,
    required this.email,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PengaturanPageState createState() => _PengaturanPageState();
}

class _PengaturanPageState extends State<PengaturanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Pengaturan akun',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: widget.namaLengkap,
                border: OutlineInputBorder(),
              ),
              enabled: false,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: widget.tempatLahir,
                      border: OutlineInputBorder(),
                    ),
                    enabled: false,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: widget.tanggalLahir,
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    enabled: false,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: widget.jenisKelamin,
                border: OutlineInputBorder(),
              ),
              enabled: false,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: widget.email,
                border: OutlineInputBorder(),
              ),
              enabled: false,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Action for save button
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                'Simpan',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
