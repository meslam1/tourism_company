import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_company/login_screen.dart';
import 'package:tourism_company/sign_up.dart';
import 'package:tourism_company/splash_screen.dart';


bool show = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('Groupawy') ?? true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Groupawy',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const SplashScreen()
    );
  }
}