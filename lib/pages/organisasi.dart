import 'package:flutter/material.dart';

class OrganisasiPage extends StatelessWidget {
  const OrganisasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Susunan Organisasi'),
      ),
      body: Center(
        child: Text(
          'Ini adalah halaman Susunan Organisasi.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
