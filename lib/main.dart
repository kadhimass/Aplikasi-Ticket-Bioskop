// lib/main.dart

import 'package:flutter/material.dart';
// Impor semua file kustom dari struktur proyek Anda
import 'screens/splash_screen.dart'; 
import 'utils/theme.dart'; 

void main() {
  // Pastikan Anda telah menjalankan 'flutter pub get' setelah menambahkan package.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CinemaGo App', // Mengganti judul sesuai tema bioskop
      
      // Terapkan tema gelap kustom dari file utils/theme.dart
      theme: appDarkTheme,
      
      // Halaman pertama yang muncul saat aplikasi dibuka
      // Splash Screen akan otomatis menavigasi ke LoginScreen
      home: const SplashScreen(), 
    );
  }
}