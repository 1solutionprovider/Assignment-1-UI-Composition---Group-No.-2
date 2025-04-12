import 'package:flutter/material.dart';

class MovieSection extends StatelessWidget {
  final String title;
  final List<String> imageUrls;
  final bool isOriginal;
  final double imageHeight;
  final bool progressIndicator;

  const MovieSection({
    Key? key,
    required this.title,
    required this.imageUrls,
    this.isOriginal = false,
    this.imageHeight = 180,
    this.progressIndicator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double imageWidth = imageHeight * (isOriginal ? 0.66 : 0.45);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: imageHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imageUrls.length,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemBuilder: (context, index) {
              return Container(
                width: imageWidth,
                margin: const EdgeInsets.only(right: 8.0),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: Image.network(
                        imageUrls[index],
                        width: imageWidth,
                        height: imageHeight,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            color: Colors.grey[900],
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: Colors.red,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    if (progressIndicator)
                      LinearProgressIndicator(
                        value: 0.7,
                        backgroundColor: Colors.grey[800],
                        valueColor: const AlwaysStoppedAnimation(Colors.red),
                        minHeight: 2,
                      ),
                    if (isOriginal)
                      Positioned(
                        left: 5,
                        bottom: 5,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          color: Colors.red,
                          child: const Text(
                            'ORIGINAL',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}