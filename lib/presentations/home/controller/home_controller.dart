import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:vespa_app/core/service/auth_service.dart';
import 'package:vespa_app/core/util/core_function.dart';
import 'package:vespa_app/presentations/component/dialog.dart';
import 'package:vespa_app/presentations/home/model/arcticle_model.dart';
import 'package:vespa_app/presentations/home/repository/home_repository.dart';
import 'package:vespa_app/presentations/home/view/detail_home_view.dart';
import 'package:vespa_app/presentations/login/view/login_view.dart';

class HomeController extends GetxController with StateMixin<List<Article>> {
  HomeRepository homeRepository = HomeRepository();
  var articles = <Article>[].obs;
  int currentPage = 1;
  final int perPage = 10;
  bool isLoadingMore = false;
  bool hasNextPage = true;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    onGetData();
    scrollController.addListener(_scrollListener);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void _scrollListener() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      if (!isLoadingMore && hasNextPage) {
        fetchMoreData();
      }
    }
  }

  onGetData() async {
    change(null, status: RxStatus.loading());
    try {
      currentPage = 1;
      final data =
          await homeRepository.getArticle(page: currentPage, perPage: perPage);
      articles.assignAll(data);
      hasNextPage = data.length == perPage;
      change(articles, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error("Gagal mengambil data: $e"));
    }
  }

  fetchMoreData() async {
    isLoadingMore = true;
    currentPage += 1;

    try {
      final moreData =
          await homeRepository.getArticle(page: currentPage, perPage: perPage);
      if (moreData.isNotEmpty) {
        articles.addAll(moreData);
        hasNextPage = moreData.length == perPage;
        change(articles, status: RxStatus.success());
      } else {
        hasNextPage = false;
      }
    } catch (e) {
      // bisa handle error fetch selanjutnya di sini
    } finally {
      isLoadingMore = false;
    }
  }

  void goToArticleDetail(dynamic article) async {
    await AuthService().getToken();
    if (AuthService.isLogin) {
      Get.to(() => PostDetailView(), arguments: article);
    } else {
      ComponentDialog.requireLoginDialog();
    }
  }
}
