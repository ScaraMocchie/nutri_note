

import 'package:flutter/material.dart';
import 'package:nutri_note/widget/ColumnInfoBMI.dart';
import 'package:nutri_note/widget/big_button.dart';
import 'package:nutri_note/widget/buttonBMI.dart';
import 'package:nutri_note/widget/columnInfoAir.dart';
import 'package:nutri_note/widget/conNutHarian.dart';
import 'package:nutri_note/widget/navbar.dart';
import 'package:nutri_note/widget/text_type.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    var nama = "Lorem Ipsum";

    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffFF9156), Color(0xffFFCFB6)],
                  begin: Alignment.topCenter)),
          child: SizedBox(
            height: height,
            width: width,
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                TextType.pageSubtitle(text: "Selamat Datang"),
                TextType.pageTitle(text: nama),
                SizedBox(
                  height: 20,
                ),

                TextType.pageSubtitleSemiBold(text: "Informasi BMI"),
                SizedBox(
                  height: 10,
                ),

                //container BMI
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          columnInfoBMI("Berat", "70 kg"),
                          columnInfoBMI("BMI", "27.3"),
                          InkWell(
                            child: buttonBMI("Perbarui Berat"),
                            onTap: () {},
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextType.regular(
                          text:
                              "Berdasarkan skor BMI, Anda termasuk overweight.")
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                TextType.pageSubtitleSemiBold(text: "Rangkuman Asupan Harian"),
                SizedBox(
                  height: 10,
                ),

                //box-box nutrisi
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: conNutHarian("Kalori", 500, 700, width),
                    ),
                    InkWell(
                      child: conNutHarian("Karbohidrat",500, 700, width),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: conNutHarian("Protein", 500, 700, width),
                    ),
                    InkWell(
                      child: conNutHarian("Lemak",500, 700, width),
                    ),
                    // Text("ajsajsi")
                  ],
                ),
                SizedBox(height: 15,),
                InkWell(
                  child: buttonBig(width, "Catat Makanan"),
                  onTap: () {
                    
                  },
                ),

                SizedBox(
                  height: 20,
                ),
                TextType.pageSubtitleSemiBold(text: "Catatan Air Minum"),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: TextType.regular(text: "Kemarin Anda tidak mencapai target air minum harian. Jangan lupa untuk mencukupi kebutuhan minum anda setiap hari!"),),
                          InkWell(
                            child: Image.asset("asset/icons/raindrop 1.png"),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircularPercentIndicator(
                            radius: 50,
                            percent: 1000/2000,
                            circularStrokeCap: CircularStrokeCap.round,
                            lineWidth: 12,
                            progressColor: Color(0xff8AC9FE),
                            animation: true,
                            animationDuration: 800,
                            animateFromLastPercent: true,
                            backgroundColor: Color(0xffD9D9D9),
                            center: TextType.bigContent(text: "50%"),
                            ),
                            columnInfoAir("Target", "2000 ml"),
                            columnInfoAir("Saat ini", "1000 ml")
                                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 110,)
                
              ],
            ),
          )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: NavBar(width: width,),
        )
      ],
    ));
  }

  
  
}
