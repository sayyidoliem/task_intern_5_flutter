abstract class LoginRepositories {
  Future<bool> login(String emailValue, String passwordValue);

  Future<void> saveUserData(Map<String, dynamic> userDataList);
}
