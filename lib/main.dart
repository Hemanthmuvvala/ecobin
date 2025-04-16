//import 'package:demoapp/Image-Wid.dart';
//import 'package:demoapp/Image_Wid.dart';
//import 'package:demoapp/const/image_picker_bytes.dart';
import 'package:flutter/material.dart';
import 'package:new_pro/screens/homescreen.dart';
import 'package:new_pro/screens/loginscreen.dart';



void main() {
  runApp(EcoBinApp());
}

class EcoBinApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.green[50],
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 76, 175, 80),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 62, 165, 67),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.grey[800]),
        ),
      ),
      home: Loginscreen(),
    );
  }
}

class AppButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const AppButton({
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
      ),
    );
  }
}


