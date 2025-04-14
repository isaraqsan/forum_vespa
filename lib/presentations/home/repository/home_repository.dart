import 'package:vespa_app/domain/base/repository.dart';
import 'package:vespa_app/presentations/home/model/arcticle_model.dart';

class HomeRepository extends Repository {
  Future<List<Article>> getArticle(
      {int page = 1, int perPage = 10, String? q}) async {
    return await dioService.get(
      url: Endpoint.artcileFe,
      param: {
        'page': page,
        'perPage': perPage,
        if (q != null) 'q': q,
      },
    ).then((value) {
      final values = value.data['values'] as List?;
      if (values == null) return <Article>[];
      return values.map((e) => Article.fromJson(e)).toList();
    });
  }

  Future<Article> getDetailArticle({String? slug}) async {
    return await dioService
        .get(
      url: Endpoint.detailArticle + "/$slug",
    )
        .then((value) {
      return Article.fromJson(value.data);
    });
  }
}
