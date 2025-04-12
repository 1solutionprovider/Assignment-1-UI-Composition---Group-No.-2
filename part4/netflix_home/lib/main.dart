import 'package:flutter/material.dart';
import 'widgets/custom_app_bar.dart';

void main() {
  runApp(const NetflixApp());
}

class NetflixApp extends StatelessWidget {
  const NetflixApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: CustomAppBar(),
        body: const Center(child: Text('Netflix UI Coming Soon', style: TextStyle(color: Colors.white))),
      ),
    );
  }
}
