import 'package:flutter/material.dart';
import 'package:nutri_note/widget/text_type.dart';

Column colDataMakan(String judul, String data) {
    return Column(
      children: [
        TextType.subtitleSemiBoldBlack(text: data),
        TextType.regular(text: judul)
      ],
    );
  }