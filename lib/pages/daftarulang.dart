import 'package:flutter/material.dart';
import 'package:pmb_app/themes/themes.dart';

class DaftarUlangPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Daftar Ulang Mahasiswa Baru',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'SELAMAT ANDA LOLOS!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Sebagai Mahasiswa Baru\nProgram studi Teknik Informatika\nUniversitas Indo Global Mandiri',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/congrats.png',
              ),
              SizedBox(height: 20),
              Container(
                height: 180,
                color: Colors.grey[400],
                child: Text(
                  "ayu yang cantek dan mempesona baik hati rajin dan tidak sombong ",
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Action for start button
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'MULAI',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
