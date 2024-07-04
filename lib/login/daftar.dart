import 'package:finanzapp_final/auth/authentication.dart';
import 'package:finanzapp_final/beranda/halaman_depan.dart';
import 'package:finanzapp_final/login/file_text.dart';
import 'package:finanzapp_final/login/login.dart';
import 'package:finanzapp_final/login/masuk.dart';
import 'package:finanzapp_final/pesan/pesan.dart';
import 'package:flutter/material.dart';

class DaftarAkun extends StatefulWidget {
  const DaftarAkun({super.key});

  @override
  State<DaftarAkun> createState() => _DaftarAkunState();
}

class _DaftarAkunState extends State<DaftarAkun> {
  // Kontrol Login Firebase
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  bool isLoading = false;

  void DaftarAkun() async {
    String res = await AuthService().DaftarUser(
      email: emailController.text,
      password: passwordController.text,
      nama: namaController.text,
    );
    // pesan untuk kesalahan
    if (res == "success") {
      setState(() {
        isLoading = true;
      });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context)=>const HalamanDepan()
        )
      );
    } else {
      setState(() {
        isLoading = false;
      });
      // Melihat Pesan Kesalahan
      showPesan(context, res);
    }
  }

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
                height: 250,
                child: Image.asset("gambar/daftar.jpg"),
              ),
              // file text Email Password
              FileTextInput(
                textEditingController: namaController,
                hintText: "Masukkan Nama",
                icon: Icons.person,
              ),
              FileTextInput(
                textEditingController: emailController,
                hintText: "Masukkan Email",
                icon: Icons.email,
              ),
              FileTextInput(
                textEditingController: passwordController,
                hintText: "Masukkan Password",
                icon: Icons.lock,
              ),
              // Masuk ke file masuk.dart
              MasukHalaman(
                onTab: DaftarAkun,
                text:"Daftar",
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Sudah Punya Akun ? ", style: TextStyle(fontSize: 16),),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context)=> const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Masuk", 
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}