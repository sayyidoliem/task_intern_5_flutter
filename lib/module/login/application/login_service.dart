import 'package:task_intern_5_flutter/import.dart';

class LoginService implements LoginRepositories {
  final loginUrl = '${BaseUrl.url}auth/login';

  @override
  Future<bool> login(String emailValue, String passwordValue) async {
    try {
      Dio dio = Dio();
      Response response = await dio.post(loginUrl,
          queryParameters: {'email': emailValue, 'password': passwordValue});
      print('Login Response Data: ${response.data}');
      print('Status message: ${response.data['status']}');
      if (response.statusCode == 200 && response.data['status'] == true) {
        await saveEmail(response.data);
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
  Future<void> saveEmail(Map<String, dynamic> emailMap) async {
    final data = emailMap['user']['email'];
    await UserStorage.saveEmail(data);
  }

  @override
  Future<void> savePhone(Map<String, dynamic> phoneMap) async {
    final data = phoneMap['user']['phone_number'];
    await UserStorage.savePhone(data);
  }

  @override
  Future<void> saveUser(Map<String, dynamic> userMap) async {
    final data = userMap['user']['name'];
    await UserStorage.saveUser(data);
  }
}
