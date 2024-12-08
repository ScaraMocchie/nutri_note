import 'package:flutter/material.dart';
import 'package:nutri_note/widget/background.dart';
import 'package:nutri_note/widget/big_button.dart';
import 'package:nutri_note/widget/cardMakanan.dart';
import 'package:nutri_note/widget/text_type.dart';

class CatatMakananState extends StatefulWidget {
  const CatatMakananState({super.key});

  @override
  State<CatatMakananState> createState() => _CatatMakananStateState();
}

class _CatatMakananStateState extends State<CatatMakananState> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      body: Stack(
        children: [
          Background1(height, width),
          SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextType.pageTitle(text: "Catat Makanan"),
                      Image.asset(
                        "asset/icons/menuBaru.png",
                        width: 80,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //search container
                  TextField(
                    onChanged: (value) {},
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(left: 30),
                        hintText: "Search",
                        hintStyle: const TextStyle(height: 2),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none)),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  //list makanan
                  for (int i = 0; i < 10; i++) CardMakanan(),
                  SizedBox(height: 100,)
                ],
              ),
            ),
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
            child: buttonBig(width-40, "Simpan"),
          ),
          )
        ],
      ),
    );
  }



  
}
