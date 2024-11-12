import 'package:solid_todo/src/common/presentation/others/exceptions.dart';
import 'package:solid_todo/src/common/presentation/others/result.dart';
import 'package:solid_todo/src/features/auth/domain/entities/user_entity.dart';
import 'package:solid_todo/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:solid_todo/src/features/auth/domain/usecases/signup/signup_usecase.dart';

class SignupUsecaseImp implements SignupUsecase {
  final AuthRepository repository;

  const SignupUsecaseImp(this.repository);

  @override
  AsyncResult<TodosException, UserEntity> call(SignupParams params) async {
    if (params.name.isEmpty) {
      return const Left(UsecaseException('Name is empty!'));
    }

    bool isValidEmail() {
      final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

      return regex.hasMatch(params.email);
    }

    if (!isValidEmail()) {
      return const Left(UsecaseException('Email is invalid!'));
    }

    if (params.password.length < 6) {
      return const Left(UsecaseException('Password must have at least 6 characters!'));
    }

    return repository.signUp(params);
  }
}
