import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillbridge_ecommerce_project/controllers/auth_controller_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>{

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final Color primaryColor = const Color(0xFF5AA5D4);

  InputDecoration inputStyle(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: GoogleFonts.montserrat(),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
    );
  }

  void login() async {
    if (_formKey.currentState!.validate()) {
      // TODO: call auth provider
      print("Login clicked");

        try {
          await ref.read(authControllerProvider.notifier)
              .signIn(emailController.text, passwordController.text);
        } catch (e) {
          print(e);
        }



  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECF3F4),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                /// TITLE
                Text(
                  "Welcome Back 👋",
                  style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                /// EMAIL
                TextFormField(
                  controller: emailController,
                  decoration: inputStyle("Email"),
                  validator: (value) =>
                  value!.isEmpty ? "Enter email" : null,
                ),

                const SizedBox(height: 15),

                /// PASSWORD
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: inputStyle("Password"),
                  validator: (value) =>
                  value!.isEmpty ? "Enter password" : null,
                ),

                const SizedBox(height: 25),

                /// LOGIN BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(
                      "Login",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                /// NAVIGATE TO REGISTER
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/register");
                  },
                  child: Text(
                    "Don't have an account? Register",
                    style: GoogleFonts.montserrat(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}