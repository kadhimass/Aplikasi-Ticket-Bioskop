// lib/screens/login_screen.dart

import 'package:flutter/material.dart';
import '../utils/colors.dart'; 
import 'register_screen.dart';
import 'home_screen.dart'; // <<< WAJIB DIIMPOR UNTUK NAVIGASI KE HOME

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            // Membuat Kotak/Card di Tengah
            width: size.width * 0.9, 
            constraints: const BoxConstraints(maxWidth: 400), 
            padding: const EdgeInsets.all(25.0),
            decoration: BoxDecoration(
              color: kInputFillColor, 
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, 
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Log In',
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                // 1. Input Username
                const TextField(
                  style: TextStyle(color: kTextColor),
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person, color: kTextSecondary),
                  ),
                ),
                const SizedBox(height: 15),

                // 2. Input Password
                TextField(
                  obscureText: !_showPassword,
                  style: const TextStyle(color: kTextColor),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock, color: kTextSecondary),
                    suffixIcon: TextButton(
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      child: Text(_showPassword ? 'Hide' : 'Show'),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // 3. Remember me & Forgot Password
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (bool? value) {
                            setState(() {
                              _rememberMe = value ?? false;
                            });
                          },
                          activeColor: Theme.of(context).primaryColor,
                          checkColor: kTextColor,
                        ),
                        const Text('Remember me', style: TextStyle(color: kTextSecondary)),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Forgot Password?'),
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                // 4. Tombol Log In DENGAN NAVIGASI KE HOME SCREEN
                ElevatedButton(
                  onPressed: () {
                    // <<< NAVIGASI PENTING DI SINI >>>
                    // Mengganti halaman Login dengan HomeScreen agar pengguna tidak bisa 'back'
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                    // ---------------------------------
                  },
                  child: const Text('Log In'),
                ),
                
                const SizedBox(height: 20),

                // 5. Navigasi ke Sign Up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?", style: TextStyle(color: kTextSecondary)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen()));
                      },
                      child: const Text('Sign up'), 
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}