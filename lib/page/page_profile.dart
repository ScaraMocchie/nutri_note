import 'package:flutter/material.dart';
import 'package:nutri_note/controller/dataUser_controller.dart';
import 'package:nutri_note/page/page_edit.dart';
import 'package:nutri_note/widget/big_button.dart';
import 'package:nutri_note/widget/navbar.dart';
import 'package:nutri_note/widget/text_type.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    String nama = DataUser.username!;
    int umur = DataUser.age!;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffFF9156), Color(0xffFFCFB6)],
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                  height: 10,
                ),
                  TextType.pageTitle(text: "Profile"),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Image.asset("asset/icons/profile_woman.png",
                  width: 75, height: 75),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 13),
                  child: TextType.buttonText(text: nama)),
                  TextType.pageSubtitle(text: '$umur tahun')
                    ],)
                  ],),
                  SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextType.pageSubtitleSemiBold(text: "Berat Badan"),
                      SizedBox(width: 80),
                      TextType.pageSubtitleSemiBold(text: "Tinggi Badan")
                    ],),
                    SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 170,
                        height: 41,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextType.regularUp(text: "${DataUser.berat} Kg"),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 170,
                        height: 41,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextType.regularUp(text: "${DataUser.tinggi} Cm"),
                      ),
                    ],),
                    SizedBox(height: 20),
                    TextType.pageSubtitleSemiBold(text: "${DataUser.tujuan}"),
                    SizedBox(height:5),
                    Container(
                        width: 361,
                        height: 41,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextType.regularUp(text: "${DataUser.tujuan}"),
                      ),
                      SizedBox(height: 20),
                    TextType.pageSubtitleSemiBold(text: "Intensitas Olahraga"),
                    SizedBox(height:5),
                    Container(
                        width: 361,
                        height: 41,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextType.regularUp(text: "${DataUser.intensitasOl}"),
                      ),
                      SizedBox(height: 130),
                      InkWell(
                  child: buttonBig(width, "Edit Data"),
                  onTap: () {
                    Navigator.push(
                    context, 
                    PageRouteBuilder(
                      pageBuilder: (BuildContext context, Animation<double> animation1, Animation<double> animation2) {
                        return const PageEdit();
                      },
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  ).then((_){
                    setState(() {
                      
                    });
                  });
                  },
                ),
                ],
                ))
            )),
           Align(
          alignment: Alignment.bottomCenter,
          child: NavBar(width: width,),
        )
        ],
      )
    );
  }
}