import 'package:flutter/material.dart';

class PmbPage extends StatefulWidget {
  const PmbPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PmbPageState createState() => _PmbPageState();
}

class _PmbPageState extends State<PmbPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd9d9d9),
      appBar: AppBar(
        backgroundColor: Color(0xff0d3559),
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 35,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(0),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff0d3559),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(95, 150),
                    bottomRight: Radius.elliptical(600, 250),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "Riwayat Pendaftaran",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 25),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari Informasi Riwayat',
                        hintStyle: TextStyle(fontSize: 12),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 1,
                          horizontal: 0.5,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    // Your content for Riwayat Page
                    // For example, a list of history items
                    Card(
                      child: ListTile(
                        title: Text('Pendaftaran 1'),
                        subtitle: Text('Tanggal: 20 Juni 2023'),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('Pendaftaran 2'),
                        subtitle: Text('Tanggal: 22 Juni 2023'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
