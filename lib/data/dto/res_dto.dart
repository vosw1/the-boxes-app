class ResponseDTO {
  int? status;
  String? errorMessage;
  dynamic body;
  String? token;

  ResponseDTO({
    this.status,
    this.errorMessage,
    this.body,
    this.token,
  });

  @override
  String toString() {
    return 'ResponseDTO(status: $status, message: $errorMessage, body: $body, token: $token)';
  }

  ResponseDTO.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        errorMessage = json['errorMessage'] as String?,
        body = _parseListData(json['body']),
        token = json['token'];

  static dynamic _parseListData(dynamic data) {
    if (data is List) {
      return data.map((item) => Map<String, dynamic>.from(item)).toList();
    } else {
      return data;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'errorMessage': errorMessage,
      'body': body,
      'token': token,
    };
  }
}
