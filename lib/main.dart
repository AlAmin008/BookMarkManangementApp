import 'package:flutter/material.dart';

import './screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            displayLarge: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
            bodyMedium: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(15),
            primary: Colors.blue[700],
            textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ))),
      routes: {
        '/': (context) => const HomePage(),
      },
    );
  }
}
