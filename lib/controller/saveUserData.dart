import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUserData({
  required String username,
  required String gender,
  required int age,
  required double berat,
  required int tinggi,
  required String intensitasOl,
  required String tujuan,
}) async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  sp.setString('username', username);
  sp.setString('gender', gender);
  sp.setInt('age', age);
  sp.setDouble('berat', berat);
  sp.setInt('tinggi', tinggi);
  sp.setString('intensitasOl', intensitasOl);
  sp.setString('tujuan', tujuan);
}
