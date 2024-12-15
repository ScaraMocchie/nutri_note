import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveNutrients(List<int> listCal, List<int> listCarb, List<int> listProtein, List<int> listFat) async {
  final sp = await SharedPreferences.getInstance();
  sp.setString('listCal', jsonEncode(listCal));
  sp.setString('listCarb', jsonEncode(listCarb));
  sp.setString('listProtein', jsonEncode(listProtein));
  sp.setString('listFat', jsonEncode(listFat));
}