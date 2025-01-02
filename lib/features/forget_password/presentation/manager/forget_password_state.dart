part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}
final class ForgetPasswordLoading extends ForgetPasswordState {}
final class ForgetPasswordSuccess extends ForgetPasswordState {
  final bool status;
  final String message;
  final dynamic data;

  ForgetPasswordSuccess({
    required this.status,
    required this.message,
    this.data,
  });
}
final class ForgetPasswordFailure extends ForgetPasswordState {
  final String errMsg;

  ForgetPasswordFailure({required this.errMsg});
}
