import 'package:flutter/material.dart';
import 'package:nutri_note/controller/dataUser_controller.dart';
import 'package:nutri_note/page/page_beranda.dart';
import 'package:nutri_note/widget/big_button.dart';
import 'package:nutri_note/widget/gender.dart';
import 'package:nutri_note/widget/olahraga.dart';
import 'package:nutri_note/widget/text_type.dart';
import 'package:nutri_note/widget/tujuan.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageEdit extends StatefulWidget {
  final bool isFirst;
  const PageEdit({super.key, required this.isFirst});

  @override
  State<PageEdit> createState() => _PageEditState();
}

class _PageEditState extends State<PageEdit> {
  final List<String> tujuanItems = [
    "Menaikkan Berat Badan",
    "Menjaga Berat Badan",
    "Menurunkan Berat Badan"
  ];
  final nameController = TextEditingController();
  final umurController = TextEditingController();
  final beratController = TextEditingController();
  final tinggiController = TextEditingController();

  String errormes = '';

  String? selectedTujuan;
  String? selectedIntensitas;
  String? selectedGender;

  bool isValid() {
    if (nameController.text == '' ||
        selectedGender == null ||
        umurController.text == '' ||
        beratController.text == '' ||
        tinggiController.text == '' ||
        selectedTujuan == null ||
        selectedIntensitas == null) {
      setState(() {
        errormes = 'Data tidak boleh kosong';
      });
      return false;
    }
    try {
      int.parse(umurController.text);
      int.parse(beratController.text);
      int.parse(tinggiController.text);
    } catch (e) {
      setState(() {
        errormes = 'Mohon masukkan data yang valid';
      });
      return false;
    }
    return true;
  }

  final List<String> intensitasItems = [
    "Tidak Pernah",
    "Jarang (1-3 hari dalam seminggu)",
    "Sering (3-5 hari dalam seminggu)",
    "Sangat Sering (hampir setiap hari)"
  ];

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
                        TextType.pageTitle(text: "Edit Profile"),
                        SizedBox(height: 40),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 50),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedGender = "male";
                                  });
                                },
                                child: Gender(
                                  size: 100,
                                  imagePath: "asset/icons/man.png",
                                  initialColor: Colors.white,
                                  onClickColor: selectedGender == "male"
                                      ? Colors.orange
                                      : Colors.white,
                                ),
                              ),
          
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 50),
                                child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedGender = "female";
                                      });
                                    },
                                    child: Gender(
                                      size: 100,
                                      imagePath:
                                          "asset/icons/profile_woman.png",
                                      initialColor: Colors.white,
                                      onClickColor: selectedGender == "female"
                                          ? Colors.orange
                                          : Colors.white,
                                    ))
                     
                                ),
                          ],
                        ),
                        SizedBox(height: 30),
                        TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              labelText: "Nama",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            )),
                        SizedBox(height: 20),
                        TextField(
                            controller: umurController,
                            decoration: InputDecoration(
                              labelText: "Umur",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            )),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 170,
                              child: TextField(
                                  controller: beratController,
                                  decoration: InputDecoration(
                                    labelText: "Berat Badan",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                  )),
                            ),
                            SizedBox(width: 10),
                            SizedBox(
                              width: 170,
                              child: TextField(
                                  controller: tinggiController,
                                  decoration: InputDecoration(
                                    labelText: "Tinggi Badan",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        DropDownTujuan(
                            items: tujuanItems,
                            selectedValue: selectedTujuan,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedTujuan = newValue;
                              });
                            }),
                        SizedBox(height: 20),
                        DropDownOlahraga(
                            items: intensitasItems,
                            selectedValue: selectedIntensitas,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedIntensitas = newValue;
                              });
                            }),
                        SizedBox(height: 30),
                        InkWell(
                          child: buttonBig(width, "Simpan"),
                          onTap: () async{
                            if (widget.isFirst) {
                              if(isValid()){
                                String name = nameController.text;
                                int age = int.parse(umurController.text);
                                int berat = int.parse(beratController.text);
                                int tinggi = int.parse(tinggiController.text);
                                setState(() {
                                  DataUser.username = name;
                                  DataUser.gender = selectedGender;
                                  DataUser.age = age;
                                  DataUser.berat = berat;
                                  DataUser.tinggi = tinggi;
                                  DataUser.intensitasOl = selectedIntensitas;
                                  DataUser.tujuan = selectedTujuan;

                                });

                                SharedPreferences sp = await SharedPreferences.getInstance();
                                sp.setString('username', name);
                                sp.setString('gender', selectedGender!);
                                sp.setInt('age', age);
                                sp.setInt('berat', berat);
                                sp.setInt('tinggi', tinggi);
                                sp.setString('intensitasOl', selectedIntensitas!);
                                sp.setString('tujuan', selectedTujuan!);

                                Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (BuildContext context,
                                      Animation<double> animation1,
                                      Animation<double> animation2) {
                                    return const Beranda();
                                  },
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                ),
                              );
                              }
                              
                            } else {
                              Navigator.pop(context);
                            }
                            ;
                          },
                        ),
                      ],
                    ))))
      ],
    ));
  }
}