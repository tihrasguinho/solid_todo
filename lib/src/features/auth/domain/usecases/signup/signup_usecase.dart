import 'package:solid_todo/src/common/presentation/others/exceptions.dart';
import 'package:solid_todo/src/common/presentation/others/result.dart';
import 'package:solid_todo/src/features/auth/domain/entities/user_entity.dart';

extension type SignupParams._(Map<String, String> _params) {
  SignupParams({
    required String name,
    required String email,
    required String password,
  }) : this._({'name': name, 'email': email, 'password': password});

  String get name => _params['name'] ?? '';

  String get email => _params['email'] ?? '';

  String get password => _params['password'] ?? '';
}

abstract interface class SignupUsecase {
  AsyncResult<TodosException, UserEntity> call(SignupParams params);
}
