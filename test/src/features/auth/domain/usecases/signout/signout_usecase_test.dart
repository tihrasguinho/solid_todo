import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solid_todo/src/common/presentation/others/result.dart';
import 'package:solid_todo/src/features/auth/data/datasources/auth_datasource.dart';
import 'package:solid_todo/src/features/auth/data/repositories/auth_repository_imp.dart';
import 'package:solid_todo/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:solid_todo/src/features/auth/domain/usecases/signout/signout_usecase.dart';
import 'package:solid_todo/src/features/auth/domain/usecases/signout/signout_usecase_imp.dart';

class AuthMockDatasource extends Mock implements AuthDatasource {}

void main() {
  late AuthDatasource datasource;
  late AuthRepository repository;
  late SignoutUsecase usecase;

  setUpAll(() {
    datasource = AuthMockDatasource();
    repository = AuthRepositoryImp(datasource);
    usecase = SignoutUsecaseImp(repository);
  });

  test('Must return true indicating that the user was signed out', () async {
    when(() => datasource.signOut()).thenAnswer((_) async => const Right(true));

    final result = await usecase.call();

    expect(result.isRight(), isTrue);

    expect(result.rightOrThrow(), isTrue);
  });
}
