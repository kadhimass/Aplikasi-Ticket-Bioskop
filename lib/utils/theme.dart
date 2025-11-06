import 'package:flutter/material.dart';
import 'colors.dart'; // Pastikan file colors.dart sudah ada

final ThemeData appDarkTheme = ThemeData(
  brightness: Brightness.dark, // Brightness dari ThemeData
  scaffoldBackgroundColor: kPrimaryDark,
  primaryColor: kAccentColor,

  // BAGIAN INI YANG HARUS DIKOREKSI:
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(
    primary: kAccentColor,
    secondary: kAccentColor,
    background: kPrimaryDark,
    brightness: Brightness.dark, // <-- HARUS SAMA dengan ThemeData.brightness
  ),

  // Gaya Teks Input Field
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: kInputFillColor,
    labelStyle: TextStyle(color: kTextSecondary),
    hintStyle: TextStyle(color: kTextSecondary),
    contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(color: kAccentColor, width: 2.0),
    ),
  ),

  // Gaya Tombol Utama
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kAccentColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      textStyle: const TextStyle(fontSize: 18, color: kTextColor),
      foregroundColor: kTextColor,
      minimumSize: const Size(double.infinity, 50),
    ),
  ),

  // Gaya TextButton
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: kAccentColor,
      padding: EdgeInsets.zero,
    ),
  ),
);
