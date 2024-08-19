import 'package:flutter/material.dart';
import 'package:pmb_app/pages/fullimage_page.dart';

class AgendaPage extends StatelessWidget {
  const AgendaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          'Agenda',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),

          // First agenda item
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FullImagePage(imagePath: 'assets/event1.png'),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        'assets/event1.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Table(
                      columnWidths: {
                        0: IntrinsicColumnWidth(),
                        1: FlexColumnWidth(),
                      },
                      children: [
                        TableRow(
                          children: [
                            Text(
                              'Agenda:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Wisuda XVIII UIGM',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            SizedBox(height: 5), // Space between rows
                            SizedBox(height: 5),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              'Tanggal:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            Text(
                              'Sabtu, 02 Des 2023',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            SizedBox(height: 5),
                            SizedBox(height: 5),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              'Waktu:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '08:00:00',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            SizedBox(height: 5),
                            SizedBox(height: 5),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              'Tempat:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Graha Indo Global Mandiri',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Second agenda item
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FullImagePage(imagePath: 'assets/founder.jpg'),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        'assets/founder.jpg',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Table(
                      columnWidths: {
                        0: IntrinsicColumnWidth(),
                        1: FlexColumnWidth(),
                      },
                      children: [
                        TableRow(
                          children: [
                            Text(
                              'Agenda:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Founders Live Palembang "Wong Kito Pacak"',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            SizedBox(height: 5), // Space between rows
                            SizedBox(height: 5),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              'Tanggal:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Rabu, 13 Juli 2022',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            SizedBox(height: 5),
                            SizedBox(height: 5),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              'Waktu:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '16:00:00',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            SizedBox(height: 5),
                            SizedBox(height: 5),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              'Tempat:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Universitas Indo Global Mandiri',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
