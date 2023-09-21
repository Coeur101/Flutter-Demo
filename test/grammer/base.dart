import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  double a = 2.3;
  double b = 4.5;
  double c = 2.5;
  double d = (a + b + c) / 3;
  print(bmi(80, 1.70));
  Human human = Human(name: 'jet', wight: 1.2);
  print('${human.name}+${human.wight}');
  test2();
}

double bmi(double wight, double height) {
  return wight / (height * height);
}

class Human {
  String name = '';
  double wight = 0;
  double height = 0;
  // 构造函数传参可以简化为
  // Human(this.name, this.wight, this.height);
  Human({required this.name, required this.wight, this.height = 0});
}

Future<void> test2() async {
  String path = r'D:/flutter project/one_demo/pubspec.yaml';
  File file = File(path);
  String content = await file.readAsString();
  print('文件长度为${content.length}');
  print('做其他的事情');
}
