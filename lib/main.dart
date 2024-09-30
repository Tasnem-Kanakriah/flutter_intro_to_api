// import 'dart:developer'; // ? for log('');
import 'package:flutter/material.dart';
import 'package:intro_to_api/view/cat_page.dart';
// import 'package:dio/dio.dart';

main() async {
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CatPageWithModel(),
    );
  }
}
