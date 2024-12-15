import 'package:flutter/material.dart';

class TextType {
  TextType(String nama);

  // Text putih, ukuran 24, semi-bold
  static Widget pageTitle({
    required String text,
  }) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w600, // Semi-bold
      ),
    );
  }

  // Text hitam, ukuran 16, regular
  static Widget pageSubtitle({
    required String text,
  }) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400, // Regular
      ),
    );
  }

  static Widget pageSubtitleSemiBold({
    required String text,
  }) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600, // Regular
      ),
    );
  }

  static Widget subtitleSemiBoldBlack({
    required String text,
  }) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w600, 
      ),
    );
  }

  static Widget regular({
    required String text,
  }) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w400, // Regular
      ),
    );
  }

  static Widget error({
    required String text,
  }) {
    return Text(
      text,
      style: const TextStyle(
        color: Color.fromARGB(255, 201, 13, 0),
        fontSize: 14,
        fontWeight: FontWeight.w400, // Regular
      ),
    );
  }

  static Widget regularUp({
    required String text,
  }) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400, // Regular
      ),
    );
  }

  static Widget bigContent({
    textAlign = TextAlign.center,
    required String text,
  }){
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600, 
      ),
      textAlign: textAlign,
    );
  }

  static Widget buttonText({
    required String text,
  }){
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.white
      ),
    );
  }

  static Widget bigTextAir({
    required String text,
  }){
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }



  // Tambahkan tipe teks lain sesuai kebutuhan
}
