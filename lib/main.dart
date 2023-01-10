import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Employee_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Home_x());
}

class Home_x extends StatefulWidget {
  const Home_x({super.key});

  @override
  State<Home_x> createState() => _Home_xState();
}

class _Home_xState extends State<Home_x> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Employee_details(),
    );
  }
}
