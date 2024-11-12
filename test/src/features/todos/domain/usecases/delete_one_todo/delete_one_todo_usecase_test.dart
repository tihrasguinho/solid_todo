import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solid_todo/src/common/presentation/others/exceptions.dart';
import 'package:solid_todo/src/common/presentation/others/result.dart';
import 'package:solid_todo/src/features/todos/data/datasources/todos_datasource.dart';
import 'package:solid_todo/src/features/todos/data/repositories/todos_repository_imp.dart';
import 'package:solid_todo/src/features/todos/domain/repositories/todos_repository.dart';
import 'package:solid_todo/src/features/todos/domain/usecases/delete_one_todo/delete_one_todo_usecase.dart';
import 'package:solid_todo/src/features/todos/domain/usecases/delete_one_todo/delete_one_todo_usecase_imp.dart';

class TodosMockDatasource extends Mock implements TodosDatasource {}

void main() {
  late TodosDatasource datasource;
  late TodosRepository repository;
  late DeleteOneTodoUsecase usecase;

  setUpAll(() {
    datasource = TodosMockDatasource();
    repository = TodosRepositoryImp(datasource);
    usecase = DeleteOneTodoUsecaseImp(repository);
  });

  test('Must return an UsecaseException if id is empty', () async {
    final result = await usecase('');

    expect(result.isLeft(), isTrue);

    expect(result.leftOrThrow(), isA<UsecaseException>());

    expect(result.leftOrThrow().message, equals('ID is empty!'));
  });

  test('Must return null indicating that the todo was deleted', () async {
    when(() => datasource.deleteOneTodo('1')).thenAnswer((_) async => const Right(null));

    final result = await usecase('1');

    expect(result.isRight(), isTrue);
  });
}
