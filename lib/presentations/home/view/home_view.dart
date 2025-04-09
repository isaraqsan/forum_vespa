import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vespa_app/core/app/color_palette.dart';
import 'package:vespa_app/presentations/dashboard/view/dashboard.dart';
import 'package:vespa_app/presentations/home/controller/home_controller.dart';
import 'package:intl/intl.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final List<Map<String, dynamic>> dummyPosts = [
    {
      'username': '@codingbro',
      'name': 'Rizky H',
      'profilePic': 'https://i.pravatar.cc/150?img=12',
      'content':
          'Belajar Flutter enak banget, tapi state management suka bikin mumet 😂',
      'timestamp': DateTime.now().subtract(Duration(minutes: 5)),
      'likes': 12,
      'comments': 5,
    },
    {
      'username': '@flutterqueen',
      'name': 'Ayu Devina',
      'profilePic': 'https://i.pravatar.cc/150?img=30',
      'content':
          'Hari ini berhasil bikin dark mode toggle pakai GetX! ✨ #FlutterDev',
      'timestamp': DateTime.now().subtract(Duration(hours: 1, minutes: 23)),
      'likes': 25,
      'comments': 8,
    },
    {
      'username': '@bughunter',
      'name': 'Andi D.',
      'profilePic': 'https://i.pravatar.cc/150?img=40',
      'content':
          'Kenapa ya padding nggak ngefek padahal udah dibungkus Container 😵‍💫',
      'timestamp': DateTime.now().subtract(Duration(hours: 3, minutes: 47)),
      'likes': 7,
      'comments': 3,
    },
    {
      'username': '@codingbro',
      'name': 'Rizky H',
      'profilePic': 'https://i.pravatar.cc/150?img=12',
      'content':
          'Belajar Flutter enak banget, tapi state management suka bikin mumet 😂',
      'timestamp': DateTime.now().subtract(Duration(minutes: 5)),
      'likes': 12,
      'comments': 5,
    },
    {
      'username': '@flutterqueen',
      'name': 'Ayu Devina',
      'profilePic': 'https://i.pravatar.cc/150?img=30',
      'content':
          'Hari ini berhasil bikin dark mode toggle pakai GetX! ✨ #FlutterDev',
      'timestamp': DateTime.now().subtract(Duration(hours: 1, minutes: 23)),
      'likes': 25,
      'comments': 8,
    },
    {
      'username': '@bughunter',
      'name': 'Andi D.',
      'profilePic': 'https://i.pravatar.cc/150?img=40',
      'content':
          'Kenapa ya padding nggak ngefek padahal udah dibungkus Container 😵‍💫',
      'timestamp': DateTime.now().subtract(Duration(hours: 3, minutes: 47)),
      'likes': 7,
      'comments': 3,
    },
    {
      'username': '@codingbro',
      'name': 'Rizky H',
      'profilePic': 'https://i.pravatar.cc/150?img=12',
      'content':
          'Belajar Flutter enak banget, tapi state management suka bikin mumet 😂',
      'timestamp': DateTime.now().subtract(Duration(minutes: 5)),
      'likes': 12,
      'comments': 5,
    },
    {
      'username': '@flutterqueen',
      'name': 'Ayu Devina',
      'profilePic': 'https://i.pravatar.cc/150?img=30',
      'content':
          'Hari ini berhasil bikin dark mode toggle pakai GetX! ✨ #FlutterDev',
      'timestamp': DateTime.now().subtract(Duration(hours: 1, minutes: 23)),
      'likes': 25,
      'comments': 8,
    },
    {
      'username': '@bughunter',
      'name': 'Andi D.',
      'profilePic': 'https://i.pravatar.cc/150?img=40',
      'content':
          'Kenapa ya padding nggak ngefek padahal udah dibungkus Container 😵‍💫',
      'timestamp': DateTime.now().subtract(Duration(hours: 3, minutes: 47)),
      'likes': 7,
      'comments': 3,
    },
    {
      'username': '@codingbro',
      'name': 'Rizky H',
      'profilePic': 'https://i.pravatar.cc/150?img=12',
      'content':
          'Belajar Flutter enak banget, tapi state management suka bikin mumet 😂',
      'timestamp': DateTime.now().subtract(Duration(minutes: 5)),
      'likes': 12,
      'comments': 5,
    },
    {
      'username': '@flutterqueen',
      'name': 'Ayu Devina',
      'profilePic': 'https://i.pravatar.cc/150?img=30',
      'content':
          'Hari ini berhasil bikin dark mode toggle pakai GetX! ✨ #FlutterDev',
      'timestamp': DateTime.now().subtract(Duration(hours: 1, minutes: 23)),
      'likes': 25,
      'comments': 8,
    },
    {
      'username': '@bughunter',
      'name': 'Andi D.',
      'profilePic': 'https://i.pravatar.cc/150?img=40',
      'content':
          'Kenapa ya padding nggak ngefek padahal udah dibungkus Container 😵‍💫',
      'timestamp': DateTime.now().subtract(Duration(hours: 3, minutes: 47)),
      'likes': 7,
      'comments': 3,
    },
    {
      'username': '@codingbro',
      'name': 'Rizky H',
      'profilePic': 'https://i.pravatar.cc/150?img=12',
      'content':
          'Belajar Flutter enak banget, tapi state management suka bikin mumet 😂',
      'timestamp': DateTime.now().subtract(Duration(minutes: 5)),
      'likes': 12,
      'comments': 5,
    },
    {
      'username': '@flutterqueen',
      'name': 'Ayu Devina',
      'profilePic': 'https://i.pravatar.cc/150?img=30',
      'content':
          'Hari ini berhasil bikin dark mode toggle pakai GetX! ✨ #FlutterDev',
      'timestamp': DateTime.now().subtract(Duration(hours: 1, minutes: 23)),
      'likes': 25,
      'comments': 8,
    },
    {
      'username': '@bughunter',
      'name': 'Andi D.',
      'profilePic': 'https://i.pravatar.cc/150?img=40',
      'content':
          'Kenapa ya padding nggak ngefek padahal udah dibungkus Container 😵‍💫',
      'timestamp': DateTime.now().subtract(Duration(hours: 3, minutes: 47)),
      'likes': 7,
      'comments': 3,
    },
  ];

  String timeAgo(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inMinutes < 60) return '${diff.inMinutes}m';
    if (diff.inHours < 24) return '${diff.inHours}h';
    return DateFormat('dd MMM').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            // Navigasi ke HomeView saat "Forum" diklik
            Get.offAll(() => Dashboard());
          },
          child: const Text(
            'Forum',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: ColorPalette.primary,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: dummyPosts.length,
        itemBuilder: (context, index) {
          final post = dummyPosts[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(post['profilePic']),
                ),
                const SizedBox(width: 12),
                // Post content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Username & Time
                      Row(
                        children: [
                          Text(post['name'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(width: 5),
                          Text(
                            post['username'],
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          const SizedBox(width: 5),
                          Text('· ${timeAgo(post['timestamp'])}',
                              style: TextStyle(color: Colors.grey[600])),
                        ],
                      ),
                      const SizedBox(height: 4),
                      // Content
                      Text(post['content']),
                      const SizedBox(height: 8),
                      // Actions
                      Row(
                        children: [
                          Icon(Icons.favorite_border,
                              size: 18, color: Colors.grey[700]),
                          const SizedBox(width: 4),
                          Text('${post['likes']}'),
                          const SizedBox(width: 16),
                          Icon(Icons.comment_outlined,
                              size: 18, color: Colors.grey[700]),
                          const SizedBox(width: 4),
                          Text('${post['comments']}'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
