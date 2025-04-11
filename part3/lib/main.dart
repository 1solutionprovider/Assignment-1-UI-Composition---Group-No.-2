import 'package:flutter/material.dart';

void main() => runApp(MyTwitterClone());

class MyTwitterClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Twitter UI Clone",
      theme: ThemeData(primaryColor: Colors.white),
      home: TwitterHomePage(),
    );
  }
}

class TwitterHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
return Scaffold(
  appBar: AppBar(
    title: Text("Home", style: TextStyle(color: Colors.black)),
    backgroundColor: Colors.white,
  ),
  body: Container(),
  bottomNavigationBar: BottomNavigationBar(
    currentIndex: 0,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: "Explore"),
      BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: "Notifications"),
      BottomNavigationBarItem(icon: Icon(Icons.mail_outline), label: "Messages"),
    ],
  ),
);
  }
}