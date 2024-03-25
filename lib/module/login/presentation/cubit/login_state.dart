part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginError extends LoginState {}

final class UpdateTextField extends LoginState{
  final String text;

  UpdateTextField({required this.text});
}