import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: const Text('Netflix', style: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold)),
      centerTitle: true,
    );
  }
}
