import 'package:flutter/material.dart';

class MovieSection extends StatelessWidget {
  final String title;
  final List<String> imageUrls;

  const MovieSection({Key? key, required this.title, required this.imageUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.network(imageUrls[index], width: 100, fit: BoxFit.cover),
              );
            },
          ),
        ),
      ],
    );
  }
}
