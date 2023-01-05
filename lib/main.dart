import 'package:animation_practice/screen1/screen_1.dart';
import 'package:animation_practice/screen2/screen_2.dart';
import 'package:animation_practice/screen3/screen3.dart';
import 'package:animation_practice/test_screen/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
        home: const Screen3(),
      ),
    );
  }
}
