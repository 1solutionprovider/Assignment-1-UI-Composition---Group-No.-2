import 'package:flutter/material.dart';

void main() {
  runApp(const MyTwitterClone());
}

class MyTwitterClone extends StatelessWidget {
  const MyTwitterClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter UI Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
        title: const Text('Home'),
        // You might want to add leading icons or actions for search, etc.
      ),
      body: ListView(
        children: [
          // This is just a placeholder example. You'll replicate the tweets from the screenshot:
          _buildTweet(
            profileImageUrl: 'https://via.placeholder.com/50',
            userName: 'Krinza Mor',
            handle: '@krinzahere',
            tweetText: "What is an almond's impact on your grades?",
            time: '12m',
          ),
          _buildTweet(
            profileImageUrl: 'https://via.placeholder.com/50',
            userName: 'Twitter Business',
            handle: '@TwitterBusiness',
            tweetText:
                "Did you know that people spend 26% more time viewing ads on Twitter than on other leading platforms?",
            time: '1h',
          ),
          // ...Add more tweets
        ],
      ),
    );
  }

  Widget _buildTweet({
    required String profileImageUrl,
    required String userName,
    required String handle,
    required String tweetText,
    required String time,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(profileImageUrl),
      ),
      title: Row(
        children: [
          Text(userName, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 5),
          Text('@$handle'),
          const SizedBox(width: 5),
          Text('· $time'),
        ],
      ),
      subtitle: Text(tweetText),
    );
  }
}
