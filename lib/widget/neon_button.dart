import 'package:flutter/material.dart';

class NeonButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  NeonButton({required this.text, required this.onTap});

  @override
  _NeonButtonState createState() => _NeonButtonState();
}

class _NeonButtonState extends State<NeonButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 270,
        height: 45,
        decoration: BoxDecoration(
          color: Colors
              .transparent, // Mengubah warna latar belakang menjadi transparan
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            if (_isPressed) // Menampilkan shadow jika tombol ditekan
              BoxShadow(
                color: Colors.white.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 5,
              ),
          ],
          border: Border.fromBorderSide(BorderSide(
            color: _isPressed
                ? Colors.pinkAccent.withOpacity(0.5)
                : Colors.white, // Mengubah warna border saat ditekan
            width: 1,
            style: BorderStyle.solid,
          )),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
              shadows: [
                Shadow(
                  color: Colors.white
                      .withOpacity(0.1), // Menambahkan shadow pada teks
                  blurRadius: 2,
                  offset: Offset(0, 1), // Mengatur posisi shadow
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
