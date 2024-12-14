

import 'package:shared_preferences/shared_preferences.dart';

class DataUser{
  static String? username;
  static String? gender;
  static String? lastLoginDate;
  static int? age;
  static int? berat;
  static int? tinggi;
  static String? tujuan;
  static String? intensitasOl;
  
  static int calToday = 0;
  static int carbToday = 0;
  static int proteinToday = 0;
  static int fatToday = 0;

  static int? calLimit;
  static int? carbLimit;
  static int? proteinLimit;
  static int? fatLimit;

  static int waterToday = 0;
  static int? waterLimit;

  static void updateData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    
    // Update profil pengguna
    username = sp.getString('username');
    gender = sp.getString('gender');
    age = sp.getInt('age');
    berat = sp.getInt('berat');
    tinggi = sp.getInt('tinggi');
    tujuan = sp.getString('tujuan');
    intensitasOl = sp.getString('intensitasOl');

    // Update batas harian
    calLimit = sp.getInt('calLimit');
    carbLimit = sp.getInt('carbLimit');
    fatLimit = sp.getInt('fatLimit');
    proteinLimit = sp.getInt('proteinLimit');
    waterLimit = sp.getInt('waterLimit');

    // Catatan: untuk konsumsi harian, Anda mungkin ingin menambahkan logika 
    // untuk mereset atau meneruskan nilai jika diperlukan
    calToday = sp.getInt('calToday') ?? 0;
    carbToday = sp.getInt('carbToday') ?? 0;
    proteinToday = sp.getInt('proteinToday') ?? 0;
    fatToday = sp.getInt('fatToday') ?? 0;
    waterToday = sp.getInt('waterToday') ?? 0;

    // Opsional: tambahkan last login date jika disimpan
    lastLoginDate = sp.getString('lastLoginDate');
  }
  
}