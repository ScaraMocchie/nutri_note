import 'package:flutter/material.dart';
import 'package:nutri_note/controller/database_service.dart';
import 'package:nutri_note/controller/food_model.dart';
import 'package:nutri_note/controller/totalAdd_controller.dart';
import 'package:nutri_note/widget/background.dart';
import 'package:nutri_note/widget/big_button.dart';
import 'package:nutri_note/widget/cardMakanan.dart';
import 'package:nutri_note/widget/showAddDialogue.dart';
import 'package:nutri_note/widget/text_type.dart';

class CatatMakananState extends StatefulWidget {
  const CatatMakananState({super.key});

  @override
  State<CatatMakananState> createState() => _CatatMakananStateState();
}

class _CatatMakananStateState extends State<CatatMakananState> {
  final DatabaseService _databaseService = DatabaseService.instance;
  late Future<List<Food>?> _futureFoodList;

  @override
  void initState() {
    super.initState();
    _futureFoodList = _databaseService.getFood();
  }

  void _refreshFoodList() {
    setState(() {
      _futureFoodList = _databaseService.getFood();
    });
  }


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
                      InkWell(
                        onTap: () {
                          showAddDialog(context, _refreshFoodList);
                        },
                        child: Image.asset(
                          "asset/icons/menuBaru.png",
                          width: 80,
                        ),
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
                  SizedBox(
                    height: height-54-30-10-24-20-20-120, // atau ukuran sesuai kebutuhan
                    child: foodList(width),
                  ),

                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              child: buttonBig(width - 40, "Simpan"),
              onTap: (){
                _databaseService.getFood();
                print(TotalAdd.totalCal);
                print(TotalAdd.totalCarb);
                print(TotalAdd.totalProtein);
                setState(() {
                  TotalAdd.totalCal = 0;
                  TotalAdd.totalCarb = 0;
                  TotalAdd.totalProtein = 0;
                  TotalAdd.totalFat = 0;
                });
                print(DateTime.now());
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget foodList(double width) {
  return FutureBuilder<List<Food>?>(
    future: _futureFoodList,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text("Error: ${snapshot.error}"));
      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
        return Center(child: Text("No food items found"));
      }
      return ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          final food = snapshot.data![index];
          return CardMakanan(
            onEdit: _refreshFoodList,
            width: width,
            id: food.id,
            name: food.name,
            amount: food.amount,
            cal: food.cal,
            carb: food.carb,
            protein: food.protein,
            fat: food.fat,
          );
        },
      );
    },
  );
}


  
}
