import 'package:bloc/bloc.dart';
import 'package:meal_monkey/features/auth/data/models/user_data/user_model.dart';
import 'package:meal_monkey/features/auth/data/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  final AuthRepo authRepo;

  Future<void> registerUser({required Map<String,dynamic> body}) async {
    emit(AuthLoading());
    var result = await authRepo.registerUser(body);
    result.fold(
          (failure) => emit(
            AuthFailure(failure.errMessage),
      ),
          (user) => emit(
            AuthSuccess(user),
      ),
    );
  }
}
