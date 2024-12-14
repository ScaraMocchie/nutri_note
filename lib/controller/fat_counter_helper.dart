int fatCounter(String gender, int age) {
  if (age <= 0) {
    throw ArgumentError("Usia harus lebih besar dari nol");
  }

  int fat = 0;

  // Kategori Anak-Anak
  if (age >= 1 && age <= 6) {
    fat = 45; // Rentang 45-50 gram, ambil nilai minimum
  } 
  // Kategori Remaja
  else if (age >= 13 && age <= 18) {
    if (gender.toLowerCase() == "male") {
      fat = 80; // Rentang 80-85 gram, ambil nilai minimum
    } else if (gender.toLowerCase() == "female") {
      fat = 70;
    } else {
      throw ArgumentError("Gender tidak valid: gunakan 'male' atau 'female'");
    }
  } 
  // Kategori Dewasa
  else if (age >= 19 && age <= 49) {
    if (gender.toLowerCase() == "male") {
      fat = age <= 29 ? 75 : 70; // 75 gram untuk usia 19-29, 70 gram untuk 30-49
    } else if (gender.toLowerCase() == "female") {
      fat = age <= 29 ? 65 : 60; // 65 gram untuk usia 19-29, 60 gram untuk 30-49
    } else {
      throw ArgumentError("Gender tidak valid: gunakan 'male' atau 'female'");
    }
  } 
  // Kategori Lansia
  else if (age >= 50 && age <= 80) {
    if (gender.toLowerCase() == "male") {
      fat = age <= 64 ? 60 : 50; // 60 gram untuk usia 50-64, 50 gram untuk 65-80
    } else if (gender.toLowerCase() == "female") {
      fat = age <= 64 ? 50 : 45; // 50 gram untuk usia 50-64, 45 gram untuk 65-80
    } else {
      throw ArgumentError("Gender tidak valid: gunakan 'male' atau 'female'");
    }
  } else {
    throw ArgumentError("Tidak ada data kebutuhan lemak untuk usia di luar rentang yang diberikan");
  }

  return fat;
}
