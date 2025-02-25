import 'package:flutter/material.dart';
import '../customtext/custom_text.dart';
import '../customtext/custom_button.dart'; // 🔹 Import tombol custom

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: "Masukkan Email",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            const TextField(),
            const SizedBox(height: 20),
            const CustomText(
              text: "Masukkan Password",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            const TextField(obscureText: true),
            const SizedBox(height: 20),

            // 🔹 Gunakan CustomButton di sini
            CustomButton(
              text: "Login",
              onPressed: () {
                print("Login button pressed");
              },
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
