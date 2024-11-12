import 'package:solid_todo/src/common/presentation/others/equality.dart';

class TodoEntity extends Equality {
  final String id;
  final String title;
  final String? subtitle;
  final bool done;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TodoEntity({
    required this.id,
    required this.title,
    this.subtitle,
    required this.done,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, title, subtitle, done, createdAt, updatedAt];

  TodoEntity copyWith({
    String? id,
    String? title,
    String? Function()? subtitle,
    bool? done,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TodoEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle != null ? subtitle() : this.subtitle,
      done: done ?? this.done,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
