import 'package:flutter/material.dart';

class TweetCard extends StatelessWidget {
  final String userName;
  final String userHandle;
  final String time;
  final String tweetText;
  final String? tweetImage;

  const TweetCard({
    Key? key,
    required this.userName,
    required this.userHandle,
    required this.time,
    required this.tweetText,
    this.tweetImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with avatar and user details
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage("https://via.placeholder.com/50"),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(userName,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(width: 5),
                        Text(userHandle, style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 5),
                        Text("· $time", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(tweetText, style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          // Optional tweet image
          tweetImage != null
              ? Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(tweetImage!),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
              : SizedBox.shrink(),
          SizedBox(height: 10),
          // Reaction icons row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildIconText(icon: Icons.chat_bubble_outline, text: "24"),
              _buildIconText(icon: Icons.repeat, text: "12"),
              _buildIconText(icon: Icons.favorite_border, text: "53"),
              _buildIconText(icon: Icons.share, text: ""),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconText({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey),
        SizedBox(width: 4),
        text.isNotEmpty ? Text(text, style: TextStyle(color: Colors.grey, fontSize: 14)) : Container(),
      ],
    );
  }
}
