import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_boxes/_core/constants/dio.dart';
import 'package:the_boxes/_core/constants/move.dart';
import 'package:the_boxes/data/dto/join_req_dto.dart';
import 'package:the_boxes/data/dto/res_dto.dart';
import 'package:the_boxes/data/model/user.dart';
import 'package:the_boxes/data/repository/user_repository.dart';
import 'package:the_boxes/main.dart';

class SessionUser {
  User? user;
  String? accessToken;
  bool isLogin = false;
  bool isJoin = false;
  int? selectedPostId;

  SessionUser();
}

// 창고
class SessionStore extends SessionUser {
  final mContext = navigatorKey.currentContext;

  SessionStore();

  // 로그아웃
  Future<void> logout() async {
    super.user = null;
    super.accessToken = null;
    super.isLogin = false;
    await secureStorage.delete(key: "accessToken");
    navigatorKey.currentState
        ?.pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }

  void loginCheck(String path) {
    if (isLogin) {
      Navigator.pushNamed(mContext!, path);
    } else {
      Navigator.pushNamed(mContext!, Move.loginPage);
    }
  }

  void joinCheck(String path) {
    if (isJoin) {
      Navigator.pushNamed(mContext!, path);
    } else {
      Navigator.pushNamed(mContext!, Move.joinPage);
    }
  }

  Future<void> join(JoinReqDTO joinReqDTO) async {
    ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);

    if (responseDTO.status == 200) {
      this.user = User.fromJson(responseDTO.body);
      this.isJoin = true;
      this.isLogin = true;
      this.accessToken = responseDTO.body["accessToken"];
      await secureStorage.write(key: "accessToken", value: this.accessToken);
    } else {
      _showErrorDialog("회원가입 실패", '${responseDTO.errorMessage}');
    }
  }

  Future<void> login(LoginReqDTO loginReqDTO) async {
    var (responseDTO, accessToken) =
        await UserRepository().fetchLogin(loginReqDTO);

    if (responseDTO.status == 200) {
      if (secureStorage != null) {
        await secureStorage.write(key: "accessToken", value: accessToken);
      } else {
        print('Secure storage is null');
      }

      if (responseDTO.body != null) {
        this.user = responseDTO.body;
      } else {
        print('Response body is null');
      }

      this.accessToken = accessToken;
      this.isLogin = true;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        final context = navigatorKey.currentContext;
        if (context != null) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/home', (Route<dynamic> route) => false);
        } else {
          print('Navigator context is null');
        }
      });
    }
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: mContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Center(
                  child: Text("확인", style: TextStyle(color: Colors.redAccent))),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

// 창고 관리자
final sessionProvider = StateProvider<SessionStore>((ref) {
  return SessionStore();
});
