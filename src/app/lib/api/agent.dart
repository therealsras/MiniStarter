import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:app/api/error_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'jwt_interceptor.dart';

class Agent {
  static final Agent _instance = Agent._();
  factory Agent() => _instance;

  final Dio _dio = Dio();
  final plainResponseOptions = Options(responseType: ResponseType.plain);

  Agent._() {
    // self-signed certificate for https workaround
    if (Platform.isIOS || Platform.isMacOS) {
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }
    var options = BaseOptions(
      baseUrl: dotenv.env['BASE_URL']!,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 50),
    );
    _dio.options = options;
    _dio.interceptors.addAll({
      JwtInterceptor(dio: _dio),
      ErrorInterceptor(dio: _dio),
    });
  }

  // Auditing
  Future<Response> getAudits() async =>
      _dio.get('auditlogs/all', options: plainResponseOptions);

  // Account
  Future<Response> loginUser(Map<String, dynamic> login) async =>
      _dio.post('account/login', data: jsonEncode(login));
  Future<Response> refreshToken(Map<String, dynamic> request) async =>
      _dio.post('account/refresh-token', data: jsonEncode(request));
  Future<Response> registerUser(Map<String, dynamic> user) async =>
      _dio.post('account/register', data: {user});
  Future<Response> confirmEmail(Map<String, dynamic> params) async =>
      _dio.post('account/confirm-email', queryParameters: params);
  // static Future<Response> confirmPhoneNumber(
  //         Map<String, dynamic> params) async =>
  //     _dio.post('account/confirm-phone-number', queryParameters: params);
  // static Future<Response> forgotPassword(String email) async =>
  //     _dio.post('account/forgot-password', data: {email});
  // static Future<Response> resetPassword(ResetPassword resetPassword) async =>
  //     _dio.post('account/reset-password', data: {resetPassword});

  // User
  Future<Response> getAllUsers(Map<String, dynamic>? queryParameters) async =>
      _dio.get('users',
          queryParameters: queryParameters, options: plainResponseOptions);
}
