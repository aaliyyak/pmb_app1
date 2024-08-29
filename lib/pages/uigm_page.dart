import 'package:flutter/material.dart';
import 'package:pmb_app/pages/beasiswa.dart';
import 'package:pmb_app/pages/biro.dart';
import 'package:pmb_app/pages/organisasi.dart';
import 'package:pmb_app/themes/themes.dart';

class UIGMPage extends StatefulWidget {
  @override
  _UIGMPageState createState() => _UIGMPageState();
}

class _UIGMPageState extends State<UIGMPage>
    with SingleTickerProviderStateMixin {
  final List<String> fields = [
    'Sejarah',
    'Visi & Misi',
    'Susunan Organisasi',
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

  late AnimationController _animationController;
  late Animation<double> _animation;

  Offset position = Offset(20, 20);

  bool showImage = true; // Menyimpan status apakah gambar ditampilkan

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
      body: Stack(
        children: [
          SingleChildScrollView(
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
                        height: 270,
                        fit: BoxFit.cover,
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
                                blurRadius: 2,
                                offset: Offset(2, 2),
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
                SizedBox(height: 8),
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
                SizedBox(height: 8),
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
                SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: fields.map((field) {
                      return GestureDetector(
                        onTap: () {
                          navigateToPage(context, field);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 1),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
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
          showImage
              ? Positioned(
                  top: position.dy,
                  left: position.dx,
                  child: Draggable(
                    feedback: Stack(
                      children: [
                        Container(
                          width: 140,
                          height: 110,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.transparent,
                                blurRadius: 1,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/vtt.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 4,
                          right: 4,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                showImage = false; // Menghapus gambar
                              });
                            },
                            child: Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    childWhenDragging: Container(
                      width: 140,
                      height: 110,
                    ),
                    onDragEnd: (details) {
                      setState(() {
                        position = details.offset;
                      });
                    },
                    child: Stack(
                      children: [
                        AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(0, _animation.value),
                              child: child,
                            );
                          },
                          child: Container(
                            width: 140,
                            height: 110,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.transparent,
                                  blurRadius: 1,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/vtt.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 4,
                          right: 4,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                showImage = false; // Menghapus gambar
                              });
                            },
                            child: Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : SizedBox
                  .shrink(), // Tidak menampilkan apapun jika gambar tidak ada
        ],
      ),
    );
  }
}
