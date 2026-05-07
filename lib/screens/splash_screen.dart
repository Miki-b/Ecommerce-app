import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFECF3F4),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.1),

              /// Image
              Center(
                child: Image.asset(
                  "assets/images/splash.png",
                  height: height * 0.55,
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(height: height * 0.07),
              const Spacer(),
              /// Title
              Text(
                "Get Your Products Now!",
                style: GoogleFonts.montserrat(
                  fontSize: width * 0.07, // responsive font
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: height * 0.04),

               // pushes button to bottom

              /// Button
              SizedBox(
                width: double.infinity, // full width
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/mainScreen');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5AA5D4),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.025,
                    ),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Get Started",
                    style: GoogleFonts.montserrat(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}