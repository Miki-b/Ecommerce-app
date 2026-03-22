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
    return MaterialApp(
      title:  "gebeya app",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFECF3F4),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50,),
              Image.asset("assets/images/splash.png"),
              SizedBox(height: 30,),
              Text("Get Your Products Now!", style: GoogleFonts.montserrat(
                fontSize: 32,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: (){
                      Navigator.pushNamed(context, '/mainScreen');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF5AA5d4),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 112,
                        vertical: 20,
                      ),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                      )
                  ),
                  child: Text("Get Started",style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),),)

            ],
          ),
        ),
      ),

    );
  }
}
