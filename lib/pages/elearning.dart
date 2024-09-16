import 'package:flutter/material.dart';
//import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Fitur1Page extends StatelessWidget {
  const Fitur1Page({super.key});

  // Fungsi untuk membuka URL
  void _launchURL() async {
    const url = 'https://student.uigm.ac.id/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                  onTap: _launchURL,
                  child: Text(
                    'https://vclass.uigm.ac.id/',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                );


  }
}
