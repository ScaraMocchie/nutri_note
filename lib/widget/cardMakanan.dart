import 'package:flutter/material.dart';
import 'package:nutri_note/widget/colDataMakan.dart';
import 'package:nutri_note/widget/counterIcon.dart';
import 'package:nutri_note/widget/text_type.dart';

Container CardMakanan() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextType.subtitleSemiBoldBlack(text: "Nasi Goreng"),
                  Row(
                    children: [
                      Image.asset(
                        "asset/icons/calories.png",
                        width: 12,
                      ),
                      TextType.regular(text: "250 Kalori / 149 g")
                    ],
                  )
                ],
              ),
              InkWell(
                child: Image.asset(
                  "asset/icons/edit.png",
                  width: 24,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              colDataMakan('Karbohidrat', '34,81 g'),
              colDataMakan('Protein', '7,02 g'),
              colDataMakan('Lemak', '9,1 g'),
              CounterIcon()
            ],
          )
        ],
      ),
    );
  }