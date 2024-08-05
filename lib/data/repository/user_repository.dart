import 'package:dio/dio.dart';
import 'package:the_boxes/_core/constants/dio.dart';
import 'package:the_boxes/data/dto/join_req_dto.dart';
import 'package:the_boxes/data/dto/res_dto.dart';
import 'package:the_boxes/data/model/user.dart';

class UserRepository {
  Future<ResponseDTO> fetchJoin(JoinReqDTO requestDTO) async {
    try {
      // 통신 시작
      final response = await dio.post("/join", data: requestDTO.toJson());
      // DTO 파싱하기
      return ResponseDTO.fromJson(response.data);
    } catch (e) {
      // 네트워크 오류 등 예외 처리
      print('회원가입 요청 중 오류 발생: $e');
      throw Exception('회원가입 요청 실패');
    }
  }

  Future<Map<String, dynamic>> fetchLogin(LoginReqDTO loginReqDTO) async {
    try {
      final response = await dio.post("/login", data: loginReqDTO.toJson());

      final responseDTO = ResponseDTO.fromJson(response.data);

      if (responseDTO.success) {
        if (responseDTO.data is Map<String, dynamic>) {
          responseDTO.data = User.fromJson(responseDTO.data);
        }

        final accessToken = response.headers["Authorization"]?.first ?? '';
        return {
          'responseDTO': responseDTO,
          'accessToken': accessToken,
        };
      } else {
        return {
          'responseDTO': responseDTO,
          'accessToken': '',
        };
      }
    } catch (e) {
      // 네트워크 오류 등 예외 처리
      print('로그인 요청 중 오류 발생: $e');
      throw Exception('로그인 요청 실패');
    }
  }
}
