abstract class LoginRepositories {
  Future<bool> login(String emailValue, String passwordValue);

  Future<void> saveEmail(Map<String, dynamic> emailMap);

  Future<void> saveUser(Map<String, dynamic> userMap);

  Future<void> savePhone(Map<String, dynamic> phoneMap);
}
