import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solid_todo/src/common/presentation/others/exceptions.dart';
import 'package:solid_todo/src/common/presentation/others/result.dart';
import 'package:solid_todo/src/features/auth/data/datasources/auth_datasource.dart';
import 'package:solid_todo/src/features/auth/data/repositories/auth_repository_imp.dart';
import 'package:solid_todo/src/features/auth/domain/entities/user_entity.dart';
import 'package:solid_todo/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:solid_todo/src/features/auth/domain/usecases/signup/signup_usecase.dart';
import 'package:solid_todo/src/features/auth/domain/usecases/signup/signup_usecase_imp.dart';

class AuthMockDatasource extends Mock implements AuthDatasource {}

void main() {
  late AuthDatasource datasource;
  late SignupUsecase usecase;
  late AuthRepository repository;

  setUpAll(() {
    datasource = AuthMockDatasource();
    repository = AuthRepositoryImp(datasource);
    usecase = SignupUsecaseImp(repository);
  });

  test('Must return an UsecaseException if name is empty', () async {
    final result = await usecase(SignupParams(name: '', email: 'tiago@gmail.com', password: '123456'));

    expect(result.isLeft(), isTrue);

    expect(result.leftOrThrow(), isA<UsecaseException>());

    expect(result.leftOrThrow().message, 'Name is empty!');
  });

  test('Must return an UsecaseException if email is invalid', () async {
    final result = await usecase(SignupParams(name: 'Tiago', email: 'tiago.com', password: '123456'));

    expect(result.isLeft(), isTrue);

    expect(result.leftOrThrow(), isA<UsecaseException>());

    expect(result.leftOrThrow().message, equals('Email is invalid!'));
  });

  test('Must return an UsecaseException if password has less than 6 characters', () async {
    final result = await usecase(SignupParams(name: 'Tiago', email: 'tiago@gmail.com', password: '1'));

    expect(result.isLeft(), isTrue);

    expect(result.leftOrThrow(), isA<UsecaseException>());

    expect(result.leftOrThrow().message, equals('Password must have at least 6 characters!'));
  });

  test('Must return an UserEntity', () async {
    when(() => datasource.signUp(any())).thenAnswer(
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

    final result = await usecase(SignupParams(name: 'Tiago', email: 'tiago@gmail.com', password: '123456'));

    expect(result.isRight(), isTrue);

    expect(result.rightOrThrow(), isA<UserEntity>());

    expect(result.rightOrThrow().email, equals('tiago@gmail.com'));
  });
}
