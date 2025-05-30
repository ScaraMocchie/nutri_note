import 'package:flutter/material.dart';
import 'package:nutri_note/controller/dataUser_controller.dart';
import 'package:nutri_note/page/page_firstEdit.dart';
import 'package:nutri_note/widget/big_button.dart';
import 'package:nutri_note/widget/navbar.dart';
import 'package:nutri_note/widget/text_type.dart';


class Tutorial extends StatefulWidget {
  const Tutorial({super.key});

  @override
  State<Tutorial> createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffFF9156), Color.fromARGB(255, 208, 73, 0)],
                  begin: Alignment.topCenter)
            ),
            child: SizedBox(
            height: height,
            width: width,
          ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  TextType.pageTitle(text: "Selamat Datang di LifePlate"),
                  SizedBox(height: 20),
                  TextType.pageSubtitle(text: "Aplikasi yang akan membantumu menjaga pola makan sehat dan seimbang dengan cara mencatat asupan makanan. Di sini kami akan membantu kamu memahami cara menggunakan aplikasi ini."),

                  SizedBox(height: 20),
                  TextType.pageSubtitleSemiBold(text: "1. Masukkan Data Diri"),
                  Image.asset('asset/images/contoh_isi_data.jpeg',
                  width: width*2/3, ),
                  TextType.pageSubtitle(text: "Data diri kamu membantu kami dalam melakukan personalisasi kebutuhan nutrisi harianmu. "),

                  SizedBox(height: 20),
                  TextType.pageSubtitleSemiBold(text: "2. Cara Mencatat Makanan"),
                  TextType.pageSubtitle(text: "1. Klik tombol catat makanan di halaman utama "),
                  TextType.pageSubtitle(text: "2. Kemudian pilih makanan dan klik '+' untuk menambahkan. Kamu bisa meyesuaikan porsi dan memilih beberapa makanan sekaligus pada tahap ini."),
                  Image.asset('asset/images/contoh_tambah_makanan.jpeg', width: width*2/3,),
                  TextType.pageSubtitle(text: "3. Kamu juga bisa menggunakan fitur pencarian untuk menemukan makanan yang ingin kamu catat."),
                  Image.asset('asset/images/contoh_search.jpeg', width: width*2/3,),
                  TextType.pageSubtitle(text: "4. Klik simpan untuk mencatat makanan yang telah kamu pilih."),
  

                  SizedBox(height: 20),
                  TextType.pageSubtitleSemiBold(text: "3. Lihat hasil catatan"),
                  Image.asset('asset/images/contoh_hasil_catat.jpeg', width: width*2/3,),
                  TextType.pageSubtitle(text: "Catatan makananmu akan tampil di halaman utama, berupa jumlah kalori, protein, karbohidrat, dan lemak yang sudah dikonsumsi hari ini, batasnya telah disesuaikan dengan data diri kamu."),

                  SizedBox(height: 20),
                  TextType.pageSubtitleSemiBold(text: "4. Menambahkan dan Mengedit Data Makanan"),
                  TextType.pageSubtitle(text: "Kamu bisa menambahkan makanan baru dengan mengklik tombol 'Menu Baru' di halaman utama"),
                  Image.asset('asset/images/contoh_tambah_menu.jpeg', width: width*2/3,),

                  TextType.pageSubtitle(text: "Atau mengedit makanan yang sudah ada dengan mengklik ikon pensil pada catatan makanan."),
                  Image.asset('asset/images/contoh_edit_menu.jpeg', width: width*2/3,),

                  TextType.pageSubtitle(text: "Masukkan data makanan sesuai dengan yang tertera pada kemasan makanan, atau sesuai dengan data yang kamu miliki."),
                  Image.asset('asset/images/contoh_isi_menu.jpeg', width: width*2/3,),

                  SizedBox(height: 20),
                  TextType.pageSubtitleSemiBold(text: "5. Fitur Lainnya"),
                  Image.asset('asset/images/contoh_bmi.jpeg', width: width*2/3,),
                  TextType.pageSubtitle(text: "Kamu bisa mendapatkan informasi mengenai BMI untuk membantumu memahami apakah berat badanmu sudah ideal."),
                  Image.asset('asset/images/contoh_air_minum.jpeg', width: width*2/3,),
                  TextType.pageSubtitle(text: "Kamu juga bisa mencatat asupan air minum harianmu untuk memastikan kamu tetap terhidrasi dengan baik. Klik ikon air minum di halaman utama untuk mencatatnya."),

                  SizedBox(height: 80),
                  InkWell(
                    onTap: () {
                      (DataUser.username!=null)
                      ?Navigator.pop(context)
                      :Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => PageFirstEdit()),
                );
                    },
                    child: buttonBig(width, "Selesai"),
                  ),


                ],
                ))
            )),
           Align(
          alignment: Alignment.bottomCenter,
          child: null,
        )
        ],
      )
    );
  }
}