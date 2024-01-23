import 'package:dio/dio.dart';

class ApiCall {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.genius.com',
    ),
  )..interceptors.add(AuthorizationInterceptor());
}

class AuthorizationInterceptor extends Interceptor {
  // A variable or a function that returns the token value
  String get token =>
      'Y7b3oUWeEfeeUpggvq6ZqsT-JUS-G8817mgV0Ij8Qid1XI9fwh6CryNblRBwxRj8';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add the token to the header
    options.headers['Authorization'] = 'Bearer $token';
    // Continue the request
    handler.next(options);
  }
}
