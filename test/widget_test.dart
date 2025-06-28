// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:nutri_note/controller/analysist_minum.dart';
import 'package:nutri_note/controller/bmi.dart'; 
import 'package:nutri_note/controller/analysist_nutrient.dart';
import 'package:nutri_note/controller/calorie_counter_helper.dart'; 
import 'package:nutri_note/controller/carb_counter_helper.dart';
import 'package:nutri_note/controller/fat_counter_helper.dart';
import 'package:nutri_note/controller/protein_counter_helper.dart';
import 'package:nutri_note/controller/water_counter_helper.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nutri_note/main.dart';

void main() {
  group('analyzeWaterIntake', () {
    test('Konsumsi < 90%', () {
      expect(
        analyzeWaterIntake(2000, 1500),
        contains("kurang dari target harian"),
      );
    });

    test('Konsumsi 90%-110%', () {
      expect(
        analyzeWaterIntake(2000, 2000),
        contains("sesuai dengan target harian"),
      );
    });

    test('Konsumsi 111%-150%', () {
      expect(
        analyzeWaterIntake(2000, 2300),
        contains("melebihi target harian"),
      );
    });

    test('Konsumsi > 150%', () {
      expect(
        analyzeWaterIntake(2000, 3100),
        contains("sangat berlebihan"),
      );
    });
  });

  group('calculateBMI & getBMICategory', () {
    test('Normal', () {
      final bmi = calculateBMI(60, 165); // 22.0
      expect(bmi, closeTo(22.0, 0.1));
      expect(getBMICategory(bmi), 'Berat Badan Normal');
    });

    test('Obesitas', () {
      final bmi = calculateBMI(90, 160); // 35.2
      expect(getBMICategory(bmi), 'Obesitas');
    });
  });

  group('analyzeDailyIntake', () {
    test('Analisis lengkap + olahraga jarang', () {
      final result = analyzeDailyIntake(
        totalCalories: 1800,
        totalCarbs: 250,
        totalProtein: 60,
        totalFat: 70,
        targetCalories: 2000,
        targetCarbs: 250,
        targetProtein: 60,
        targetFat: 70,
        exerciseIntensity: "Jarang (1-3 hari dalam seminggu)",
      );
      expect(result.length, 5); // 4 nutrisi + 1 olahraga
      expect(result.last, contains("bisa ditingkatkan"));
    });
  });

  group('countCal', () {
    test('Pria, usia 25, ingin menurunkan berat', () {
      final result = countCal(25, 70, 170, 'Menurunkan Berat Badan',
          'Sering (3-5 hari dalam seminggu)', 'male');
      expect(result, isA<int>());
      expect(result, greaterThan(0));
    });

    test('Wanita, usia 30, ingin menaikkan berat', () {
      final result = countCal(30, 60, 160, 'Menaikkan Berat Badan',
          'Jarang (1-3 hari dalam seminggu)', 'female');
      expect(result, isA<int>());
    });
  });

  group('carbCounter', () {
    test('Laki-laki 25 tahun', () {
      expect(carbCounter("male", 25), equals(430));
    });

    test('Perempuan 70 tahun', () {
      expect(carbCounter("female", 70), equals(230));
    });

    test('Usia negatif', () {
      expect(() => carbCounter("male", -1), throwsArgumentError);
    });
  });

  group('fatCounter', () {
    test('Pria 20 tahun', () {
      expect(fatCounter("male", 20), equals(75));
    });

    test('Perempuan 65 tahun', () {
      expect(fatCounter("female", 65), equals(45));
    });

    test('Usia tidak valid', () {
      expect(() => fatCounter("male", 0), throwsArgumentError);
    });
  });

  group('proteinCounter', () {
    test('Perempuan 30 tahun', () {
      expect(proteinCounter("female", 30), equals(60));
    });

    test('Laki-laki 10 tahun', () {
      expect(proteinCounter("male", 10), equals(50));
    });

    test('Usia negatif', () {
      expect(() => proteinCounter("male", -1), throwsArgumentError);
    });
  });

  group('waterIntakeCounter', () {
    test('Laki-laki dewasa', () {
      expect(waterIntakeCounter("male", 25), equals(2500));
    });

    test('Perempuan anak-anak', () {
      expect(waterIntakeCounter("female", 3), equals(1000));
    });

    test('Usia negatif', () {
      expect(() => waterIntakeCounter("male", -1), throwsArgumentError);
    });
  });
}