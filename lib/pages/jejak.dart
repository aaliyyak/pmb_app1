import 'package:flutter/material.dart';

class jejakAlumni extends StatelessWidget {
  const jejakAlumni({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Jejak Alumni')),
      body: Center(
        child: Text(
          'Halaman Jejak Alumni',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
