import 'package:solid_todo/src/common/presentation/others/exceptions.dart';
import 'package:solid_todo/src/common/presentation/others/result.dart';
import 'package:solid_todo/src/features/auth/data/datasources/auth_datasource.dart';
import 'package:solid_todo/src/features/auth/domain/entities/user_entity.dart';
import 'package:solid_todo/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:solid_todo/src/features/auth/domain/usecases/signin/signin_usecase.dart';
import 'package:solid_todo/src/features/auth/domain/usecases/signup/signup_usecase.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthDatasource datasource;

  const AuthRepositoryImp(this.datasource);

  @override
  AsyncResult<TodosException, UserEntity> signUp(SignupParams params) {
    return datasource.signUp(params);
  }

  @override
  AsyncResult<TodosException, UserEntity> signIn(SigninParams params) {
    return datasource.signIn(params);
  }

  @override
  AsyncResult<TodosException, bool> signOut() {
    return datasource.signOut();
  }
}
