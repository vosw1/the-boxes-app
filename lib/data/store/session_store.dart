import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_boxes/_core/constants/dio.dart';
import 'package:the_boxes/_core/constants/move.dart';
import 'package:the_boxes/data/dto/join_req_dto.dart';
import 'package:the_boxes/data/dto/res_dto.dart';
import 'package:the_boxes/data/repository/user_repository.dart';
import 'package:the_boxes/main.dart';

import '../model/user.dart';

class SessionUser {
  User? user;
  String? accessToken;
  bool isLogin = false;
  bool isJoin = false;
  int? selectedPostId;
  SessionUser();
}

class SessionStore extends SessionUser {
  final mContext = navigatorKey.currentContext;
  SessionStore();
  // 로그아웃
  Future<void> logout() async {
    super.user = null;
    super.accessToken = null;
    super.isLogin = false;
    await secureStorage.delete(key: "accessToken");
    navigatorKey.currentState?.pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
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
    try {
      final loginResponse = await UserRepository().fetchLogin(loginReqDTO);
      final responseDTO = loginResponse['responseDTO'] as ResponseDTO;
      final accessToken = loginResponse['accessToken'] as String;

      if (responseDTO.status == 200) {
        await secureStorage.write(key: "accessToken", value: accessToken);
        this.user = User.fromJson(responseDTO.body);
        this.accessToken = accessToken;
        this.isLogin = true;
      } else {
        _showErrorDialog("로그인 실패", '${responseDTO.errorMessage}');
      }
    } catch (e) {
      _showErrorDialog("로그인 오류", '예상치 못한 오류가 발생했습니다: $e');
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
              child: Center(child: Text("확인", style: TextStyle(color: Colors.redAccent))),
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