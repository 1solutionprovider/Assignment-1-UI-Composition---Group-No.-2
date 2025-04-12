import 'package:flutter/material.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/movie_slider.dart';

void main() {
  runApp(const NetflixApp());
}

class NetflixApp extends StatelessWidget {
  const NetflixApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> sampleImages = List.generate(
      10,
      (index) => 'https://via.placeholder.com/100x150?text=Movie+${index + 1}',
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: CustomAppBar(),
        body: ListView(
          children: [
            MovieSection(title: 'Trending Now', imageUrls: sampleImages),
            MovieSection(title: 'Popular on Netflix', imageUrls: sampleImages),
          ],
        ),
      ),
    );
  }
}
