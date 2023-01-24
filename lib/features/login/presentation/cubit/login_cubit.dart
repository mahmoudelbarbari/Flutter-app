import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order/features/login/domain/usecases/login_usecase.dart';
import 'package:order/features/login/domain/usecases/remote_login_usecase.dart';
import 'package:order/features/login/presentation/cubit/login_state.dart';
import 'package:order/injection_container.dart';

class LoginCubit extends Cubit<LoginState> {
  late LoginUsecase loginUsecase;
  late RemoteLoginUsecase remoteLoginUsecase;

  LoginCubit() : super(LoginStateInt());

  Future<void> remoteLogin(String email, String password) async {
    emit(LoginStateLoading());

    final remoteLoginUsecase = RemoteLoginUsecase(sl());

    try {
      final loggedin = await remoteLoginUsecase.call(email, password);
      // return emit(LoginSucessState("Successfully Login"));
      if (loggedin.status) {
        return emit(LoginSucessState("Successfully Login"));
      } else {
        return emit(ErrorState(errorMessage: "Faild to login"));
      }
    } on FirebaseAuthException catch (e) {
      emit(ErrorState(
        errorMessage: e.message.toString(),
      ));
    }
  }

  Future<void> login(String username, String password) async {
    try {
      emit(LoginStateLoading());

      final logedin = await loginUsecase.call(username, password);
      if (logedin.status) {
        emit(SuccessState(logedin));
      } else {
        emit(ErrorState(errorMessage: logedin.message));
      }
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}
