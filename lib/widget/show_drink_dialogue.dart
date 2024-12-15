import 'package:flutter/material.dart';
import 'package:nutri_note/controller/dataUser_controller.dart';
import 'package:nutri_note/widget/big_button.dart';
import 'package:nutri_note/widget/buttonBMI.dart';
import 'package:nutri_note/widget/text_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showDrinkDialogue(BuildContext context, double width, Function setState) {
  // Key untuk Form
  final _formKey = GlobalKey<FormState>();
  // Controller untuk TextField
  final _textController = TextEditingController(text: "250");

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Center(
          child: TextType.bigContent(text: "Catat Minum"),
        ),
        content: Form(
          key: _formKey, // Kaitkan Form dengan key
          child: Column(
            mainAxisSize: MainAxisSize.min, // Membuat tinggi dialog sesuai konten
            children: [
              TextFormField(
                controller: _textController, // Kaitkan TextEditingController
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Mohon masukkan jumlah air minum';
                  }
                  try {
                    int.parse(value);
                  } catch (e) {
                    return 'Mohon masukkan input yang valid';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  suffix: TextType.regularUp(text: 'ml'),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffFF9156), width: 2),
                  ),
                  hintText: 'Jumlah air minum',
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () async{
                  // Validasi input
                  if (_formKey.currentState!.validate()) {
                    // Jika validasi berhasil, ambil nilai
                    final drinkAmount = int.parse(_textController.text);
                    print("Jumlah air minum: $drinkAmount ml");
                    DataUser.waterToday = DataUser.waterToday+drinkAmount;
                    SharedPreferences sp = await SharedPreferences.getInstance();
                    sp.setInt('waterToday', DataUser.waterToday);
                    Navigator.of(context).pop(); // Tutup dialog
                  }
                },
                child: buttonBig(width, 'Simpan'),
              ),
            ],
          ),
        ),
      );
    },
  ).then((_){
    setState();
  });
}
