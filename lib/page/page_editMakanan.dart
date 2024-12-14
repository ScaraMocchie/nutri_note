import 'package:flutter/material.dart';
import 'package:nutri_note/controller/database_service.dart';
import 'package:nutri_note/widget/big_button.dart';
import 'package:nutri_note/widget/text_type.dart';

class EditMakanan extends StatefulWidget {
  final int id; // Tambahkan ID makanan
  final String? initialNamaMakanan;
  final String? initialJumlahMakanan;
  final String? initialKaloriMakanan;
  final String? initialKarboMakanan;
  final String? initialProteinMakanan;
  final String? initialLemakMakanan;

  const EditMakanan({
    super.key,
    required this.id, // Tambahkan required untuk ID
    this.initialNamaMakanan,
    this.initialJumlahMakanan,
    this.initialKaloriMakanan,
    this.initialKarboMakanan,
    this.initialProteinMakanan,
    this.initialLemakMakanan,
  });

  @override
  State<EditMakanan> createState() => _EditMakananState();
}

class _EditMakananState extends State<EditMakanan> {
  late final TextEditingController namaMakananController;
  late final TextEditingController jumlahMakananController;
  late final TextEditingController kaloriMakananController;
  late final TextEditingController karboMakananController;
  late final TextEditingController proteinMakananController;
  late final TextEditingController lemakMakananController;

  String errormes = '';

  final DatabaseService _databaseService = DatabaseService.instance;

  @override
  void initState() {
    super.initState();
    namaMakananController = TextEditingController(text: widget.initialNamaMakanan);
    jumlahMakananController = TextEditingController(text: widget.initialJumlahMakanan);
    kaloriMakananController = TextEditingController(text: widget.initialKaloriMakanan);
    karboMakananController = TextEditingController(text: widget.initialKarboMakanan);
    proteinMakananController = TextEditingController(text: widget.initialProteinMakanan);
    lemakMakananController = TextEditingController(text: widget.initialLemakMakanan);
  }

  @override
  void dispose() {
    // Jangan lupa untuk membuang controller agar tidak terjadi kebocoran memori.
    namaMakananController.dispose();
    jumlahMakananController.dispose();
    kaloriMakananController.dispose();
    karboMakananController.dispose();
    proteinMakananController.dispose();
    lemakMakananController.dispose();
    super.dispose();
  }

  void checkEdit() {
  try {
    int.parse(kaloriMakananController.text);
    int.parse(jumlahMakananController.text);
    int.parse(proteinMakananController.text);
    int.parse(karboMakananController.text);
    int.parse(lemakMakananController.text);

    if (namaMakananController.text.isNotEmpty) {
      _databaseService.updateFood(
        widget.id,
        namaMakananController.text,
        int.parse(kaloriMakananController.text),
        int.parse(jumlahMakananController.text),
        int.parse(karboMakananController.text),
        int.parse(proteinMakananController.text),
        int.parse(lemakMakananController.text),
      );

      Navigator.pop(context, true); // Return true untuk menandai perubahan
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


  Widget buildTextField(String label, TextEditingController controller, TextInputType inputType) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
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
          buildTextField('Nama Makanan', namaMakananController, TextInputType.text),
          SizedBox(height: 10),
          buildTextField('Jumlah (g)', jumlahMakananController, TextInputType.number),
          SizedBox(height: 10),
          buildTextField('Kalori', kaloriMakananController, TextInputType.number),
          SizedBox(height: 10),
          buildTextField('Karbohidrat', karboMakananController, TextInputType.number),
          SizedBox(height: 10),
          buildTextField('Protein', proteinMakananController, TextInputType.number),
          SizedBox(height: 10),
          buildTextField('Lemak', lemakMakananController, TextInputType.number),
          SizedBox(height: 10),
          TextType.error(text: errormes),
          SizedBox(height: 20),
          InkWell(
            child: buttonBig(width, "Simpan"),
            onTap: checkEdit,
          ),
        ],
      ),
    );
  }
}

