import 'package:shared_preferences/shared_preferences.dart';

class DataUser {
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

  static String? analisisOl;
  static String? analisisCal;
  static String? analisisCarb;
  static String? analisisProtein;
  static String? analisisFat;
  static String? analisisWater;
  
  static void updateTakenFoods() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    calToday = sp.getInt('calToday')!;
    carbToday = sp.getInt('carbToday')!;
    proteinToday = sp.getInt('proteinToday')!;
    fatToday = sp.getInt('fatToday')!;
 
  }

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

    analisisOl = sp.getString('analisisOl') ?? '';
    analisisCal = sp.getString('analisisCal') ?? 'Data belum tersedia, silahkan login kembali besok untuk melihat analisis singkat.';
    analisisCarb = sp.getString('analisisCarb') ?? 'Data belum tersedia, silahkan login kembali besok untuk melihat analisis singkat.';
    analisisProtein = sp.getString('analisisProtein') ?? 'Data belum tersedia, silahkan login kembali besok untuk melihat analisis singkat.';
    analisisFat = sp.getString('analisisFat') ?? 'Data belum tersedia, silahkan login kembali besok untuk melihat analisis singkat.';
    analisisWater = sp.getString('analisisWater') ?? 'Data belum tersedia, silahkan login kembali besok untuk melihat analisis singkat.';

    // Opsional: tambahkan last login date jika disimpan
    lastLoginDate = sp.getString('lastLoginDate');
  }
  
}