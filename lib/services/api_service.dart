import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://reqres.in/api',
      headers: {
        'x-api-key': 'free_user_3CqevLLX1oEjUKSE1DXmkoWKjlR',
      },
    ),
  );

  Future<Map<String, dynamic>?> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        '/login',
        data: {
          "email": email,
          "password": password,
        },
      );

      return response.data;
    } catch (e) {
      return null;
    }
  }
}
