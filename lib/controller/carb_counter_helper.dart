int carbCounter(String gender, int age) {
  if (age < 0) {
    throw ArgumentError("Usia tidak boleh negatif");
  }

  // Bayi dan anak-anak
  if (age <= 0) {
    return 59; // 0–5 bulan
  } else if (age == 1) {
    return 105; // 6–11 bulan
  } else if (age <= 3) {
    return 215; // 1–3 tahun
  } else if (age <= 6) {
    return 220; // 4–6 tahun
  } else if (age <= 9) {
    return 250; // 7–9 tahun
  }

  // Dewasa dan remaja
  if (gender.toLowerCase() == "male") {
    if (age <= 12) {
      return 300; // 10–12 tahun
    } else if (age <= 15) {
      return 350; // 13–15 tahun
    } else if (age <= 18) {
      return 400; // 16–18 tahun
    } else if (age <= 29) {
      return 430; // 19–29 tahun
    } else if (age <= 49) {
      return 415; // 30–49 tahun
    } else if (age <= 64) {
      return 340; // 50–64 tahun
    } else if (age <= 80) {
      return 275; // 65–80 tahun
    } else {
      return 235; // Di atas 80 tahun
    }
  } else if (gender.toLowerCase() == "female") {
    if (age <= 12) {
      return 280; // 10–12 tahun
    } else if (age <= 18) {
      return 300; // 13–18 tahun
    } else if (age <= 29) {
      return 360; // 19–29 tahun
    } else if (age <= 49) {
      return 340; // 30–49 tahun
    } else if (age <= 64) {
      return 280; // 50–64 tahun
    } else if (age <= 80) {
      return 230; // 65–80 tahun
    } else {
      return 200; // Di atas 80 tahun
    }
  } else {
    throw ArgumentError("Gender tidak valid: gunakan 'male' atau 'female'");
  }
}
