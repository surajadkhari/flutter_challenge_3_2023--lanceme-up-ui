import 'dart:convert';

class PostResponseModel {
  final int userId;
  final int id;
  final String title;
  final String body;
  PostResponseModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  PostResponseModel copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostResponseModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory PostResponseModel.fromMap(Map<String, dynamic> map) {
    return PostResponseModel(
      userId: map['userId'] ?? 0,
      id: map['id'] ?? 0,
      title: map['title'] ?? "",
      body: map['body'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory PostResponseModel.fromJson(String source) =>
      PostResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostResponseModel(userId: $userId, id: $id, title: $title, body: $body)';
  }

  @override
  bool operator ==(covariant PostResponseModel other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.id == id &&
        other.title == title &&
        other.body == body;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ id.hashCode ^ title.hashCode ^ body.hashCode;
  }
}
