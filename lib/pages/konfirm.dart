import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pmb_app/themes/themes.dart';

class KonfirmPage extends StatefulWidget {
  const KonfirmPage({Key? key}) : super(key: key);

  @override
  _KonfirmPageState createState() => _KonfirmPageState();
}

class _KonfirmPageState extends State<KonfirmPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pickImage(ImageSource source) async {
    final XFile? selectedImage = await _picker.pickImage(source: source);
    setState(() {
      _image = selectedImage;
    });

    if (selectedImage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Bukti pembayaran berhasil diupload')),
      );
    }
  }

  void _onButtonPressed() {
    if (_image != null) {
      // Jika ada gambar yang di-upload
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Upload file berhasil')),
      );
    } else {
      // Jika tidak ada gambar yang di-upload
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Belum ada file yang dipilih')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('Konfirmasi Pembayaran'),
        backgroundColor: bgColor,
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Text("Silahkan upload Bukti Pembayaran Disini!"),
          SizedBox(height: 30),
          Center(
            child: _image == null
                ? Image.asset(
                    'assets/ic_photo.png',
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  )
                : Image.file(
                    File(_image!.path), // Menampilkan gambar yang dipilih
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            icon: Icon(Icons.photo_camera, color: blackColor),
            label: Text(
              'Pilih',
              style: blackTextstyle,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    title: Text('Pilih Sumber Gambar'),
                    children: <Widget>[
                      SimpleDialogOption(
                        onPressed: () {
                          _pickImage(ImageSource.camera);
                          Navigator.of(context).pop();
                        },
                        child: Row(
                          children: [
                            Icon(Icons.camera_alt),
                            SizedBox(width: 10),
                            Text('Kamera'),
                          ],
                        ),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          _pickImage(ImageSource.gallery);
                          Navigator.of(context).pop();
                        },
                        child: Row(
                          children: [
                            Icon(Icons.photo_library),
                            SizedBox(width: 10),
                            Text('Galeri'),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _image = null;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[200],
            ),
            child: Text(
              'Batal',
              style: blackTextstyle,
            ),
          ),
          SizedBox(height: 20),
          // Bagian ini telah dihapus
          // _image != null
          //     ? Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Container(
          //           padding: EdgeInsets.all(16.0),
          //           decoration: BoxDecoration(
          //             color: Colors.grey[300],
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //           child: Text('Pastikan file yang di pilih sudah benar'),
          //         ),
          //       )
          //     : Container(),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80,
        color: whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onPressed: _onButtonPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(
                "Upload Bukti Bayar",
                style: whiteTextstyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
