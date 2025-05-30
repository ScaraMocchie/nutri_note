import 'package:flutter/material.dart';
import 'package:nutri_note/controller/database_service.dart';
// import 'package:nutri_note/controller/database_service.dart';
import 'package:nutri_note/widget/big_button.dart';
import 'package:nutri_note/widget/text_type.dart';

class AddMakanan extends StatefulWidget {
  final VoidCallback onFoodAdded;
  const AddMakanan({super.key, required this.onFoodAdded});
  
  @override
  State<AddMakanan> createState() => _AddMakananState();
}

class _AddMakananState extends State<AddMakanan> {
  final DatabaseService _databaseService = DatabaseService.instance;
  // Variabel untuk menyimpan input pengguna
  String? addNamaMakanan;
  String? addJumlahMakanan;
  String? addKaloriMakanan;
  String? addKarboMakanan;
  String? addProteinMakanan;
  String? addLemakMakanan;

  // Pesan error
  String errormes = '';

  // Fungsi untuk memvalidasi input
  void checkAdd() {
    try {
      // Memastikan semua input angka dapat di-parse
      int.parse(addKaloriMakanan ?? '');
      int.parse(addJumlahMakanan ?? '');
      int.parse(addProteinMakanan ?? '');
      int.parse(addKarboMakanan ?? '');
      int.parse(addLemakMakanan ?? '');

      // Memastikan nama makanan tidak kosong
      if (addNamaMakanan != null && addNamaMakanan!.isNotEmpty) {
        _databaseService.addFoods(addNamaMakanan!, int.parse(addKaloriMakanan!), int.parse(addJumlahMakanan!), int.parse(addKarboMakanan!), int.parse(addProteinMakanan!), int.parse(addLemakMakanan!));

        setState(() {
          addNamaMakanan = null;
          addJumlahMakanan = null;
          addKaloriMakanan = null;
          addKarboMakanan = null;
          addProteinMakanan = null;
          addLemakMakanan = null;
        });
        widget.onFoodAdded();
        Navigator.pop(context);

      } else {
        setState(() {
          errormes = 'Nama makanan tidak boleh kosong.';
        });
      }
    } catch (e) {
      setState(() {
        errormes = 'Mohon masukkan bilangan bulat.';
      });
    }
  }

  // Fungsi untuk membuat TextField dengan binding
  Widget buildTextField(String label, String? initialValue, Function(String) onChanged, TextInputType inputType) {
    return TextField(
      keyboardType: inputType,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffFF9156), width: 2),
        ),
        hintText: label,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTextField('Nama Makanan', addNamaMakanan, (value) {
            setState(() {
              addNamaMakanan = value;
            });
          }, TextInputType.text),
          SizedBox(height: 10),
          buildTextField('Jumlah (g)', addJumlahMakanan, (value) {
            setState(() {
              addJumlahMakanan = value;
            });
          }, TextInputType.number),
          SizedBox(height: 10),
          buildTextField('Kalori (kcal)', addKaloriMakanan, (value) {
            setState(() {
              addKaloriMakanan = value;
            });
          }, TextInputType.number),
          SizedBox(height: 10),
          buildTextField('Karbohidrat (g)', addKarboMakanan, (value) {
            setState(() {
              addKarboMakanan = value;
            });
          }, TextInputType.number),
          SizedBox(height: 10),
          buildTextField('Protein (g)', addProteinMakanan, (value) {
            setState(() {
              addProteinMakanan = value;
            });
          }, TextInputType.number),
          SizedBox(height: 10),
          buildTextField('Lemak (g)', addLemakMakanan, (value) {
            setState(() {
              addLemakMakanan = value;
            });
          }, TextInputType.number),
          SizedBox(height: 10),
          TextType.error(text: errormes),
          SizedBox(height: 20),
          InkWell(
            child: buttonBig(width, "Simpan"),
            onTap: checkAdd,
          ),
        ],
      ),
    );
  }
}
