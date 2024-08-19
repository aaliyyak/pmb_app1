import 'dart:io'; // Tambahkan import ini untuk File
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pmb_app/themes/themes.dart';

class PengaturanPage extends StatefulWidget {
  final String namaLengkap;
  final String tempatLahir;
  final String tanggalLahir;
  final String jenisKelamin;
  final String email;

  const PengaturanPage({
    required this.namaLengkap,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.jenisKelamin,
    required this.email,
  });

  @override
  _PengaturanPageState createState() => _PengaturanPageState();
}

class _PengaturanPageState extends State<PengaturanPage> {
  XFile? _image; // Menyimpan gambar yang dipilih

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });
    }
  }

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
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey,
                  backgroundImage:
                      _image != null ? FileImage(File(_image!.path)) : null,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 30, // Lebar container
                    height: 30, // Tinggi container
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(
                          0.3), // Background semi-transparan untuk ikon
                    ),
                    child: IconButton(
                      icon: Icon(Icons.photo_camera,
                          color: Colors.black, size: 16), // Ukuran ikon
                      onPressed: _pickImage,
                      padding: EdgeInsets
                          .zero, // Menghapus padding default IconButton
                    ),
                  ),
                ),
              ],
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
                backgroundColor: primaryColor, // Ganti dengan primaryColor Anda
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
