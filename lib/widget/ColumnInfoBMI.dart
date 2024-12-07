import 'package:flutter/material.dart';
import 'package:nutri_note/widget/text_type.dart';

columnInfoBMI(String title, String content) {
    return Column(
      children: [
        TextType.regularUp(text: title),
        TextType.bigContent(text: content)
      ],
    );
  }