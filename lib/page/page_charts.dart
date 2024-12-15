import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nutri_note/controller/dataUser_controller.dart';
import 'package:nutri_note/controller/sevenList_generator.dart';
import 'package:nutri_note/widget/background.dart';
import 'package:nutri_note/widget/chart_bar/bar_graph.dart';
import 'package:nutri_note/widget/chart_bar/bar_graph2.dart';
import 'package:nutri_note/widget/navbar.dart';
import 'package:nutri_note/widget/text_type.dart';

class ChartsPage extends StatefulWidget {
  const ChartsPage({super.key});

  @override
  State<ChartsPage> createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      body: Stack(children: [
        Background1(height, width),
        SafeArea(child: 
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                TextType.pageSubtitleSemiBold(text: "Chart Kalori Mingguan"),
                SizedBox(height: 20,),
                SizedBox(height: 300,
                child: MyBarGraph(list: DataUser.listCal,  mainColor: Color(0xffFE4E33), subColor: Color(0xffFFCCC4))),
                SizedBox(height: 30,),
                TextType.pageSubtitleSemiBold(text: "Chart Perubahan Berat"),
                SizedBox(height: 20,),
                SizedBox(height: 300,
                child: MyBarGraph2(list: sevenListGeneratorDouble(DataUser.listBerat), mainColor: Color(0xff9156FF), subColor: Color(0xffFFCCC4),))
              ],
            ),
          ),)),
        Align(
          alignment: Alignment.bottomCenter,
          child: NavBar(width: width),
        )
      ]),
    );
  }
}