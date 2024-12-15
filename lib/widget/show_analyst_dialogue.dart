import 'package:flutter/material.dart';
import 'package:nutri_note/controller/dataUser_controller.dart';
import 'package:nutri_note/widget/big_button.dart';
import 'package:nutri_note/widget/text_type.dart';

void showAnalisDialoge(BuildContext context, String data, String title, double width) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextType.regularUp(text: "${DataUser.analisisCal}"),
            SizedBox(height: 20,),
            InkWell(
              child: buttonBig(width, 'Tutup'),
              onTap: (){
                Navigator.pop(context);
              },
            )],
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [TextType.bigContent(text: "Analisis Singkat $title")],
        ),
      );
    },
  );
}
