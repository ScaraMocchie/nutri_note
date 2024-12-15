import 'package:nutri_note/controller/getDate_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

void resetDay()async{
  SharedPreferences sp = await SharedPreferences.getInstance();

  await sp.setInt('calToday', 0);
  await sp.setInt('carbToday', 0);
  await sp.setInt('proteinToday', 0);
  await sp.setInt('fatToday', 0);
  await sp.setInt('waterToday', 0);

  await sp.setString('lastLoginDate', getDate());
  print('NEW DAY');


}