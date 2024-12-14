int waterIntakeCounter(String gender, int age) {
  if (age < 0) {
    throw ArgumentError("Usia tidak boleh negatif");
  }

  // Bayi (0-12 bulan)
  if (age < 1) {
    // Untuk bayi, menggunakan ASI atau susu formula
    return 0; // Tidak memerlukan air putih tambahan
  } 
  
  // Anak-anak (1-3 tahun)
  if (age <= 3) {
    return 1000; // 800-1.000 ml per hari
  } 
  
  // Anak-anak (4-8 tahun)
  if (age <= 8) {
    return 1400; // 1.200-1.600 ml per hari
  }

  // Remaja (9-13 tahun)
  if (age <= 13) {
    if (gender.toLowerCase() == "male") {
      return 2200; // 2.000-2.400 ml per hari untuk laki-laki
    } else if (gender.toLowerCase() == "female") {
      return 1800; // 1.600-2.000 ml per hari untuk perempuan
    }
  }

  // Remaja (14-18 tahun)
  if (age <= 18) {
    if (gender.toLowerCase() == "male") {
      return 2700; // 2.200-3.200 ml per hari untuk laki-laki
    } else if (gender.toLowerCase() == "female") {
      return 2000; // 1.800-2.200 ml per hari untuk perempuan
    }
  }

  // Dewasa (19 tahun ke atas)
  if (gender.toLowerCase() == "male") {
    return 2500; // Sekitar 2-3 liter per hari untuk laki-laki dewasa
  } else if (gender.toLowerCase() == "female") {
    return 2000; // Sekitar 2-3 liter per hari untuk perempuan dewasa
  }

  // Jika gender tidak valid
  throw ArgumentError("Gender tidak valid: gunakan 'male' atau 'female'");
}