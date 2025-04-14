import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vespa_app/core/app/color_palette.dart';
import 'package:vespa_app/presentations/home/controller/detail_article_controller.dart';

class PostDetailView extends StatelessWidget {
  const PostDetailView({super.key});

  String formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy, HH:mm').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Artikel'),
        backgroundColor: ColorPalette.primary,
      ),
      backgroundColor: Colors.white,
      body: GetBuilder<DetailArticleController>(
        init: DetailArticleController(),
        builder: (controller) {
          final article = controller.state;

          if (article == null) {
            return const Center(child: CircularProgressIndicator());
          }
          final imageData = article.pathImage;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Penulis & waktu
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: article.author.imageFoto != null &&
                              article.author.imageFoto!.isNotEmpty
                          ? NetworkImage(
                              'https://api-jarimuawasipemilu.bawaslu.go.id/${article.author.imageFoto!}')
                          : const AssetImage('assets/images/default-person.png')
                              as ImageProvider,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(article.author.fullName ?? '',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 4),
                          Text(
                            formatDate(article.createdDate),
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Deskripsi artikel
                Text(
                  article.description ?? '',
                  style: const TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 16),

                // Gambar utama
                if ((imageData ?? '').isNotEmpty) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      'https://api-jarimuawasipemilu.bawaslu.go.id/$imageData',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],

                // Like & Komentar
                Row(
                  children: [
                    Icon(Icons.favorite_border, color: Colors.grey[700]),
                    const SizedBox(width: 4),
                    Text('${article.counterLike}'),
                    const SizedBox(width: 16),
                    Icon(Icons.comment_outlined, color: Colors.grey[700]),
                    const SizedBox(width: 4),
                    Text('${article.counterComment}'),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
