import 'package:bloc/bloc.dart';
import 'package:meal_monkey/features/forget_password/data/repos/forget_password_repo.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.forgetPasswordRepo) : super(ForgetPasswordInitial());
  final ForgetPasswordRepo forgetPasswordRepo;

  void verifyEmail(String email) async {
    emit(ForgetPasswordLoading());
    final result = await forgetPasswordRepo.verifyEmail(email);
    result.fold(
      (l) => emit(ForgetPasswordFailure(errMsg: l.toString())),
      (r) => emit(ForgetPasswordSuccess(status: r, message: 'Email verified successfully')),
    );
  }
}
