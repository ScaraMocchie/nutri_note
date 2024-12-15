import 'package:flutter/material.dart';
import 'package:nutri_note/controller/addFoods.dart';
import 'package:nutri_note/controller/dataUser_controller.dart';
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
  List<Food>? _filteredFoodList; // List untuk menyimpan hasil filter
  final TextEditingController _searchController = TextEditingController(); // Controller untuk search

  @override
  void initState() {
    super.initState();
    _futureFoodList = _databaseService.getFood();
    _searchController.addListener(_filterFoods); // Tambahkan listener untuk search input
  }

  @override
  void dispose() {
    _searchController.dispose(); // Pastikan controller dihapus
    super.dispose();
  }

  void _filterFoods() async {
    final searchQuery = _searchController.text.toLowerCase();
    if (searchQuery.isEmpty) {
      setState(() {
        _filteredFoodList = null; // Tampilkan semua jika pencarian kosong
      });
      return;
    }

    final allFoods = await _futureFoodList; // Ambil daftar makanan
    setState(() {
      _filteredFoodList = allFoods?.where((food) {
        return food.name.toLowerCase().contains(searchQuery);
      }).toList();
    });
  }

  void _refreshFoodList() {
    setState(() {
      _futureFoodList = _databaseService.getFood();
      _filteredFoodList = null; // Reset filter setelah refresh
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
                    SizedBox(height: 10),
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
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Search container
                    TextField(
                      controller: _searchController,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(left: 30),
                        hintText: "Search",
                        hintStyle: const TextStyle(height: 2),
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // List makanan
                    SizedBox(
                      height: height - 54 - 30 - 10 - 24 - 20 - 20 - 120, // Sesuaikan ukuran
                      child: _buildFoodList(width),
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              child: buttonBig(width - 40, "Simpan"),
              onTap: () {
                _databaseService.getFood();
                print(TotalAdd.totalCal);
                print(TotalAdd.totalCarb);
                print(TotalAdd.totalProtein);
                
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodList(double width) {
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

        final foodList = _filteredFoodList ?? snapshot.data!;

        return ListView.builder(
          itemCount: foodList.length,
          itemBuilder: (context, index) {
            final food = foodList[index];
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
