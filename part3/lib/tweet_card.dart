import 'package:flutter/material.dart';

class TweetCard extends StatelessWidget {
  final String profileImageUrl;
  final String userName;
  final String userHandle;
  final String time;
  final String tweetText;
  final String? tweetImage;
  final int commentsCount;
  final int retweetsCount;
  final int likesCount;

  const TweetCard({
    Key? key,
    required this.profileImageUrl,
    required this.userName,
    required this.userHandle,
    required this.time,
    required this.tweetText,
    this.tweetImage,
    required this.commentsCount,
    required this.retweetsCount,
    required this.likesCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(profileImageUrl),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          userName,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '@$userHandle',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '· $time',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      tweetText,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (tweetImage != null) ...[
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                tweetImage!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 200,
                    color: Colors.grey[200],
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  color: Colors.grey[200],
                  child: const Icon(Icons.error),
                ),
              ),
            ),
          ],
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildIconText(Icons.chat_bubble_outline, commentsCount),
              _buildIconText(Icons.repeat, retweetsCount),
              _buildIconText(Icons.favorite_border, likesCount),
              _buildIconText(Icons.share, null),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconText(IconData icon, int? count) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[700]),
        if (count != null) ...[
          const SizedBox(width: 4),
          Text(
            _formatCount(count),
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
        ],
      ],
    );
  }

  String _formatCount(int count) {
    if (count > 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    }
    return count.toString();
  }
}