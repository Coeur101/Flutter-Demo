import 'package:flutter/material.dart';
import 'package:one_demo/guess/guess_page.dart';

import 'counter/counter_page.dart';

void main() {
  // 主函数，创建myApp类型对象，并将该对象作为参数传入runApp函数中
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const GuessPage(title: '计数游戏'),
    );
  }
}
