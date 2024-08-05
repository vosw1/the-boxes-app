import 'package:logger/logger.dart';
import 'package:the_boxes/_core/constants/dio.dart';
import 'package:the_boxes/data/dto/join_req_dto.dart';
import 'package:the_boxes/data/dto/res_dto.dart';
import 'package:the_boxes/data/model/user.dart';

class UserRepository {

  Future<ResponseDTO> fetchEmailSameCheck(DuplimentEmailCheckDTO requestDTO) async {
    final response = await dio.get(
      "/users/username-same-check",
      queryParameters: requestDTO.toJson(),
    );

    print('데이터 확인 : ${requestDTO.toJson()}');
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    print('데이터 확인 : ${responseDTO.body}');

    return responseDTO;
  }

  Future<ResponseDTO> fetchJoin(JoinReqDTO requestDTO) async {
    // 통신 시작
    final response = await dio.post("/users/join", data: requestDTO.toJson());
    Logger().d(response.data!);

    print('데이터 확인 : ${requestDTO.toJson()}');
    // DTO 파싱하기
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    print('데이터 확인 : ${ResponseDTO.fromJson(response.data)}');
    return responseDTO;
  }

  Future<(ResponseDTO, String)> fetchLogin(LoginReqDTO loginReqDTO) async {
    final response = await dio.post("/users/login", data: loginReqDTO.toJson());
    Logger().d(response.data!);
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    print('데이터 확인 : ${loginReqDTO.toJson()}');
    if (responseDTO.status == 200) {
      // response가 User 객체인지 확인 후 변환
      if (responseDTO.body is Map<String, dynamic>) {
        responseDTO.body = User.fromJson(responseDTO.body);
        print('데이터 확인 : ${responseDTO.body}');
      }
      final accessToken = response.headers["Authorization"]!.first;
      return (responseDTO, accessToken);
    } else {
      return (responseDTO, "");
    }
  }
}