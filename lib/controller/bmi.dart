double calculateBMI(int beratBadan, int tinggiBadan) {
  // Konversi tinggi badan ke meter
  double tinggiMeter = tinggiBadan / 100;
  
  // Hitung BMI dengan presisi double
  double bmi = beratBadan / (tinggiMeter * tinggiMeter);
  
  // Membulatkan ke 1 desimal
  return double.parse(bmi.toStringAsFixed(1));
}

String getBMICategory(double bmi) {
  if (bmi < 18) {
    return 'Kekurangan Berat Badan';
  } else if (bmi >= 18 && bmi < 25) {
    return 'Berat Badan Normal';
  } else if (bmi >= 25 && bmi < 30) {
    return 'Kelebihan Berat Badan';
  } else {
    return 'Obesitas';
  }
}
