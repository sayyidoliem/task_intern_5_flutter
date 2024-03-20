import 'package:task_intern_5_flutter/import.dart';

class LoginService with LoginInterceptor implements LoginRepositories {
  final loginUrl = 'auth/login';

  @override
  Future<bool> login(String emailValue, String passwordValue) async {
    try {
      final dio = await loginInterceptor();
      Response response = await dio.post(loginUrl,
          data: {'email': emailValue, 'password': passwordValue});
      if (response.statusCode == 200 && response.statusMessage == true) {
        await saveUserData(response.data);
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      print("ERROR FROM DIO EXCEPTION : ${e.toString()}");
      if (e.response != null) {
        print('Error data: ${e.response}');
      }
      return false;
    }
  }

  @override
  Future<void> saveUserData(Map<String, dynamic> userDataList) {
    // TODO: implement saveUserData
    throw UnimplementedError();
  }
}
