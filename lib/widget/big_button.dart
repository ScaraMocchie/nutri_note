import 'package:flutter/material.dart';
import 'package:nutri_note/widget/text_type.dart';

Container buttonBig(double width, String text) {
    return Container(
                  height: 54,
                  width: width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xffFF6F21)
                  ),
                  child: TextType.buttonText(text: text),
                );
  }