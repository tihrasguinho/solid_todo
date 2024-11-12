import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solid_todo/src/common/presentation/others/exceptions.dart';
import 'package:solid_todo/src/common/presentation/others/result.dart';
import 'package:solid_todo/src/features/todos/data/datasources/todos_datasource.dart';
import 'package:solid_todo/src/features/todos/data/repositories/todos_repository_imp.dart';
import 'package:solid_todo/src/features/todos/domain/entities/todo_entity.dart';
import 'package:solid_todo/src/features/todos/domain/repositories/todos_repository.dart';
import 'package:solid_todo/src/features/todos/domain/usecases/find_one_todo/find_one_todo_usecase.dart';
import 'package:solid_todo/src/features/todos/domain/usecases/find_one_todo/find_one_todo_usecase_imp.dart';

class TodosMockDatasource extends Mock implements TodosDatasource {}

void main() {
  late TodosDatasource datasource;
  late TodosRepository repository;
  late FindOneTodoUsecase usecase;

  setUpAll(() {
    datasource = TodosMockDatasource();
    repository = TodosRepositoryImp(datasource);
    usecase = FindOneTodoUsecaseImp(repository);
  });

  test('Must return an UsecaseException if id is empty', () async {
    final result = await usecase('');

    expect(result.isLeft(), isTrue);

    expect(result.leftOrThrow(), isA<UsecaseException>());

    expect(result.leftOrThrow().message, equals('ID is empty!'));
  });

  test('Must return a TodoEntity', () async {
    when(() => datasource.findOneTodo('1')).thenAnswer(
      (_) async => Right(
        TodoEntity(
          id: '1',
          title: 'Title 1',
          subtitle: 'Subtitle',
          done: false,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ),
    );

    final result = await usecase('1');

    expect(result.isRight(), isTrue);

    expect(result.rightOrThrow(), isA<TodoEntity>());

    expect(result.rightOrThrow().id, equals('1'));
  });
}
