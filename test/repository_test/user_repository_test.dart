import 'package:flutter_test/flutter_test.dart'; // Flutter 테스트 패키지
import 'package:logger/logger.dart';
import 'package:the_boxes/_core/constants/dio.dart';
import 'package:the_boxes/data/dto/join_req_dto.dart';
import 'package:the_boxes/data/dto/res_dto.dart';
import 'package:the_boxes/data/model/user.dart';


Future<void> fetchLoginTest() async {
  LoginReqDTO requestDTO = LoginReqDTO(username: "asdf", password: "as1234");
  print('통신시작');
  try {
    final response = await dio.post("/login", data: requestDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    print('파싱시작');
    if (responseDTO.data is Map<String, dynamic>) {
      responseDTO.data = User.fromJson(responseDTO.data);
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

void main() {
  test('fetchLoginTest', () async {
    await fetchLoginTest();
  });
}