import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:readmore/readmore.dart';
import 'package:vespa_app/core/app/color_palette.dart';
import 'package:vespa_app/presentations/dashboard/view/dashboard.dart';
import 'package:vespa_app/presentations/home/controller/home_controller.dart';
import 'package:intl/intl.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  String timeAgo(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inMinutes < 60) return '${diff.inMinutes}m';
    if (diff.inHours < 24) return '${diff.inHours}h';
    return DateFormat('dd MMM').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(), // pastikan controller diinisialisasi
      builder: (controller) {
        return controller.obx((state) {
          return Scaffold(
            backgroundColor: ColorPalette.white,
            appBar: AppBar(
              title: GestureDetector(
                onTap: () {
                  Get.offAll(() => Dashboard());
                },
                child: const Text(
                  'Forum',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              backgroundColor: ColorPalette.primary,
              elevation: 1,
            ),
            body: ListView.builder(
              controller: controller.scrollController,
              itemCount: state!.length,
              itemBuilder: (context, index) {
                // final post = state[index];
                final imageData = state[index].pathImage;
                if (index == state.length) {
                  return controller.hasNextPage
                      ? const Center(child: CircularProgressIndicator())
                      : const SizedBox.shrink();
                }

                final item = state[index];

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: state[index].author.imageFoto !=
                                        null &&
                                    state[index].author.imageFoto!.isNotEmpty
                                ? NetworkImage(
                                    'https://api-jarimuawasipemilu.bawaslu.go.id/${state[index].author.imageFoto!}')
                                : const AssetImage(
                                        'assets/images/default-person.png')
                                    as ImageProvider,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(state[index].author.fullName ?? '',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(width: 5),
                                    Text(
                                        '· ${timeAgo(state[index].createdDate)}',
                                        style:
                                            TextStyle(color: Colors.grey[600])),
                                  ],
                                ),
                                const SizedBox(height: 4),

                                /// 👇 InkWell hanya membungkus konten deskripsi & gambar
                                InkWell(
                                  onTap: () => controller
                                      .goToArticleDetail(state[index].slug),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ReadMoreText(
                                        state[index].description ?? '',
                                        trimLines: 5,
                                        colorClickableText: Colors.blue,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText: 'Lihat lainnya',
                                        trimExpandedText: 'Lihat lebih sedikit',
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      const SizedBox(height: 8),
                                      if ((imageData ?? '').isNotEmpty) ...[
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                            'https://api-jarimuawasipemilu.bawaslu.go.id/$imageData',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 8),

                                /// 👇 Like dan Comment tidak berada dalam InkWell
                                Row(
                                  children: [
                                    Icon(Icons.favorite_border,
                                        size: 18, color: Colors.grey[700]),
                                    const SizedBox(width: 4),
                                    Text('${state[index].counterLike}'),
                                    const SizedBox(width: 16),
                                    GestureDetector(
                                      onTap: () => controller
                                          .goToArticleDetail(state[index].slug),
                                      child: Row(
                                        children: [
                                          Icon(Icons.comment_outlined,
                                              size: 18,
                                              color: Colors.grey[700]),
                                          const SizedBox(width: 4),
                                          Text(
                                              '${state[index].counterComment}'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey[300],
                      thickness: 1,
                      height: 1,
                    ),
                  ],
                );
              },
            ),
          );
        });
      },
    );
  }
}
