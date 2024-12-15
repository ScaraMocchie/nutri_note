List<String> analyzeDailyIntake({
  required int totalCalories,
  required int totalCarbs,
  required int totalProtein,
  required int totalFat,
  required int targetCalories,
  required int targetCarbs,
  required int targetProtein,
  required int targetFat,
  required String exerciseIntensity,
}) {
  // Helper function to analyze one nutrient
  String analyzeNutrient(String nutrientName, int total, int target) {
    double percentage = total / target * 100;
    if (percentage < 90) {
      return "$nutrientName Anda kurang (${total} dari ${target}). Tambahkan asupan yang sesuai.";
    } else if (percentage <= 110) {
      return "$nutrientName Anda sesuai target (${total} dari ${target}). Pertahankan!";
    } else if (percentage <= 150) {
      return "$nutrientName Anda berlebih (${total} dari ${target}). Kurangi asupan untuk menjaga keseimbangan.";
    } else {
      return "$nutrientName Anda sangat berlebih (${total} dari ${target}). Perhatikan untuk tidak melebihi kebutuhan.";
    }
  }

  // Create analysis for each nutrient
  List<String> analysis = [
    analyzeNutrient("Kalori", totalCalories, targetCalories),
    analyzeNutrient("Karbohidrat", totalCarbs, targetCarbs),
    analyzeNutrient("Protein", totalProtein, targetProtein),
    analyzeNutrient("Lemak", totalFat, targetFat),
  ];

  // Add analysis based on exercise intensity
  if (exerciseIntensity == "Tidak Pernah") {
    analysis.add("Anda jarang berolahraga. Pertimbangkan untuk menambah aktivitas fisik ringan untuk menjaga kesehatan.");
  } else if (exerciseIntensity == "Jarang (1-3 hari dalam seminggu)") {
    analysis.add("Olahraga Anda sudah baik, tetapi bisa ditingkatkan untuk hasil lebih optimal.");
  } else if (exerciseIntensity == "Sering (3-5 hari dalam seminggu)") {
    analysis.add("Olahraga Anda cukup teratur. Pastikan asupan nutrisi mendukung aktivitas Anda.");
  } else if (exerciseIntensity == "Sangat Sering (hampir setiap hari)") {
    analysis.add("Anda sangat aktif berolahraga. Pastikan asupan nutrisi mencukupi untuk mendukung aktivitas intensif Anda.");
  }

  return analysis;
}
