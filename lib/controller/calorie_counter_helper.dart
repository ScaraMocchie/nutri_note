int countCal(int umur, int berat, int tinggi, String tujuan, String intensitas, String gender){
  List<String> intensitasItems = [
    "Tidak Pernah",
    "Jarang (1-3 hari dalam seminggu)",
    "Sering (3-5 hari dalam seminggu)",
    "Sangat Sering (hampir setiap hari)"
  ];

  List<String> tujuanItems = [
    "Menaikkan Berat Badan",
    "Menjaga Berat Badan",
    "Menurunkan Berat Badan"
  ];
  int indexIntensitas = intensitasItems.indexOf(intensitas);
  int indexTujuan = tujuanItems.indexOf(tujuan);
  int valueTujuan = 0;
  double valueIntensitas = 0;

  if(indexIntensitas==0){
    valueIntensitas = 1.2;
  }else if((indexIntensitas==1)){
    valueIntensitas = 1.375;
  }else if(indexIntensitas==2){
    valueIntensitas = 1.55;
  }else if(indexIntensitas==3){
    valueIntensitas=1.725;
  }

  if(indexTujuan==0){
    valueTujuan = 500;
  }else if(indexTujuan==2){
    valueTujuan = (-300);
  }

  double bmr = 0;

  if(gender == 'female'){
    bmr = 447.593 + (9.247*berat) + (3.098*tinggi - (4.330 *umur));
    bmr = valueIntensitas*bmr;
    bmr = bmr + valueTujuan;

  } else{
    bmr = 88.362 + (13.397 * berat) + (4.799 *tinggi) - (5.677 * umur);
    bmr = valueIntensitas*bmr;
    bmr = bmr + valueTujuan;
  }

  return bmr.toInt();
}