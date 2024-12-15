import 'package:nutri_note/controller/dataUser_controller.dart';
import 'package:nutri_note/controller/totalAdd_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

void addFoods() async{
  int newCalToday = TotalAdd.totalCal + DataUser.calToday;
  int newCarbToday = TotalAdd.totalCarb + DataUser.carbToday;
  int newProteinToday = TotalAdd.totalProtein + DataUser.proteinToday;
  int newFatToday = TotalAdd.totalFat + DataUser.fatToday;


  SharedPreferences sp = await SharedPreferences.getInstance();

  sp.setInt('calToday', newCalToday);
  sp.setInt('carbToday', newCarbToday);
  sp.setInt('proteinToday', newProteinToday);
  sp.setInt('fatToday', newFatToday);

  TotalAdd.totalCal = 0;
  TotalAdd.totalCarb = 0;
  TotalAdd.totalProtein = 0;
  TotalAdd.totalFat = 0;

  
}