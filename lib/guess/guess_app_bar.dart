import 'package:flutter/material.dart';

class GuessAppBar extends StatelessWidget implements PreferredSizeWidget {
  // 使用构造函数传入回调函数
  final VoidCallback onCheck;
  final TextEditingController controller;
  const GuessAppBar({Key? key, required this.onCheck, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: TextField(
        // 控制器对象交给父组件处理,父组件创建输入框控制器，然后传递给子组件，子组件输入内容父组件也能接收，实现绑定
        controller: controller,
        keyboardType: TextInputType.number, // 键盘类型数字
        // 装饰
        decoration: const InputDecoration(
            filled: true, // 填充
            fillColor: Color(0xffF3F6F9), //填充颜色
            constraints: BoxConstraints(maxHeight: 25), // 约束条件
            // 边框信息
            border: UnderlineInputBorder(
                borderSide: BorderSide.none, // 无边框
                borderRadius: BorderRadius.all(Radius.circular(6))), // 圆角
            hintText: "输入 0~99 数字", //提示字
            hintStyle: TextStyle(fontSize: 14) //提示字样式
            ),
      ),
      centerTitle: true,
      // 左侧部分
      leading: const Icon(
        Icons.menu,
        color: Colors.black,
      ),
      // 右侧列表
      actions: [
        IconButton(
          onPressed: onCheck,
          icon: const Icon(Icons.run_circle_rounded),
          color: Colors.blue,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
