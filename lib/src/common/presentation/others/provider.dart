import 'package:flutter/material.dart';

const _emptyKey = ValueKey('__EmptyKey__');

class Provider<T extends Listenable> extends InheritedNotifier<T> {
  const Provider({
    super.key,
    required super.notifier,
    Widget? child,
  }) : super(child: child ?? const SizedBox.shrink(key: _emptyKey));

  static T of<T extends Listenable>(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<Provider<T>>();

    if (provider == null) {
      throw Exception('Provider not found');
    }

    return provider.notifier!;
  }

  @override
  bool updateShouldNotify(covariant InheritedNotifier<T> oldWidget) {
    return true;
  }

  Provider<T> change({
    required Widget? child,
  }) {
    return Provider<T>(
      key: key,
      notifier: notifier,
      child: child,
    );
  }
}

class ProviderMany extends StatelessWidget {
  ProviderMany({
    super.key,
    required this.providers,
    required this.child,
  }) {
    assert(() {
      return true;
    }());
  }

  final Widget child;
  final List<Provider> providers;

  @override
  Widget build(BuildContext context) {
    Widget current = child;

    for (final provider in providers) {
      if (provider.child.key == _emptyKey) {
        current = provider.change(child: current);
      } else {
        current = provider;
      }
    }

    return current;
  }
}
