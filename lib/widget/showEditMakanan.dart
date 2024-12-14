import 'package:flutter/material.dart';
import 'package:nutri_note/page/page_editMakanan.dart';
import 'package:nutri_note/widget/text_type.dart';

Future<void> showEditDialog(BuildContext context, {
  required int id,
  String? namaMakanan,
  String? jumlahMakanan,
  String? kaloriMakanan,
  String? karboMakanan,
  String? proteinMakanan,
  String? lemakMakanan,
}) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: EditMakanan(
          id: id,
          initialNamaMakanan: namaMakanan,
          initialJumlahMakanan: jumlahMakanan,
          initialKaloriMakanan: kaloriMakanan,
          initialKarboMakanan: karboMakanan,
          initialProteinMakanan: proteinMakanan,
          initialLemakMakanan: lemakMakanan,
        ),
        title: Center(
          child: TextType.bigContent(text: "Edit Menu"),
        ),
      );
    },
  );
}

