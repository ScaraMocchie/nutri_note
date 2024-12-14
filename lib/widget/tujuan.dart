import 'package:flutter/material.dart';

class DropDownTujuan extends StatefulWidget {
  final List<String> items; 
  final String? selectedValue; 
  final Function(String?) onChanged; 

  const DropDownTujuan({
    Key? key,
    required this.items,
    this.selectedValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<DropDownTujuan> createState() => _DropDownTujuanState();
}

class _DropDownTujuanState extends State<DropDownTujuan> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: widget.selectedValue,
      hint: Text("Tujuan"),
      items: widget.items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
