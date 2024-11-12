import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:solid_todo/src/common/presentation/others/provider.dart';
import 'package:solid_todo/src/common/presentation/others/snackbars.dart';
import 'package:solid_todo/src/features/auth/presentation/pages/signin_page.dart';
import 'package:solid_todo/src/features/auth/presentation/pages/signup_page.dart';
import 'package:solid_todo/src/features/todos/presentation/controllers/todos_controller.dart';
import 'package:solid_todo/src/features/todos/presentation/pages/todos_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderMany(
      providers: [
        Provider<TodosController>(notifier: TodosController()),
      ],
      child: ShadApp.material(
        debugShowCheckedModeBanner: false,
        builder: Snackbars.builder,
        title: 'Solid TODO',
        initialRoute: '/todos',
        onGenerateRoute: (settings) => switch (settings.name) {
          '/todos' => defaultPageBuilder(
              settings: settings,
              child: const TodosPage(),
            ),
          '/signin' => defaultPageBuilder(
              settings: settings,
              child: const SigninPage(),
            ),
          '/signup' => defaultPageBuilder(
              settings: settings,
              child: const SignupPage(),
            ),
          _ => defaultPageBuilder(
              settings: settings,
              child: const Placeholder(),
            ),
        },
      ),
    );
  }
}

PageRouteBuilder<T> defaultPageBuilder<T>({
  required RouteSettings settings,
  required Widget child,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionDuration: const Duration(milliseconds: 350),
    reverseTransitionDuration: const Duration(milliseconds: 350),
    transitionsBuilder: (context, animation, _, child) {
      return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.linear),
        child: child,
      );
    },
    pageBuilder: (context, _, __) => child,
  );
}
