import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solid_todo/src/common/presentation/others/exceptions.dart';
import 'package:solid_todo/src/common/presentation/others/result.dart';
import 'package:solid_todo/src/features/todos/data/datasources/todos_datasource.dart';
import 'package:solid_todo/src/features/todos/data/repositories/todos_repository_imp.dart';
import 'package:solid_todo/src/features/todos/domain/entities/todo_entity.dart';
import 'package:solid_todo/src/features/todos/domain/repositories/todos_repository.dart';
import 'package:solid_todo/src/features/todos/domain/usecases/create_one_todo/create_one_todo_usecase.dart';
import 'package:solid_todo/src/features/todos/domain/usecases/create_one_todo/create_one_todo_usecase_imp.dart';

class TodosMockDatasource extends Mock implements TodosDatasource {}

void main() {
  late TodosDatasource datasource;
  late TodosRepository repository;
  late CreateOneTodoUsecase usecase;

  setUpAll(() {
    datasource = TodosMockDatasource();
    repository = TodosRepositoryImp(datasource);
    usecase = CreateOneTodoUsecaseImp(repository);
  });

  test('Must return an UsecaseException if title is empty', () async {
    final result = await usecase(CreateOneTodoParams(title: ''));

    expect(result.isLeft(), isTrue);

    expect(result.leftOrThrow(), isA<UsecaseException>());

    expect(result.leftOrThrow().message, equals('Title is empty!'));
  });

  test('Must return an UsecaseException if subtitle is empty', () async {
    final result = await usecase(CreateOneTodoParams(title: 'Title', subtitle: ''));

    expect(result.isLeft(), isTrue);

    expect(result.leftOrThrow(), isA<UsecaseException>());

    expect(result.leftOrThrow().message, equals('Subtitle is empty!'));
  });

  test('Must return a TodoEntity', () async {
    final params = CreateOneTodoParams(title: 'Title', subtitle: 'Subtitle');

    when(() => datasource.createOneTodo(params)).thenAnswer(
      (_) async => Right(
        TodoEntity(
          id: '1',
          title: 'Title',
          subtitle: 'Subtitle',
          done: false,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ),
    );

    final result = await usecase(params);

    expect(result.isRight(), isTrue);

    expect(result.rightOrThrow(), isA<TodoEntity>());

    expect(result.rightOrThrow().title, equals('Title'));
  });
}
