int proteinCounter(String gender, int age) {
  if (age < 0) {
    throw ArgumentError("Usia tidak boleh negatif");
  }

  // Bayi dan anak-anak
  if (age < 1) {
    return 9; // 0–5 bulan
  } else if (age == 1) {
    return 15; // 6–11 bulan
  } else if (age <= 3) {
    return 20; // 1–3 tahun
  } else if (age <= 6) {
    return 25; // 4–6 tahun
  } else if (age <= 9) {
    return 40; // 7–9 tahun
  }

  // Dewasa dan remaja
  if (gender.toLowerCase() == "male") {
    if (age <= 12) {
      return 50; // 10–12 tahun
    } else if (age <= 15) {
      return 70; // 13–15 tahun
    } else if (age <= 18) {
      return 75; // 16–18 tahun
    } else if (age <= 64) {
      return 65; // 19–64 tahun
    } else {
      return 64; // 65 tahun ke atas
    }
  } else if (gender.toLowerCase() == "female") {
    if (age <= 12) {
      return 55; // 10–12 tahun
    } else if (age <= 18) {
      return 65; // 13–18 tahun
    } else if (age <= 64) {
      return 60; // 19–64 tahun
    } else {
      return 58; // 65 tahun ke atas
    }
  } else {
    throw ArgumentError("Gender tidak valid: gunakan 'male' atau 'female'");
  }
}
