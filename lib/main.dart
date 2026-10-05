import 'package:flutter/material.dart';

import 'views/e01_page_ui.dart';

void main() {
  runApp(const OrangeApp());
}

class OrangeApp extends StatelessWidget {
  const OrangeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orange ส้ม',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF7941D)),
        useMaterial3: true,
      ),
      home: const E01PageUI(),
    );
  }
}
