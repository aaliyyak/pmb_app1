import 'package:flutter/material.dart';

class BiroPage extends StatelessWidget {
  const BiroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biro'),
      ),
      body: Center(
        child: Text(
          'Ini adalah halaman Biro.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
