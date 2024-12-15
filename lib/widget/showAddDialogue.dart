 import 'package:flutter/material.dart';
import 'package:nutri_note/page/page_addMakanan.dart';
import 'package:nutri_note/widget/text_type.dart';

void showAddDialog(BuildContext context, VoidCallback onFoodAdded) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        content: AddMakanan(
          onFoodAdded: onFoodAdded,
        ),
        title: Center(
          child: TextType.bigContent(text: "Tambah Menu"),
        ),
      );
    },
  );
}
