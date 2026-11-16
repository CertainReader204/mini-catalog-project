import 'package:flutter/material.dart';
import 'package:software_persona_mobile/views/login_screen.dart';

// Bu dosya uygulamayı başlatır ve giriş ekranını ilk sayfa olarak açar.

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)), 
      home: const LoginScreen(),
    );
  }
}
 // Not yazararak neyin ne olduğunu açıklamayı unutma.