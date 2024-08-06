import 'package:flutter/material.dart';
import 'package:pmb_app/pages/beasiswa.dart';
import 'package:pmb_app/pages/biro.dart';

import 'package:pmb_app/pages/fakultas_page.dart';
import 'package:pmb_app/pages/organisasi.dart';
import 'package:pmb_app/themes/themes.dart';

class UIGMPage extends StatelessWidget {
  final List<String> fields = [
    'Sejarah',
    'Visi & Misi',
    'Susunan Organisasi',
    'Fakultas',
    'Fasilitas',
    'Biro',
    'Beasiswa',
    'Penghargaan'
  ];

  final Map<String, String> fieldTexts = {
    'Sejarah': 'Ini adalah teks sejarah yang akan ditampilkan sebagai pop-up.',
    'Visi & Misi':
        'Ini adalah teks visi dan misi yang akan ditampilkan sebagai pop-up.',
    'Fasilitas':
        'Ini adalah teks fasilitas yang akan ditampilkan sebagai pop-up.',
    'Penghargaan':
        'Ini adalah teks penghargaan yang akan ditampilkan sebagai pop-up.',
  };

  void navigateToPage(BuildContext context, String field) {
    if (fieldTexts.containsKey(field)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(field),
            content: Text(fieldTexts[field]!),
            actions: [
              TextButton(
                child: Text('Tutup'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (field == 'Susunan Organisasi') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OrganisasiPage()));
    } else if (field == 'Fakultas') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FakultasPage()));
    } else if (field == 'Biro') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BiroPage()));
    } else if (field == 'Beasiswa') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BeasiswaPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: abuColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(100, 250),
                    bottomRight: Radius.elliptical(650, 250),
                  ),
                  child: Image.asset(
                    "assets/uigm5.jpg",
                    width: double.infinity,
                    height: 250, // Set the desired height for the image
                    fit: BoxFit.cover, // Ensure the image covers the container
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 16,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios, color: Colors.black),
                  ),
                ),
                Positioned(
                  bottom: 1,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: Offset(5, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Universitas",
                            style: TextStyle(
                              color: redColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Indo Global Mandiri",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                'Motto "Your Success is Our Commitment"',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Akreditasi "Baik Sekali" oleh BAN-PT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: fields.map((field) {
                  return GestureDetector(
                    onTap: () {
                      navigateToPage(context, field);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 6),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            field,
                            style: TextStyle(
                                fontSize: 17, color: Colors.grey[600]),
                          ),
                          Icon(Icons.arrow_forward_ios, color: Colors.grey),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
