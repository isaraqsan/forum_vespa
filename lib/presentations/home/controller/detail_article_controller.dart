import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:vespa_app/core/service/auth_service.dart';
import 'package:vespa_app/core/util/core_function.dart';
import 'package:vespa_app/presentations/home/model/arcticle_model.dart';
import 'package:vespa_app/presentations/home/repository/home_repository.dart';
import 'package:vespa_app/presentations/home/view/detail_home_view.dart';

class DetailArticleController extends GetxController with StateMixin<Article> {
  HomeRepository homeRepository = HomeRepository();
  var articles = <Article>[].obs;
  int currentPage = 1;
  final int perPage = 10;
  bool isLoadingMore = false;
  bool hasNextPage = true;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    final slug = Get.arguments as String?;
    if (slug != null) {
      onGetData(slug);
    }
    super.onInit();
  }

  onGetData(String slug) async {
    
    change(null, status: RxStatus.loading());
    try {
      currentPage = 1;
      final data = await homeRepository.getDetailArticle(slug: slug);
      change(data, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error("Gagal mengambil data: $e"));
    }
  }

  // void goToArticleDetail(dynamic article) {
  //   Get.to(() => PostDetailView(article: article));
  // }
}
