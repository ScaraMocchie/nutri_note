import 'package:flutter/material.dart';
import 'package:nutri_note/widget/olahraga.dart';
import 'package:nutri_note/widget/text_type.dart';
import 'package:nutri_note/widget/tujuan.dart';

class PageEdit extends StatefulWidget {
  const PageEdit({super.key});

  @override
  State<PageEdit> createState() => _PageEditState();
}

class _PageEditState extends State<PageEdit> {
  final List<String> tujuanItems = ["Menaikkan Berat Badan", "Menjaga Berat Badan", "Menurunkan Berat Badan"];
  String? selectedTujuan;

  final List<String> intensitasItems = [
    "Tidak Pernah",
    "Jarang",
    "Sering",
    "Sangat Sering"
  ];
  String? selectedIntensitas;

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
                TextType.pageTitle(text: "Edit Profile"),
                SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Padding(padding: EdgeInsets.only(left: 50),
                  child: Image.asset("asset/icons/man.png",
                  width: 100, height: 100),),
                Padding(padding: EdgeInsets.only(left: 50),
                  child: Image.asset("asset/icons/profile_woman.png",
                  width: 100, height: 100),),
                ],),
                SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Nama",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  )
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Umur",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  )
                ),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 170,
                      child: TextField(
                  decoration: InputDecoration(
                    labelText: "Berat Badan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  )
                ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 170,
                      child: TextField(
                  decoration: InputDecoration(
                    labelText: "Tinggi Badan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  )
                ),
                    ),
                  ],),
                  SizedBox(height: 20),
                DropDownTujuan(
                  items: tujuanItems,
                  selectedValue: selectedTujuan, 
                  onChanged: (String? newValue){
                    setState(() {
                      selectedTujuan = newValue;
                    });
                  }),
                  SizedBox(height: 20),
                  DropDownOlahraga(
                    items: intensitasItems,
                    selectedValue: selectedIntensitas, 
                    onChanged: (String? newValue){
                    setState(() {
                      selectedTujuan = newValue;
                    });
                  })
                ],))
            ))
        ],
      )
      );
  }
}