import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pmb_app/pages/daftar.dart';
import 'package:pmb_app/themes/themes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';

//import 'package:path_provider/path_provider.dart';

class DaftarNowPage extends StatefulWidget {
  const DaftarNowPage({
    super.key,
    required this.nama,
    required this.jenjang,
    required this.imageUrl,
    required this.biayaUKT,
    required this.namaLengkap,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.alamat,
    required this.namaSekolah,
    required this.jurusan,
    required this.tahunLulus,
    required this.pilihanKelas,
    required this.ukJaket,
    required this.noHp,
    required this.email,
    required this.namaOrtu,
    required this.penghasilan,
    required this.pekerjaanOrtu,
  });

  final String namaLengkap,
      tempatLahir,
      tanggalLahir,
      alamat,
      namaSekolah,
      jurusan,
      tahunLulus,
      pilihanKelas,
      ukJaket,
      noHp,
      email,
      namaOrtu,
      penghasilan,
      pekerjaanOrtu;

  final String nama, jenjang, imageUrl, biayaUKT;

  @override
  State<DaftarNowPage> createState() => _DaftarNowPageState();
}

class _DaftarNowPageState extends State<DaftarNowPage> {
  TextEditingController namaLengkap = TextEditingController();
  TextEditingController tempatLahir = TextEditingController();
  TextEditingController tanggalLahir = TextEditingController();
  String? pilihanKelas;
  String? ukJaket;
  TextEditingController alamat = TextEditingController();
  TextEditingController noHp = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController namaSekolah = TextEditingController();
  TextEditingController jurusan = TextEditingController();
  TextEditingController tahunLulus = TextEditingController();
  TextEditingController namaOrtu = TextEditingController();
  TextEditingController pekerjaanOrtu = TextEditingController();
  TextEditingController penghasilan = TextEditingController();

  List<String> pilihanKelasOptions = ['Reguler', 'Karyawan'];
  List<String> ukJaketOptions = ['S', 'M', 'L', 'XL', 'XXL'];

  // Variables to hold selected files
  File? ijazahFile;
  File? transkripFile;
  File? ktpFile;
  File? kkFile;
  File? pasfotoFile;
  File? buktiBayarFile;

  // Function to pick a file from gallery or camera
  Future<void> pickFile(ImageSource source, String fileType) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        switch (fileType) {
          case 'ijazah':
            ijazahFile = File(pickedFile.path);
            break;
          case 'transkrip':
            transkripFile = File(pickedFile.path);
            break;
          case 'ktp':
            ktpFile = File(pickedFile.path);
            break;
          case 'kk':
            kkFile = File(pickedFile.path);
            break;
          case 'pasfoto':
            pasfotoFile = File(pickedFile.path);
            break;
          case 'buktiBayar':
            buktiBayarFile = File(pickedFile.path);
            break;
        }
      });
    }
  }

  void removeFile(String fileType) {
    setState(() {
      switch (fileType) {
        case 'ijazah':
          ijazahFile = null;
          break;
        case 'transkrip':
          transkripFile = null;
          break;
        case 'ktp':
          ktpFile = null;
          break;
        case 'kk':
          kkFile = null;
          break;
        case 'pasfoto':
          pasfotoFile = null;
          break;
        case 'buktiBayar':
          buktiBayarFile = null;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: Text(
          "Isi Formulir",
          style: blackTextstyle,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: greyColor,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: whiteColor,
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Image.asset(
                    "assets/it3r.jpg",
                    width: 105,
                    height: 105,
                  ),
                  SizedBox(
                    width: 21,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Program Studi Teknik Informatika",
                        style: blackTextstyle.copyWith(
                            fontWeight: FontWeight.w600),
                      ),
                      //Text(
                      // "Biaya UKT: ${widget.biayaUKT}",
                      //style: greyTextstyle,
                      //  ),
                      Text(
                        "S1",
                        style: greyTextstyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),

          Container(
            decoration: BoxDecoration(
              color: whiteColor,
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.people, color: blackColor),
                      SizedBox(width: 8),
                      Text(
                        "Biografi",
                        style: blackTextstyle.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Nama Lengkap",
                    style: blackTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    controller: namaLengkap,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      hintText: "Masukkan Nama Lengkap",
                      hintStyle: greyTextstyle,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Tempat Lahir",
                    style: blackTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    controller: tempatLahir,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      hintText: "Masukkan Tempat Lahir",
                      hintStyle: greyTextstyle,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Tanggal Lahir",
                    style: blackTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    controller: tanggalLahir,
                    readOnly:
                        true, // Membuat TextFormField hanya dapat diisi dengan memilih tanggal
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime
                            .now(), // Tanggal default saat DatePicker dibuka
                        firstDate: DateTime(1900), // Batas tanggal paling awal
                        lastDate: DateTime.now(), // Batas tanggal paling akhir
                      );

                      if (pickedDate != null) {
                        // Jika tanggal dipilih
                        String formattedDate =
                            "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}"; // Format tanggal sesuai kebutuhan Anda
                        setState(() {
                          tanggalLahir.text =
                              formattedDate; // Set tanggal ke TextFormField
                        });
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      hintText: "Masukkan Tanggal Lahir",
                      hintStyle: greyTextstyle,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Alamat",
                    style: blackTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    controller: alamat,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      hintText: "Masukkan Alamat",
                      hintStyle: greyTextstyle,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Nomor HP",
                    style: blackTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    controller: noHp,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      hintText: "Masukkan Nomor HP",
                      hintStyle: greyTextstyle,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Email",
                    style: blackTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      hintText: "Masukkan Email",
                      hintStyle: greyTextstyle,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Asal Sekolah",
                    style: blackTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    controller: namaSekolah,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      hintText: "Masukkan Nama Sekolah",
                      hintStyle: greyTextstyle,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Jurusan",
                    style: blackTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    controller: jurusan,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      hintText: "Masukkan Jurusan",
                      hintStyle: greyTextstyle,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Tahun Lulus",
                    style: blackTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    controller: tahunLulus,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      hintText: "Masukkan Tahun Lulus",
                      hintStyle: greyTextstyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: whiteColor,
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.family_restroom, color: blackColor),
                      SizedBox(width: 8),
                      Text(
                        "Orang Tua/Wali",
                        style: blackTextstyle.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Nama Orang Tua/Wali",
                    style: blackTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    controller: namaOrtu,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      hintText: "Masukkan Nama Orang Tua/Wali",
                      hintStyle: greyTextstyle,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Pekerjaan Orang Tua/Wali",
                    style: blackTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    controller: pekerjaanOrtu,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      hintText: "Masukkan Pekerjaan Orang Tua/Wali",
                      hintStyle: greyTextstyle,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Penghasilan Orang Tua/Wali",
                    style: blackTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    controller: penghasilan,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      hintText: "Masukkan penghasilan Orang Tua/Wali",
                      hintStyle: greyTextstyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: whiteColor,
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.school, color: blackColor),
                      SizedBox(width: 8),
                      Text(
                        "Akademik",
                        style: blackTextstyle.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Pilihan Kelas",
                    style: blackTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    value: pilihanKelas,
                    items: pilihanKelasOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        pilihanKelas = newValue;
                      });
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      hintText: " Pilih Kelas",
                      hintStyle: greyTextstyle,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Ukuran Jaket",
                    style: blackTextstyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    value: ukJaket,
                    items: ukJaketOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        ukJaket = newValue;
                      });
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      hintText: "Pilih Ukuran Jaket",
                      hintStyle: greyTextstyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // New section for uploading documents
          SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: whiteColor,
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.file_upload, color: blackColor),
                      SizedBox(width: 8),
                      Text(
                        "Upload Dokumen",
                        style: blackTextstyle.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  buildFileUploadField(
                    "Upload Ijazah SMA/SMK/Sederajat",
                    ijazahFile,
                    () => pickFile(ImageSource.gallery, 'ijazah'),
                    () => removeFile('ijazah'),
                  ),
                  buildFileUploadField(
                    "Upload Transkrip Nilai Ijazah",
                    transkripFile,
                    () => pickFile(ImageSource.gallery, 'transkrip'),
                    () => removeFile('transkrip'),
                  ),
                  buildFileUploadField(
                    "Upload KTP",
                    ktpFile,
                    () => pickFile(ImageSource.gallery, 'ktp'),
                    () => removeFile('ktp'),
                  ),
                  buildFileUploadField(
                    "Upload Kartu Keluarga (KK)",
                    kkFile,
                    () => pickFile(ImageSource.gallery, 'kk'),
                    () => removeFile('kk'),
                  ),
                  buildFileUploadField(
                    "Upload Pasfoto Berwarna(3x4)",
                    pasfotoFile,
                    () => pickFile(ImageSource.gallery, 'pasfoto'),
                    () => removeFile('pasfoto'),
                  ),
                  buildFileUploadField(
                    "Upload Bukti Bayar Biaya Pendaftaran",
                    buktiBayarFile,
                    () => pickFile(ImageSource.gallery, 'buktiBayar'),
                    () => removeFile('buktiBayar'),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutPage(
                      nama: widget.nama,
                      jenjang: widget.jenjang,
                      imageUrl: widget.imageUrl,
                      namaLengkap: namaLengkap.text,
                      tempatLahir: tempatLahir.text,
                      tanggalLahir: tanggalLahir.text,
                      alamat: alamat.text,
                      namaSekolah: namaSekolah.text,
                      jurusan: jurusan.text,
                      tahunLulus: tahunLulus.text,
                      pilihanKelas: pilihanKelas ?? '',
                      ukJaket: ukJaket ?? '',
                      noHp: noHp.text,
                      email: email.text,
                      biayaUKT: widget.biayaUKT,
                      namaOrtu: namaOrtu.text,
                      penghasilan: penghasilan.text,
                      pekerjaanOrtu: pekerjaanOrtu.text,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 130, vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Konfirmasi",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  // Helper widget for file upload fields
  Widget buildFileUploadField(
      String label, File? file, VoidCallback onTap, VoidCallback onRemove) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            if (file != null)
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    OpenFile.open(file.path);
                  },
                  child: Text(
                    file.path.split('/').last,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              )
            else
              Expanded(
                child: Text(
                  "Belum ada file",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            if (file != null)
              IconButton(
                icon: Icon(Icons.cancel, color: Colors.red),
                onPressed: onRemove,
              ),
            IconButton(
              icon: Icon(Icons.attach_file),
              onPressed: onTap,
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
