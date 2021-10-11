import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:qart_fashion/utilities/app_string.dart';

import 'http_constant.dart';

class ApiManager {
  //MARK: - POST API Call
  Future<dynamic> postAPICall(String url, Map param) async {
    print("Calling API: $url");
    print("Calling parameters: $param");
    var responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: param)
          .timeout(Duration(seconds: API_TIME_OUT_WRITE));
      responseJson = _response(response);
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      FetchDataException(
          'Timeout while communicating with server.Please check internet and try again');
    }
    return responseJson;
  }

  //MARK: - GET API Call
  Future<dynamic> getApiCall(String url) async {
    var responseJson;
    try {
      print(url);
      final response = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: API_TIME_OUT_READ));
      responseJson = _response(response);
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      FetchDataException(
          'Timeout while communicating with server.Please check internet and try again');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occur while Communication with Server with StatusCode: ${response.statusCode}');
    }
  }
}

//MARK: - Error Types
class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([message]) : super(message, "Invalid Input: ");
}

class NoInternetException extends CustomException {
  @override
  String toString() {
    return alert_no_internet_connection;
  }
}
