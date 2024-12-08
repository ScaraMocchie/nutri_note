import 'package:flutter/material.dart';
import 'package:nutri_note/widget/text_type.dart';

columnInfoAir(String title, String content) {
    return Column(
      children: [
        TextType.regularUp(text: title),
        SizedBox(height: 10,),
        TextType.bigTextAir(text: content)
      ],
    );
  }