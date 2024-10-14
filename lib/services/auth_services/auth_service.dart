import 'package:dio/dio.dart' as dio;
import 'package:sherrbet/services/config.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final dio.Dio _dio;
  final _secureStorage = const FlutterSecureStorage();

  //inizializzo
  AuthService() : _dio = dio.Dio();

  //metodo per login

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '${Config.baseUrl}/api/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      //controllo della risposta
      if (response.data is Map<String, dynamic>) {
        print('Response: ${response.data}');

        //salvo il token
        String token = response.data['token'];
        await _secureStorage.write(key: 'token', value: token);

        return response.data as Map<String, dynamic>;
      } else {
        throw Exception('La risposta non è nel formato atteso.');
      }
    } on dio.DioException catch (e) {
      //errori dall chiamata
      throw Exception(
          'Fail: ${e.response?.statusCode}:${e.response?.statusMessage}');
    } catch (e) {
      //altri errori
      throw Exception('Errore inaspettato: $e');
    }
  }
  //metodo registrazione
  //TODO ...
}
