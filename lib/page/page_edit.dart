import 'package:flutter/material.dart';
import 'package:nutri_note/controller/calorie_counter_helper.dart';
import 'package:nutri_note/controller/carb_counter_helper.dart';
import 'package:nutri_note/controller/dataUser_controller.dart';
import 'package:nutri_note/controller/fat_counter_helper.dart';
import 'package:nutri_note/controller/protein_counter_helper.dart';
import 'package:nutri_note/controller/water_counter_helper.dart';
import 'package:nutri_note/page/page_profile.dart';
import 'package:nutri_note/widget/big_button.dart';
import 'package:nutri_note/widget/gender.dart';
import 'package:nutri_note/widget/olahraga.dart';
import 'package:nutri_note/widget/text_type.dart';
import 'package:nutri_note/widget/tujuan.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageEdit extends StatefulWidget {
  const PageEdit({super.key});

  @override
  State<PageEdit> createState() => _PageEditState();
}

class _PageEditState extends State<PageEdit> {
  final List<String> tujuanItems = [
    "Menaikkan Berat Badan",
    "Menjaga Berat Badan",
    "Menurunkan Berat Badan"
  ];
  String? selectedTujuan;

  final List<String> intensitasItems = [
    "Tidak Pernah",
    "Jarang (1-3 hari dalam seminggu)",
    "Sering (3-5 hari dalam seminggu)",
    "Sangat Sering (hampir setiap hari)"
  ];
  String? selectedIntensitas;

  String? selectedGender;

  // TextEditingControllers untuk field input
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _umurController = TextEditingController();
  final TextEditingController _beratController = TextEditingController();
  final TextEditingController _tinggiController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); // Tambahkan GlobalKey untuk Form

  @override
  void initState() {
    super.initState();
    _loadUserData(); // Muat data pengguna saat halaman dibuka
  }

  Future<void> _loadUserData() async {
    // Ambil data dari DataUser
    setState(() {
      _namaController.text = DataUser.username ?? '';
      _umurController.text = DataUser.age?.toString() ?? '';
      _beratController.text = DataUser.berat?.toString() ?? '';
      _tinggiController.text = DataUser.tinggi?.toString() ?? '';
      selectedGender = DataUser.gender;
      selectedTujuan = DataUser.tujuan;
      selectedIntensitas = DataUser.intensitasOl;
    });
  }

  Future<void> _saveUserData() async {
    // Simpan data ke DataUser dan SharedPreferences
    SharedPreferences sp = await SharedPreferences.getInstance();

    setState(() {
      DataUser.username = _namaController.text;
      DataUser.age = int.tryParse(_umurController.text);
      DataUser.berat = int.tryParse(_beratController.text);
      DataUser.tinggi = int.tryParse(_tinggiController.text);
      DataUser.gender = selectedGender;
      DataUser.tujuan = selectedTujuan;
      DataUser.intensitasOl = selectedIntensitas;

      int calLimit = countCal(int.tryParse(_umurController.text)!, int.tryParse(_beratController.text)!, int.tryParse(_tinggiController.text)!, selectedTujuan!, selectedIntensitas!, selectedGender!);
      int carbLimit = carbCounter(selectedGender!, DataUser.age!);
      int fatLimit = fatCounter(selectedGender!, DataUser.age!);
      int proteinLimit = proteinCounter(selectedGender!, DataUser.age!);
      int waterLimit = waterIntakeCounter(selectedGender!, DataUser.age!);

      sp.setString('username', DataUser.username ?? '');
      sp.setInt('age', DataUser.age ?? 0);
      sp.setInt('berat', DataUser.berat ?? 0);
      sp.setInt('tinggi', DataUser.tinggi ?? 0);
      sp.setString('gender', DataUser.gender ?? '');
      sp.setString('tujuan', DataUser.tujuan ?? '');
      sp.setString('intensitasOl', DataUser.intensitasOl ?? '');

      sp.setInt('calLimit', calLimit);
      sp.setInt('carbLimit', carbLimit);
      sp.setInt('fatLimit', fatLimit);
      sp.setInt('proteinLimit', proteinLimit);
      sp.setInt('waterLimit', waterLimit);

      DataUser.updateData();
    });
  }

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
                begin: Alignment.topCenter,
              ),
            ),
            child: SizedBox(
              height: height,
              width: width,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
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
                                onClickColor: selectedGender == "male" ? Colors.orange : Colors.white,
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
                                imagePath: "asset/icons/profile_woman.png",
                                initialColor: Colors.white,
                                onClickColor: selectedGender == "female" ? Colors.orange : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: _namaController,
                        decoration: InputDecoration(
                          labelText: "Nama",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nama tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _umurController,
                        decoration: InputDecoration(
                          labelText: "Umur",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Umur tidak boleh kosong";
                          }
                          if (int.tryParse(value) == null) {
                            return "Umur harus berupa angka";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 170,
                            child: TextFormField(
                              controller: _beratController,
                              decoration: InputDecoration(
                                labelText: "Berat Badan",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Berat badan tidak boleh kosong";
                                }
                                if (int.tryParse(value) == null) {
                                  return "Berat badan harus berupa angka";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          SizedBox(
                            width: 170,
                            child: TextFormField(
                              controller: _tinggiController,
                              decoration: InputDecoration(
                                labelText: "Tinggi Badan",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Tinggi badan tidak boleh kosong";
                                }
                                if (int.tryParse(value) == null) {
                                  return "Tinggi badan harus berupa angka";
                                }
                                return null;
                              },
                            ),
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
                        },
                      ),
                      SizedBox(height: 20),
                      DropDownOlahraga(
                        items: intensitasItems,
                        selectedValue: selectedIntensitas,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedIntensitas = newValue;
                          });
                        },
                      ),
                      SizedBox(height: 30),
                      InkWell(
                        child: buttonBig(width, "Simpan"),
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _saveUserData();
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
