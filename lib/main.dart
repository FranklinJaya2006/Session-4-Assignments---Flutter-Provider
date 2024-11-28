import 'package:flutter/material.dart';
import 'package:flutter_application_1/global/advanceglobal.dart';
import 'package:flutter_application_1/local.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, //kasi hilang debug
      home: GlobalAdvancedCounterApp(), //Ubah ke LocalAdvancedCounter jika ingin local state
    );
  }
}

