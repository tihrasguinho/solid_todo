import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solid_todo/src/common/presentation/others/exceptions.dart';
import 'package:solid_todo/src/common/presentation/others/result.dart';
import 'package:solid_todo/src/features/auth/data/datasources/auth_datasource.dart';
import 'package:solid_todo/src/features/auth/data/repositories/auth_repository_imp.dart';
import 'package:solid_todo/src/features/auth/domain/entities/user_entity.dart';
import 'package:solid_todo/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:solid_todo/src/features/auth/domain/usecases/signin/signin_usecase.dart';
import 'package:solid_todo/src/features/auth/domain/usecases/signin/signin_usecase_imp.dart';

class AuthMockDatasource extends Mock implements AuthDatasource {}

void main() {
  late AuthDatasource datasource;
  late AuthRepository repository;
  late SigninUsecase usecase;

  setUpAll(() {
    datasource = AuthMockDatasource();
    repository = AuthRepositoryImp(datasource);
    usecase = SigninUsecaseImp(repository);
  });

  test('Must return an UsecaseException if email is not valid', () async {
    final result = await usecase(SigninParams(email: 'tiago', password: '123456'));

    expect(result.isLeft(), isTrue);

    expect(result.leftOrThrow(), isA<UsecaseException>());

    expect(result.leftOrThrow().message, equals('Email is invalid!'));
  });

  test('Must return an UsecaseException if password is empty', () async {
    final result = await usecase(SigninParams(email: 'tiago@gmail.com', password: ''));

    expect(result.isLeft(), isTrue);

    expect(result.leftOrThrow(), isA<UsecaseException>());

    expect(result.leftOrThrow().message, equals('Password is empty!'));
  });

  test('Must return an UserEntity', () async {
    when(() => datasource.signIn(SigninParams(email: 'tiago@gmail.com', password: '123456'))).thenAnswer(
      (_) async => const Right(
        UserEntity(
          id: '1',
          name: 'Tiago',
          email: 'tiago@gmail.com',
          password: '123456',
          image: '',
        ),
      ),
    );

    final result = await usecase(SigninParams(email: 'tiago@gmail.com', password: '123456'));

    expect(result.isRight(), isTrue);

    expect(result.rightOrThrow(), isA<UserEntity>());

    expect(result.rightOrThrow().email, equals('tiago@gmail.com'));
  });
}
