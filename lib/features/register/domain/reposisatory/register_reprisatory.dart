import '../entities/register_entities.dart';

abstract class RegisterAccountRepository {
  // Future<BaseResponse> registerAccount(RegisterAccountEntity registerAccount);
  Future<RegisterAccountEntity> remoteRegisterUser(
      String email, String password,RegisterAccountEntity registerAccountEntity);
}
