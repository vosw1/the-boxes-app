import 'package:logger/logger.dart';
import 'package:the_boxes/_core/constants/dio.dart';
import 'package:the_boxes/data/dto/join_req_dto.dart';
import 'package:the_boxes/data/dto/res_dto.dart';
import 'package:the_boxes/data/model/user.dart';

class UserRepository {

  Future<ResponseDTO> fetchUsernameSameCheck(DuplimentEmailCheckDTO requestDTO) async {
    try {
      final response = await dio.get(
        "/username-same-check",
        queryParameters: requestDTO.toJson(),
      );

      // 디버깅을 위한 로그 출력
      print('데이터 확인 : ${requestDTO.toJson()}');
      print('서버 응답 : ${response.data}');

      if (response.data == false) {
        throw Exception('중복된 아이디입니다');
      }

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      // 디버깅을 위한 로그 출력
      print('데이터 확인 : ${responseDTO.body}');

      return responseDTO;
    } catch (e) {
      // 예외를 잡아내고 적절한 에러 처리를 합니다.
      print('유저네임 중복 체크 오류: $e');
      // 필요에 따라 다른 처리를 추가할 수 있습니다.
      throw Exception('유저네임 중복 체크 실패');
    }
  }

  Future<ResponseDTO> fetchJoin(JoinReqDTO requestDTO) async {
    // 통신 시작
    final response = await dio.post("/join", data: requestDTO.toJson());
    Logger().d(response.data!);

    print('데이터 확인 : ${requestDTO.toJson()}');
    // DTO 파싱하기
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    print('데이터 확인 : ${ResponseDTO.fromJson(response.data)}');
    return responseDTO;
  }

  Future<(ResponseDTO, String)> fetchLogin(LoginReqDTO loginReqDTO) async {
    final response = await dio.post("/login", data: loginReqDTO.toJson());
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
      print('로그인 성공');
      return (responseDTO, accessToken);
    } else {
      return (responseDTO, "");
    }
  }
}