import 'dart:math';

import 'package:flutter/material.dart';
import 'package:one_demo/guess/guess_app_bar.dart';
import 'package:one_demo/guess/result_notice.dart';

class GuessPage extends StatefulWidget {
  final String title;
  const GuessPage({super.key, required this.title});
  @override
  State<GuessPage> createState() => _GuessHomePageState();
}

class _GuessHomePageState extends State<GuessPage> {
  int _counter = 0;
  bool _guessing = true;
  // ignore: unused_field
  bool? _result;
  final TextEditingController _guessCtrl = TextEditingController();
  Random random = Random();
  void randomCount() {
    setState(() {
      // 生成随机数，输入随机数的最大值，但不包含最大值
      _counter = random.nextInt(100);
      _guessing = false;
    });
  }

  void _onCheck() {
    int? guessValue = int.tryParse(_guessCtrl.text);
    // 游戏未开始或者没输入东西，直接返回
    if (guessValue == null || _guessing) return;
    if (guessValue == _counter) {
      setState(() {
        _result = null;
        _guessing = true;
      });
      return;
    }
    setState(() {
      // 猜错了
      _result = guessValue > _counter;
    });
  }

  @override
  void dispose() {
    // 销毁控制器
    _guessCtrl.dispose();
    super.dispose();
  }
// 封装组件

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GuessAppBar(
        onCheck: _onCheck,
        controller: _guessCtrl,
      ),
      body: Stack(
        children: [
          if (_result != null)
            Column(
              children: [
                // 后缀加感叹号是空安全的语法，确定一个值100%为非null
                if (_result!)
                  const ResultNotice(color: Colors.redAccent, info: '大了'),
                const Spacer(),
                if (!_result!)
                  const ResultNotice(color: Colors.greenAccent, info: '小了'),
              ],
            ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // if对下方的最近代码块做处理
                if (_guessing)
                  const Text(
                    '点击生成随机数值',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                Text(
                  _guessing ? '$_counter' : '**',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _guessing ? randomCount : null,
        tooltip: '点击生成随机数',
        backgroundColor: _guessing ? Colors.blue : Colors.grey,
        child: const Icon(Icons.adjust),
      ),
    );
  }
}
