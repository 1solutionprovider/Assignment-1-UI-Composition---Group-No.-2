import 'package:flutter/material.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/movie_slider.dart';
import 'widgets/banner_slider.dart';

void main() {
  runApp(const NetflixApp());
}

class NetflixApp extends StatelessWidget {
  const NetflixApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    List<String> trendingNow = [
      'https://image.tmdb.org/t/p/w780/9PaYhKtOq4QYzg3Jizz59hz1CZx.jpg',
      'https://image.tmdb.org/t/p/w780/iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg',
      'https://image.tmdb.org/t/p/w780/sv1xJUazXeYqALzczSZ3O6nkH75.jpg',
      'https://image.tmdb.org/t/p/w780/jlGmlFOcfo8n5tURmhC7YVd4Iyy.jpg',
      'https://image.tmdb.org/t/p/w780/1NqwE6LP9IEdOZ57NCT51ftHtWT.jpg',
      'https://image.tmdb.org/t/p/w500/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
      'https://image.tmdb.org/t/p/w500/5ik4ATKmNtmJU6AYD0bLm56BCVM.jpg',
      'https://image.tmdb.org/t/p/w500/3bhkrj58Vtu7enYsRolD1fZdja1.jpg',
      'https://image.tmdb.org/t/p/w500/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg',
      'https://image.tmdb.org/t/p/w500/qWQSnedj0LCUjWNp9fLcMtfgadp.jpg',
    ];

    List<String> popularOnNetflix = [
      'https://image.tmdb.org/t/p/w500/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
      'https://image.tmdb.org/t/p/w500/5ik4ATKmNtmJU6AYD0bLm56BCVM.jpg',
      'https://image.tmdb.org/t/p/w500/3bhkrj58Vtu7enYsRolD1fZdja1.jpg',
      'https://image.tmdb.org/t/p/w500/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg',
      'https://image.tmdb.org/t/p/w500/qWQSnedj0LCUjWNp9fLcMtfgadp.jpg',
      'https://image.tmdb.org/t/p/w500/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
      'https://image.tmdb.org/t/p/w500/5ik4ATKmNtmJU6AYD0bLm56BCVM.jpg',
      'https://image.tmdb.org/t/p/w500/3bhkrj58Vtu7enYsRolD1fZdja1.jpg',
      'https://image.tmdb.org/t/p/w500/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg',
      'https://image.tmdb.org/t/p/w500/qWQSnedj0LCUjWNp9fLcMtfgadp.jpg',
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 50.0),
          child: CustomAppBar(),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: screenSize.height * 0.55,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      'https://image.tmdb.org/t/p/w1280/1X7vowCZX71GCcYqKPwzlDQKhUJ.jpg',
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                            Colors.black,
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      bottom: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            'https://www.freepnglogos.com/uploads/netflix-logo-text-emblem-31.png',
                            width: 150,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(Icons.info_outline, color: Colors.white),
                              const SizedBox(width: 20),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                ),
                                icon: const Icon(Icons.play_arrow),
                                label: const Text('Play'),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                MovieSection(
                  title: 'Trending Now',
                  imageUrls: trendingNow,
                  isOriginal: true,
                ),
                MovieSection(
                  title: 'Popular on Netflix',
                  imageUrls: popularOnNetflix,
                  imageHeight: 150,
                ),
                MovieSection(
                  title: 'Continue Watching',
                  imageUrls: popularOnNetflix,
                  progressIndicator: true,
                ),
              ]),
            ),
          ],
        ),
        bottomNavigationBar: const NetflixBottomBar(),
      ),
    );
  }
}