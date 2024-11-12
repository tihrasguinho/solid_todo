import 'package:solid_todo/src/common/presentation/others/exceptions.dart';
import 'package:solid_todo/src/common/presentation/others/result.dart';
import 'package:solid_todo/src/features/auth/domain/entities/user_entity.dart';
import 'package:solid_todo/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:solid_todo/src/features/auth/domain/usecases/signin/signin_usecase.dart';

class SigninUsecaseImp implements SigninUsecase {
  final AuthRepository repository;

  const SigninUsecaseImp(this.repository);

  @override
  AsyncResult<TodosException, UserEntity> call(SigninParams params) async {
    bool isValidEmail() {
      final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

      return regex.hasMatch(params.email);
    }

    if (!isValidEmail()) {
      return const Left(UsecaseException('Email is invalid!'));
    }

    if (params.password.isEmpty) {
      return const Left(UsecaseException('Password is empty!'));
    }

    return repository.signIn(params);
  }
}
