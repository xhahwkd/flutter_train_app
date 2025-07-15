import 'package:flutter/material.dart';
import 'home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // 모든 Scaffold의 배경색
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white, // 모든 AppBar의 배경색
          foregroundColor: Colors.black, // AppBar의 텍스트/아이콘 색
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
    );
  }
}
