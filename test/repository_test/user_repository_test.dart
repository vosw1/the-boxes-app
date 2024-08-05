import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:the_boxes/_core/dio.dart';
import 'package:the_boxes/_core/dto/join_req_dto.dart';
import 'package:the_boxes/_core/dto/res_dto.dart';
import 'package:the_boxes/_core/model/user.dart';

void main() async {
  await fetchLogin_test();
}

Future<void> fetchLogin_test() async {
  // given
  LoginReqDTO requestDTO = LoginReqDTO(username: "ssar", password: "1234");

  // when
  try {
    // 1. 통신 시작
    Response response = await dio.post("/login", data: requestDTO.toJson());

    // 2. DTO 파싱
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    responseDTO.data = User.fromJson(responseDTO.data);

    // 3. 토큰 받기
    final authorization = response.headers["authorization"];
    if (authorization != null) {
      responseDTO.token = authorization.first;
    }

    // then
    Logger().d(responseDTO.status);
    Logger().d(responseDTO.errorMessage);
    Logger().d(responseDTO.token);
  } catch (e) {
    Logger().d("통신 실패");
  }
}