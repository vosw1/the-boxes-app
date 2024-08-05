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
    "createdAt": createdAt?.toIso8601String(),  // DateTime을 ISO 8601 문자열로 변환
  };

  // 응답 받은 데이터를 json 처럼 생긴 Map => Dart 오브젝트로 변환하는 함수
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] as int,
      username: json["username"] as String? ?? "",
      createdAt: json["createdAt"] != null
          ? DateTime.tryParse(json["createdAt"])  // DateTime 변환 시 null 처리
          : null,
    );
  }
}
