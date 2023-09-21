import 'package:flutter/material.dart';

// 使用类封装组件
// 使用动画，继承自StatefulWidget
class ResultNotice extends StatefulWidget {
  final Color color;
  final String info;
  const ResultNotice({Key? key, required this.color, required this.info})
      : super(key: key);
  @override
  State<ResultNotice> createState() => _ResultNoticeState();
}

// 通过width关键字混入SingleTickerProviderStateMixin 让状态类拥有动画控制器的能力
class _ResultNoticeState extends State<ResultNotice>
    with SingleTickerProviderStateMixin {
  // 创建动画控制器变量，并懒加载的形式
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    // vsync传入当前状态类
    // duration控制动画时长
    controller = AnimationController(
      vsync: this,
      // 指定时长从0过渡到1，200毫秒
      duration: const Duration(milliseconds: 200),
    );
    // 让数值运动起来
    controller.forward();
  }

  @override
  // 销毁动画相关资源
  void dispose() {
    super.dispose();
    controller.dispose();
  }

// 父组件调用setState方法后，就会触发子组件的更新前的动作
  @override
  void didUpdateWidget(covariant ResultNotice oldWidget) {
    // 让值动起来，从0开始
    controller.forward(from: 0.22);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            alignment: Alignment.center,
            color: widget.color,
            child:
                // 使用动画
                AnimatedBuilder(
                    // 动画控制器的使用
                    animation: controller,
                    builder: (_, Widget? child) => Text(
                          widget.info,
                          style: TextStyle(
                              // 乘上指定时间0-1的值的变化
                              fontSize: 54 * (controller.value),
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ))));
  }
}
