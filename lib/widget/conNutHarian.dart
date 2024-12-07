import 'package:flutter/material.dart';
import 'package:nutri_note/widget/text_type.dart';
conNutHarian(String judul, int taken, int needed, var width) {
    return Container(
      width: (width - 50) / 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      padding: EdgeInsets.all(15),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextType.regularUp(text: judul.toString()),
              SizedBox(height: 5,),
              TextType.bigContent(text: "${(100*taken/needed).toInt()}%"),
              SizedBox(height: 15,),
              TextType.regular(text: "${taken}/${needed}"),
              
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: (judul=="Kalori")?Color(0xffFFCCC4):(judul == "Karbohidrat")?Color(0xffD6ECFF):(judul=="Protein")?Color(0xffC4E9CE):Color(0xffFFE8AE),
                      borderRadius: BorderRadius.circular(100)
                    ),
                    child: SizedBox(height: 15, width: width,),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: (judul=="Kalori")?Color(0xffFE4E33):(judul == "Karbohidrat")?Color(0xff8AC9FE):(judul=="Protein")?Color(0xff6DCB86):Color(0xffF9BF29),
                      borderRadius: BorderRadius.circular(100)
                    ),
                    child: SizedBox(height: 15, width: ((width-50-30)/2)*taken/needed,),
                  )
                ],
              )
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              (judul=="Kalori")?"asset/icons/calories.png":(judul == "Karbohidrat")?"asset/icons/carbohydrates.png":(judul=="Protein")?"asset/icons/cheese.png":"asset/icons/fried-chicken.png",
              width: 25,
            ),
          )
        ],
      ),
    );
  }