import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solid_todo/src/common/presentation/others/result.dart';
import 'package:solid_todo/src/features/todos/data/datasources/todos_datasource.dart';
import 'package:solid_todo/src/features/todos/data/repositories/todos_repository_imp.dart';
import 'package:solid_todo/src/features/todos/domain/entities/todo_entity.dart';
import 'package:solid_todo/src/features/todos/domain/repositories/todos_repository.dart';
import 'package:solid_todo/src/features/todos/domain/usecases/find_many_todos/find_many_todos_usecase.dart';
import 'package:solid_todo/src/features/todos/domain/usecases/find_many_todos/find_many_todos_usecase_imp.dart';

class TodosMockDatasource extends Mock implements TodosDatasource {}

void main() {
  late TodosDatasource datasource;
  late TodosRepository repository;
  late FindManyTodosUsecase usecase;

  setUpAll(() {
    datasource = TodosMockDatasource();
    repository = TodosRepositoryImp(datasource);
    usecase = FindManyTodosUsecaseImp(repository);
  });

  test('Must return a List<TodoEntity>', () async {
    when(() => datasource.findManyTodos()).thenAnswer(
      (_) async => Right(
        [
          TodoEntity(
            id: '1',
            title: 'Title 1',
            subtitle: 'Subtitle',
            done: false,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
          TodoEntity(
            id: '2',
            title: 'Title 2',
            subtitle: 'Subtitle',
            done: false,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
          TodoEntity(
            id: '3',
            title: 'Title 3',
            subtitle: 'Subtitle',
            done: false,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        ],
      ),
    );

    final result = await usecase();

    expect(result.isRight(), isTrue);

    expect(result.rightOrThrow(), isA<List<TodoEntity>>());

    expect(result.rightOrThrow().length, equals(3));
  });
}
