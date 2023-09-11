import 'package:dio/dio.dart';

class BaseResponse {
  var data;
  int statusCode;
  String statusMessage;

  BaseResponse({this.data, this.statusCode = 500, this.statusMessage = ""});

  static BaseResponse fromJson(
    Response<dynamic> json,
  ) {
    return BaseResponse(
        data: json.data,
        statusCode: json.statusCode ?? 500,
        statusMessage: json.statusMessage ?? "");
  }
}


