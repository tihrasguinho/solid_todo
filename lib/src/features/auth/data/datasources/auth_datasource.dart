import 'package:solid_todo/src/common/presentation/others/exceptions.dart';
import 'package:solid_todo/src/common/presentation/others/result.dart';
import 'package:solid_todo/src/features/auth/domain/entities/user_entity.dart';
import 'package:solid_todo/src/features/auth/domain/usecases/signin/signin_usecase.dart';
import 'package:solid_todo/src/features/auth/domain/usecases/signup/signup_usecase.dart';

abstract interface class AuthDatasource {
  AsyncResult<TodosException, UserEntity> signIn(SigninParams params);
  AsyncResult<TodosException, UserEntity> signUp(SignupParams params);
  AsyncResult<TodosException, bool> signOut();
}
