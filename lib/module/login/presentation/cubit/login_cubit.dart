// ignore_for_file: use_build_context_synchronously

import 'package:task_intern_5_flutter/import.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  // final _userNameController = TextEditingController();

  // final _passwordController = TextEditingController();

  // void updateUsername() {
  //   emit(UpdateTextField(text: _userNameController.text));
  // }

  // void updatePassword() {
  //   emit(UpdateTextField(text: _passwordController.text));
  // }

  void onLoginSuccess(
      String username, String password, BuildContext context) async {
    emit(LoginLoading());
    try {
      final result = await LoginService().login(username, password);
      if (result == true && username.isNotEmpty && password.isNotEmpty) {
        await Future.delayed(const Duration(seconds: 3));
        emit(LoginSuccess());
        await Navigator.pushNamed(context, RouteName.dashboard);
        return onLoginSuccess(username, password, context);
      } else {
        emit(LoginLoading());
      }
    } catch (e) {
      emit(LoginError());
    }
  }
}
