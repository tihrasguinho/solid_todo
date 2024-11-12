import 'package:solid_todo/src/common/presentation/others/exceptions.dart';
import 'package:solid_todo/src/common/presentation/others/result.dart';
import 'package:solid_todo/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:solid_todo/src/features/auth/domain/usecases/signout/signout_usecase.dart';

class SignoutUsecaseImp implements SignoutUsecase {
  final AuthRepository repository;

  const SignoutUsecaseImp(this.repository);

  @override
  AsyncResult<TodosException, bool> call() {
    return repository.signOut();
  }
}
