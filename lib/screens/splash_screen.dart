// lib/screens/splash_screen.dart

import 'package:flutter/material.dart';
import 'dart:async';
import 'login_screen.dart'; 
// !!! WAJIB IMPORT PACKAGE BARU INI !!!
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut, 
    );

    _fadeController.forward();

    // Timer untuk navigasi ke halaman Login setelah ~3 detik
    Timer(const Duration(milliseconds: 3000), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // --- LOGO/IKON APLIKASI (Tema Film/Bioskop) ---
              Icon(
                Icons.theaters_rounded, 
                size: 100,
                color: Theme.of(context).primaryColor, 
              ),
              const SizedBox(height: 20),
              // --- NAMA APLIKASI ---
              const Text(
                'CinemaGo', 
                style: TextStyle(
                  color: Color(0xFFE94560), // Menggunakan kAccentColor secara langsung
                  fontSize: 38,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2.5,
                )
              ),
              const SizedBox(height: 10),
              // --- SLOGAN BARU ---
              const Text(
                'Tiket Bioskop di Ujung Jari Anda',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                )
              ),
              const SizedBox(height: 50),
              
              // --- INDIKATOR LOADING DOTS TRIANGLE BARU ---
              AnimatedBuilder(
                animation: _fadeAnimation,
                builder: (context, child) {
                  // Munculkan loading setelah animasi fade in mencapai setidaknya 70%
                  if (_fadeAnimation.value > 0.7) { 
                    return LoadingAnimationWidget.dotsTriangle(
                      color: Theme.of(context).primaryColor, // Warna aksen
                      size: 50, // Ukuran loading indicator
                    );
                  }
                  return const SizedBox.shrink(); 
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}