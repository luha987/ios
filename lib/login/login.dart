import 'package:finanzapp_final/beranda/halaman_depan.dart';
import 'package:finanzapp_final/login/daftar.dart';
import 'package:finanzapp_final/login/file_text.dart';
import 'package:finanzapp_final/login/masuk.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _HalamanDaftar();
}

class _HalamanDaftar extends State<LoginScreen> {
  // Kontrol Login Firebase
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 300,
                child: Image.asset("gambar/login.png"),
              ),
              // file text Email Password
              FileTextInput(
                textEditingController: emailController,
                hintText: "Masukkan Email !!!",
                icon: Icons.email,
              ),
              FileTextInput(
                textEditingController: passwordController,
                hintText: "Masukkan Password",
                icon: Icons.lock,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Lupa Password",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              // Masuk ke file masuk.dart
              MasukHalaman(
                onTab: () {
                  Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context)=> const HalamanDepan(),
                        ),
                      );
                },
                text:"Masuk",
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Tidak Punya Akun ? ", style: TextStyle(fontSize: 16),),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context)=> const DaftarAkun(),
                        ),
                      );
                    },
                    child: const Text(
                      "Daftar", 
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}