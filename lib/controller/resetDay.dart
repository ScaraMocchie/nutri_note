import 'package:nutri_note/controller/analysist_nutrient.dart';
import 'package:nutri_note/controller/dataUser_controller.dart';
import 'package:nutri_note/controller/getDate_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

void resetDay()async{
  List<String> _analisis = analyzeDailyIntake(totalCalories: DataUser.calToday, totalCarbs: DataUser.carbToday, totalProtein: DataUser.proteinToday, totalFat: DataUser.fatToday, targetCalories: DataUser.calLimit!, targetCarbs: DataUser.carbLimit!, targetProtein: DataUser.proteinLimit!, targetFat: DataUser.calLimit!, exerciseIntensity: DataUser.intensitasOl!);
  SharedPreferences sp = await SharedPreferences.getInstance();

  await sp.setInt('calToday', 0);
  await sp.setInt('carbToday', 0);
  await sp.setInt('proteinToday', 0);
  await sp.setInt('fatToday', 0);
  await sp.setInt('waterToday', 0);

  sp.setString('analisisOl',_analisis[4]);
  sp.setString('analisisCal',_analisis[0]);
  sp.setString('analisisCarb',_analisis[1]);
  sp.setString('analisisProtein',_analisis[2]);
  sp.setString('analisisFat',_analisis[3]);

  await sp.setString('lastLoginDate', getDate());
  print('NEW DAY');


}