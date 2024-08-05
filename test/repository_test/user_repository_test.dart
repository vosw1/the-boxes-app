import 'package:flutter_test/flutter_test.dart'; // Flutter 테스트 패키지
import 'package:logger/logger.dart';
import 'package:the_boxes/_core/constants/dio.dart';
import 'package:the_boxes/data/dto/join_req_dto.dart';
import 'package:the_boxes/data/dto/res_dto.dart';
import 'package:the_boxes/data/model/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert'; // JSON 파싱을 위한 패키지

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('fetchLoginTest', () async {
    await fetchLoginTest();
  });
}

Future<void> fetchLoginTest() async {
  LoginReqDTO requestDTO = LoginReqDTO(username: "asdf", password: "as1234");

  try {
    print('Sending request to server...');
    final response = await dio.post("/login", data: requestDTO.toJson());

    if (response.data == null || response.data.toString().isEmpty) {
      throw FormatException('Empty response');
    }

    print('Response received: ${response.data}');
    print('Response headers: ${response.headers}');

    // 응답 데이터가 JSON 문자열일 경우 파싱
    Map<String, dynamic> responseData;
    if (response.data is String) {
      responseData = json.decode(response.data);
    } else {
      responseData = response.data;
    }

    ResponseDTO responseDTO = ResponseDTO.fromJson(responseData);

    if (responseDTO.body is Map<String, dynamic>) {
      responseDTO.body = User.fromJson(responseDTO.body);
    }

    final authorization = response.headers["Authorization"];

    if (authorization != null && authorization.isNotEmpty) {
      responseDTO.token = authorization.first;
      await secureStorage.write(key: 'accessToken', value: responseDTO.token);
    }

    Logger().d('Status: ${responseDTO.status}');
    Logger().d('Error Message: ${responseDTO.errorMessage}');
    Logger().d('Token: ${responseDTO.token}');
    print('로그인 성공');
  } catch (e, stackTrace) {
    Logger().e("통신 실패", error: e, stackTrace: stackTrace);
  }
}
