String analyzeWaterIntake(int waterTarget, int waterToday) {
  // Hitung persentase dari target
  double percentage = (waterToday / waterTarget) * 100;

  // Hasil analisis berdasarkan persentase
  if (percentage < 90) {
    return "Konsumsi air Anda kurang dari target harian. Disarankan untuk meningkatkan asupan air untuk menjaga hidrasi tubuh.";
  } else if (percentage >= 90 && percentage <= 110) {
    return "Konsumsi air Anda sesuai dengan target harian. Bagus! Anda berhasil memenuhi kebutuhan hidrasi tubuh.";
  } else if (percentage > 110 && percentage <= 150) {
    return "Konsumsi air Anda melebihi target harian. Tidak masalah, tetapi perhatikan agar tidak berlebihan.";
  } else {
    return "Konsumsi air Anda sangat berlebihan. Konsumsi air yang terlalu banyak dapat memberikan tekanan pada tubuh. Kurangi untuk menjaga keseimbangan.";
  }
}
