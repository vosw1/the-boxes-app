import 'package:dio/dio.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: " http://192.168.219.111",
    contentType: "application/json; charset=utf8"
  )
);