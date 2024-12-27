import 'package:bloc/bloc.dart';
import 'package:meal_monkey/features/auth/data/models/user_data/user_model.dart';
import 'package:meal_monkey/features/auth/data/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  // Email/Password Login
  Future<void> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    final body = {
      'email': email.trim(),
      'password': password.trim(),
    };

    var result = await authRepo.loginUser(body);
    result.fold(
      (failure) => emit(LoginFailure(failure.errMessage)),
      (user) => emit(LoginSuccess(user)),
    );
  }

  // Google Sign In
  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    var result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(LoginFailure(failure.errMessage)),
      (user) => emit(LoginSuccess(user)),
    );
  }

  // Facebook Sign In
  Future<void> loginWithFacebook() async {
    emit(LoginLoading());
    var result = await authRepo.signInWithFacebook();
    result.fold(
      (failure) => emit(LoginFailure(failure.errMessage)),
      (user) => emit(LoginSuccess(user)),
    );
  }

}
