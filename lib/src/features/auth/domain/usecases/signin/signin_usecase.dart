import 'package:solid_todo/src/common/presentation/others/exceptions.dart';
import 'package:solid_todo/src/common/presentation/others/result.dart';
import 'package:solid_todo/src/features/auth/domain/entities/user_entity.dart';

extension type SigninParams._(Map<String, String> _params) {
  SigninParams({
    required String email,
    required String password,
  }) : this._({'email': email, 'password': password});

  String get email => _params['email'] ?? '';

  String get password => _params['password'] ?? '';
}

abstract interface class SigninUsecase {
  AsyncResult<TodosException, UserEntity> call(SigninParams params);
}
