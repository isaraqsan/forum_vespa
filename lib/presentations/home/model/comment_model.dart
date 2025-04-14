class CommentResponse {
  bool? status;
  String? message;
  CommentData? data;

  CommentResponse({this.status, this.message, this.data});

  CommentResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? CommentData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data?.toJson();
    return data;
  }
}

class CommentData {
  int? total;
  List<Comment>? values;

  CommentData({this.total, this.values});

  CommentData.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['values'] != null) {
      values = <Comment>[];
      json['values'].forEach((v) {
        values!.add(Comment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['total'] = total;
    data['values'] = values?.map((v) => v.toJson()).toList();
    return data;
  }
}

class Comment {
  int? id;
  int? idExternal;
  int? groupComment;
  String? comment;
  int? createdBy;
  String? createdDate;
  Author? author;
  int? counterComment;
  List<Comment>? replyComment;

  Comment({
    this.id,
    this.idExternal,
    this.groupComment,
    this.comment,
    this.createdBy,
    this.createdDate,
    this.author,
    this.counterComment,
    this.replyComment,
  });

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idExternal = json['id_external'];
    groupComment = json['group_comment'];
    comment = json['comment'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    counterComment = json['counter_comment'];
    if (json['reply_comment'] != null) {
      replyComment = <Comment>[];
      json['reply_comment'].forEach((v) {
        replyComment!.add(Comment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['id_external'] = idExternal;
    data['group_comment'] = groupComment;
    data['comment'] = comment;
    data['created_by'] = createdBy;
    data['created_date'] = createdDate;
    data['author'] = author?.toJson();
    data['counter_comment'] = counterComment;
    data['reply_comment'] = replyComment?.map((v) => v.toJson()).toList();
    return data;
  }
}

class Author {
  String? username;
  String? fullName;
  String? imageFoto;

  Author({this.username, this.fullName, this.imageFoto});

  Author.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    fullName = json['full_name'];
    imageFoto = json['image_foto'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = username;
    data['full_name'] = fullName;
    data['image_foto'] = imageFoto;
    return data;
  }
}
