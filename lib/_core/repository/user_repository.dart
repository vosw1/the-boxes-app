import 'package:the_boxes/_core/dio.dart';
import 'package:the_boxes/_core/dto/join_req_dto.dart';
import 'package:the_boxes/_core/dto/res_dto.dart';
import 'package:the_boxes/_core/model/user.dart';

class UserRepository {
  Future<ResponseDTO> fetchJoin(JoinReqDTO requestDTO) async {
    // 통신 시작
    final response = await dio.post("/join", data: requestDTO.toJson());
    // DTO 파싱하기
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    return responseDTO;
  }

  Future<(ResponseDTO, String)> fetchLogin(LoginReqDTO loginReqDTO) async {
    final response = await dio.post("/login", data: loginReqDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.success) {
      // response가 User 객체인지 확인 후 변환
      if (responseDTO.data is Map<String, dynamic>) {
        responseDTO.data = User.fromJson(responseDTO.data);
      }

      final accessToken = response.headers["Authorization"]!.first;
      return (responseDTO, accessToken);
    } else {
      return (responseDTO, "");
    }
  }
}