import 'package:flutter/material.dart';
import 'package:nutri_note/widget/colDataMakan.dart';
import 'package:nutri_note/widget/counterIcon.dart';
import 'package:nutri_note/widget/showEditMakanan.dart';
import 'package:nutri_note/widget/text_type.dart';

class CardMakanan extends StatelessWidget {
  final double width;
  final int id;
  final String name;
  final int amount;
  final int cal;
  final int carb;
  final int protein;
  final int fat;
  final VoidCallback? onEdit; 
  // final VoidCallback? onEdit; // Callback untuk aksi edit

  const CardMakanan({
    Key? key,
    required this.onEdit,
    required this.width,
    required this.id,
    required this.name,
    required this.amount,
    required this.cal,
    required this.carb,
    required this.protein,
    required this.fat,
    // this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  SizedBox(
                    width: width-40-24-45,
                    child: TextType.subtitleSemiBoldBlack(text: name),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "asset/icons/calories.png",
                        width: 12,
                      ),
                      TextType.regular(text: "$amount Kalori / $cal g")
                    ],
                  )
                ],
              ),
              InkWell(
                child: Image.asset(
                  "asset/icons/edit.png",
                  width: 24,
                ),
                onTap: () async {
                  await showEditDialog(
                    context,
                    id: id, // ID makanan
                    namaMakanan: name,
                    jumlahMakanan: amount.toString(),
                    kaloriMakanan: cal.toString(),
                    karboMakanan: carb.toString(),
                    proteinMakanan: protein.toString(),
                    lemakMakanan: fat.toString(),
                  );
                  if (onEdit != null) {
                    onEdit!(); // Memanggil callback untuk menyegarkan daftar
                  }
                },

              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              colDataMakan('Karbohidrat', '$carb g'),
              colDataMakan('Protein', '$protein g'),
              colDataMakan('Lemak', '$fat g'),
              CounterIcon(cal: amount, carb: carb, protein: protein, fat: fat,)
            ],
          )
        ],
      ),
    );
  }
}