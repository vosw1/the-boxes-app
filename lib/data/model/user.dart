import 'package:intl/intl.dart';

class User {
  final int id;
  final String username;
  final DateTime? createdAt;

  User({
    required this.id,
    required this.username,
    required this.createdAt,
  });

  // Dart 객체를 통신을 위한 Map 형태로 변환하는 함수
  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "createdAt": createdAt != null ? DateFormat("yyyy-MM-dd").format(createdAt!) : null,
  };

  // 응답 받은 데이터를 json 처럼 생긴 Map => Dart 오브젝트로 변환하는 함수
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] as int,
      username: json["username"] ?? "",
      createdAt: json["createdAt"] != null
          ? DateFormat("yyyy-MM-dd").parse(json["createdAt"] as String)
          : null,
    );
  }
}
