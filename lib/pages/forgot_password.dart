import 'package:flutter/material.dart';
import 'package:pmb_app/pages/konfirmasi_page.dart';
import 'package:pmb_app/themes/themes.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor, // Apply lightColor here
      body: Container(
        margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: MediaQuery.of(context).size.height * 0.10),
        child: ListView(
          children: [
            Text(
              "Lupa Password?",
              style: blackTextstyle.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Masuk dengan Email yang terdaftar",
              style: greyTextstyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 70),
            Container(
              width: double.infinity,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Masukkan Alamat Email',
                  hintStyle: TextStyle(color: Colors.grey[700]),
                  filled: true,
                  fillColor: Colors.transparent,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: greyColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: blackColor),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                ),
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blueGrey,
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return _OtpDialog();
                    },
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    'Kirim Kode',
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _OtpDialog extends StatefulWidget {
  @override
  __OtpDialogState createState() => __OtpDialogState();
}

class __OtpDialogState extends State<_OtpDialog> {
  bool _buttonClicked = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Color(0xFFB6C5D1), // Background color for the dialog
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipOval(
            child: Image.asset(
              'assets/otp.jpeg',
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'KODE OTP',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Kami akan mengirimkan Anda kode OTP.\nSilahkan klik untuk melanjutkan.',
            textAlign: TextAlign.center,
            softWrap: true,
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: _buttonClicked ? Colors.white : primaryColor,
              backgroundColor: _buttonClicked ? primaryColor : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            onPressed: () {
              setState(() {
                _buttonClicked = true;
              });
              Future.delayed(Duration(milliseconds: 300), () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KonfirmasiPage()),
                );
              });
            },
            child: Text(
              'Lanjutkan',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
