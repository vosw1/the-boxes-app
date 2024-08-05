

import 'package:the_boxes/data/dto/join_req_dto.dart';
import 'package:the_boxes/data/repository/user_repository.dart';

void main() async {
  await fetchLoginTest();
}

Future<void> fetchLoginTest() async {
  // given
  LoginReqDTO requestDTO = LoginReqDTO(
    username: "asdf",
    password: "as1234",
  );

  // Send join request
  final response = await UserRepository().fetchLogin(requestDTO);

  // Log response
  print("Login Response: $response");
}
