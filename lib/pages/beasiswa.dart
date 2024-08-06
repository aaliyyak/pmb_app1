import 'package:flutter/material.dart';

class BeasiswaPage extends StatelessWidget {
  const BeasiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beasiswa'),
      ),
      body: Center(
        child: Text(
          'Ini adalah halaman Beasiswa.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
