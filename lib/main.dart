import 'package:flutter/material.dart';
import 'package:internee/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:internee/homescreen.dart';
import 'package:internee/splashscreen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

    home:HomeScreen(),
    // SplashScreen(),

  ));
}