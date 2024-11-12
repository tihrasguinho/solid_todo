import 'package:flutter/material.dart';
import 'package:solid_todo/src/common/presentation/extensions/date_time_ext.dart';
import 'package:solid_todo/src/common/presentation/others/provider.dart';
import 'package:solid_todo/src/features/todos/presentation/controllers/todos_controller.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<TodosController>(context);

    return ValueListenableBuilder(
      valueListenable: bloc,
      builder: (context, state, child) {
        return state.when(
          onInitial: () => Scaffold(
            body: Center(
              child: TextButton(
                onPressed: () => bloc.load(),
                child: const Text('Load Todos'),
              ),
            ),
          ),
          onSuccess: (todos) => Scaffold(
            body: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];

                return Tooltip(
                  message: 'CREATED ${todo.createdAt.yyyymmddhhmmss}; UPDATED ${todo.updatedAt.yyyymmddhhmmss}',
                  child: ListTile(
                    onLongPress: () => bloc.delete(todo.id),
                    title: Text(todo.title),
                    subtitle: switch (todo.subtitle != null) {
                      true => Text(todo.subtitle ?? '--'),
                      false => null,
                    },
                    trailing: IconButton(
                      icon: switch (todo.done) {
                        true => const Icon(Icons.done_sharp, color: Colors.green),
                        false => const Icon(Icons.done, color: Colors.grey),
                      },
                      onPressed: () => bloc.toggle(todo.id),
                    ),
                  ),
                );
              },
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () => bloc.create(
                title: 'New todo',
                subtitle: 'New todo description',
              ),
              label: const Text('Add todo'),
            ),
          ),
        );
      },
    );
  }
}
