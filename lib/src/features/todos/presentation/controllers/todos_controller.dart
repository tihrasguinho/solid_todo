import 'package:flutter/material.dart';
import 'package:solid_todo/src/common/presentation/others/snackbars.dart';
import 'package:solid_todo/src/features/todos/domain/entities/todo_entity.dart';
import 'package:solid_todo/src/features/todos/presentation/states/todos_state.dart';

class TodosController extends ValueNotifier<TodosState> {
  TodosController() : super(const InitialTodosState());

  void load() {
    value = const SuccessTodosState([]);
  }

  void create({required String title, String? subtitle}) {
    final current = value.todos;

    final now = DateTime.now();

    value = SuccessTodosState(
      [
        ...current,
        TodoEntity(
          id: '${current.length + 1}',
          title: title,
          subtitle: subtitle,
          done: false,
          createdAt: now,
          updatedAt: now,
        ),
      ],
    );

    Snackbars.showSuccessSnackbar('Todo created.');
  }

  void delete(String id) {
    final current = value.todos;

    value = SuccessTodosState(
      current.where((todo) => todo.id != id).toList(),
    );
  }

  void toggle(String id) {
    final current = value.todos;

    value = SuccessTodosState(
      current.map((todo) {
        if (todo.id == id) {
          return todo.copyWith(
            done: !todo.done,
            updatedAt: DateTime.now(),
          );
        }
        return todo;
      }).toList(),
    );
  }
}
