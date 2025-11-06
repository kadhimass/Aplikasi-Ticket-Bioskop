// lib/screens/register_screen.dart

import 'package:flutter/material.dart';
// Sesuaikan dengan nama proyek Anda
import '../utils/colors.dart'; 

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _agreePolicy = false;
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    // Ukuran layar untuk menyesuaikan lebar kotak
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center( // Memusatkan seluruh konten
        child: SingleChildScrollView( // Memungkinkan scroll jika konten terlalu panjang
          padding: const EdgeInsets.all(30.0), // Padding di sekitar kotak
          child: Container(
            // Membuat Kotak/Card di Tengah
            width: size.width * 0.9, // Lebar kotak 90% dari lebar layar
            constraints: const BoxConstraints(maxWidth: 400), // Batas lebar maksimal
            padding: const EdgeInsets.all(25.0),
            decoration: BoxDecoration(
              color: kInputFillColor, // Warna latar belakang kotak
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
              mainAxisSize: MainAxisSize.min, // Agar kotak menyesuaikan kontennya
              crossAxisAlignment: CrossAxisAlignment.center, // Pusatkan judul
              children: <Widget>[
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                // 1. Input First Name & Last Name
                Row(
                  children: [
                    const Expanded(
                      child: TextField(
                          style: TextStyle(color: kTextColor),
                          decoration: InputDecoration(labelText: 'First Name')),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: TextField(
                          style: TextStyle(color: kTextColor),
                          decoration: InputDecoration(labelText: 'Last Name')),
                    ),
                  ],
                ),
                const SizedBox(height: 15), // Mengurangi jarak antar field

                // 2. Input Email
                const TextField(
                    style: TextStyle(color: kTextColor),
                    decoration: InputDecoration(labelText: 'Email')),
                const SizedBox(height: 15),

                // 3. Input Password
                TextField(
                  obscureText: !_showPassword,
                  style: const TextStyle(color: kTextColor),
                  decoration: InputDecoration(
                    labelText: 'Password',
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

                // 4. Input Confirm Password
                TextField(
                  obscureText: !_showConfirmPassword,
                  style: const TextStyle(color: kTextColor),
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    suffixIcon: TextButton(
                      onPressed: () {
                        setState(() {
                          _showConfirmPassword = !_showConfirmPassword;
                        });
                      },
                      child: Text(_showConfirmPassword ? 'Hide' : 'Show'),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // 5. Checkbox Agreement
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Checkbox(
                      value: _agreePolicy,
                      onChanged: (bool? value) {
                        setState(() {
                          _agreePolicy = value ?? false;
                        });
                      },
                      activeColor: Theme.of(context).primaryColor,
                      checkColor: kTextColor,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Text('I Agree with ', style: TextStyle(color: kTextSecondary)),
                            InkWell(
                                onTap: () {},
                                child: const Text('privacy', style: TextStyle(color: kAccentColor))),
                            const Text(' and ', style: TextStyle(color: kTextSecondary)),
                            InkWell(
                                onTap: () {},
                                child: const Text('policy', style: TextStyle(color: kAccentColor))),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                // 6. Tombol Sign up
                ElevatedButton(
                  onPressed: _agreePolicy
                      ? () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Registration successful!'))
                          );
                        }
                      : null, // Tombol nonaktif jika belum setuju
                  child: const Text('Sign up'),
                ),
                
                const SizedBox(height: 20), // Mengurangi jarak ke bawah

                // 7. Navigasi ke Sign in
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?", style: TextStyle(color: kTextSecondary)),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Kembali ke halaman Login
                      },
                      child: const Text('Sign in'),
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