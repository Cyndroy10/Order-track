import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:order_track/HomeScreen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      new MaterialApp(
        home: HomeScreen(),
      )
  );
}
