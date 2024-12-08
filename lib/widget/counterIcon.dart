import 'package:flutter/material.dart';
import 'package:nutri_note/widget/text_type.dart';

class CounterIcon extends StatefulWidget {
  @override
  _CounterIconState createState() => _CounterIconState();
}

class _CounterIconState extends State<CounterIcon> {
  int count = 0; // Menyimpan nilai klik

  @override
  Widget build(BuildContext context) {
    return Container(
        child: (count == 0)? InkWell(
          onTap:() {
            setState(() {
              count++;
            });
          },
          child: Image.asset('asset/icons/add_btn.png', width: 35,),
        ): 
        Row(
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                    count--;
                  });
                  },
                  child: Image.asset('asset/icons/min_btn.png', width: 24,),
                ),
                SizedBox(width: 5,),
                TextType.subtitleSemiBoldBlack(text: count.toString()),
                SizedBox(width: 5,),
                InkWell(
                  onTap:() {
                    setState(() {
                      count++;
                    });
                  },
                  child: Image.asset('asset/icons/add_btn.png', width: 24,),
                ),
              ],
            ), // Tampilkan "+" jika awal
         
      );
  }
}