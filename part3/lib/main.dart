import 'package:flutter/material.dart';
import 'tweet_card.dart';

void main() {
  runApp(const MyTwitterClone());
}

class MyTwitterClone extends StatelessWidget {
  const MyTwitterClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter UI Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.blue),
        ),
      ),
      home: const TwitterHomePage(),
    );
  }
}

class TwitterHomePage extends StatelessWidget {
  const TwitterHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.blue),
          onPressed: () {},
        ),
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: const [
          TweetCard(
            profileImageUrl: 'https://pixabay.com/photos/ai-generated-man-face-hoodie-youth-8083323/',
            userName: 'Ameer umar',
            userHandle: 'ameerUmar_1',
            time: '12m',
            tweetText: "What is an almond's impact on your grades?",
            commentsCount: 10,
            retweetsCount: 5,
            likesCount: 42,
          ),
          TweetCard(
            profileImageUrl: 'https://cdn-icons-png.flaticon.com/512/124/124021.png',
            userName: 'Twitter Business',
            userHandle: 'TwitterBusiness',
            time: '1h',
            tweetText: "Did you know that people spend 26% more time viewing ads on Twitter than on other leading platforms?\n\nGet in touch, and we'll help you get started with advertising on Twitter. Share your details so we can reach out further!",
            commentsCount: 26,
            retweetsCount: 14,
            likesCount: 73,
          ),
          TweetCard(
            profileImageUrl: 'https://pixabay.com/illustrations/man-unhappy-angry-gray-eyes-6604406/',
            userName: 'Sameer Ahmed',
            userHandle: 'Sameer_01',
            time: '3h',
            tweetText: "I tweeted “my brain at home” today and I’m curious to see what Twitter has to say about it.",
            commentsCount: 2,
            retweetsCount: 1,
            likesCount: 17,
          ),
          TweetCard(
            profileImageUrl: 'https://i.pravatar.cc/150?img=4',
            userName: 'Miko',
            userHandle: 'thecodemiko',
            time: '1h',
            tweetText: "WHAT THE DAWWGG DOIN???",
            tweetImage: 'https://picsum.photos/id/237/500/300',
            commentsCount: 58,
            retweetsCount: 19,
            likesCount: 1976,
          ),
          TweetCard(
            profileImageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2F99designs.com%2Finspiration%2Fillustration%2Favatar&psig=AOvVaw2xm_tzJJ-zVPCKRZhaFPfv&ust=1744497086251000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCMi3sZyE0YwDFQAAAAAdAAAAABAI',
            userName: 'Alexandra Botez',
            userHandle: 'alexandrabotez',
            time: '1h',
            tweetText: "David is here @david - They are with Texas... Where does life take me now?? I have to go, please let me know. And I'll take care of it. Praying for Texas.",
            commentsCount: 1,
            retweetsCount: 2,
            likesCount: 128,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.mail_outline), label: 'Messages'),
        ],
      ),
    );
  }
}