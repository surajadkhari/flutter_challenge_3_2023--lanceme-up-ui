import 'dart:convert';

class PostRequestModel {
  final String title;
  final String body;
  PostRequestModel({
    required this.title,
    required this.body,
  });

  PostRequestModel copyWith({
    String? title,
    String? body,
  }) {
    return PostRequestModel(
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'body': body,
    };
  }

  factory PostRequestModel.fromMap(Map<String, dynamic> map) {
    return PostRequestModel(
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostRequestModel.fromJson(String source) =>
      PostRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PostRequestModel(title: $title, body: $body)';

  @override
  bool operator ==(covariant PostRequestModel other) {
    if (identical(this, other)) return true;

    return other.title == title && other.body == body;
  }

  @override
  int get hashCode => title.hashCode ^ body.hashCode;
}
