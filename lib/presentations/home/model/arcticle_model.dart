class ArticleResponse {
  final bool status;
  final String? message;
  final ArticleData data;

  ArticleResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ArticleResponse.fromJson(Map<String, dynamic> json) {
    return ArticleResponse(
      status: json['status'],
      message: json['message'],
      data: ArticleData.fromJson(json['data']),
    );
  }
}

class ArticleData {
  final dynamic total;
  final List<Article> values;

  ArticleData({
    required this.total,
    required this.values,
  });

  factory ArticleData.fromJson(Map<String, dynamic> json) {
    return ArticleData(
      total: json['total'],
      values: (json['values'] as List)
          .map((item) => Article.fromJson(item))
          .toList(),
    );
  }
}

class Article {
  final dynamic id;
  final String? categoryName;
  final String? title;
  final String? slug;
  final String? description;
  final String? pathThumbnail;
  final String? pathImage;
  final dynamic status;
  final dynamic counterView;
  final dynamic counterShare;
  final dynamic counterLike;
  final dynamic counterComment;
  final dynamic like;
  final dynamic createdBy;
  final DateTime createdDate;
  final dynamic modifiedBy;
  final DateTime? modifiedDate;
  final Author author;
  final Komunitas komunitas;
  final Tema tema;

  Article({
    required this.id,
    this.categoryName,
    required this.title,
    required this.slug,
    required this.description,
    required this.pathThumbnail,
    required this.pathImage,
    required this.status,
    required this.counterView,
    required this.counterShare,
    required this.counterLike,
    required this.counterComment,
    required this.like,
    required this.createdBy,
    required this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
    required this.author,
    required this.komunitas,
    required this.tema,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      categoryName: json['category_name'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      pathThumbnail: json['path_thumbnail'],
      pathImage: json['path_image'],
      status: json['status'],
      counterView: json['counter_view'],
      counterShare: json['counter_share'],
      counterLike: json['counter_like'],
      counterComment: json['counter_comment'],
      like: json['like'],
      createdBy: json['created_by'],
      createdDate: DateTime.parse(json['created_date']),
      modifiedBy: json['modified_by'],
      modifiedDate: json['modified_date'] != null
          ? DateTime.tryParse(json['modified_date'])
          : null,
      author: Author.fromJson(json['author']),
      komunitas: Komunitas.fromJson(json['komunitas']),
      tema: Tema.fromJson(json['tema']),
    );
  }
}

class Author {
  final String? username;
  final String? fullName;
  final String? imageFoto;
  final String? province;
  final String? regency;

  Author({
    required this.username,
    required this.fullName,
    this.imageFoto,
    required this.province,
    required this.regency,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      username: json['username'],
      fullName: json['full_name'],
      imageFoto: json['image_foto'],
      province: json['province'],
      regency: json['regency'],
    );
  }
}

class Komunitas {
  final dynamic id;
  final String? komunitasName;
  final dynamic type;
  final String? iconImage;

  Komunitas({
    required this.id,
    required this.komunitasName,
    required this.type,
    this.iconImage,
  });

  factory Komunitas.fromJson(Map<String, dynamic> json) {
    return Komunitas(
      id: json['id'],
      komunitasName: json['komunitas_name'],
      type: json['type'],
      iconImage: json['icon_image'],
    );
  }
}

class Tema {
  final dynamic id;
  final String? temaName;
  final dynamic type;
  final String? iconImage;

  Tema({
    required this.id,
    required this.temaName,
    required this.type,
    this.iconImage,
  });

  factory Tema.fromJson(Map<String, dynamic> json) {
    return Tema(
      id: json['id'],
      temaName: json['tema_name'],
      type: json['type'],
      iconImage: json['icon_image'],
    );
  }
}
