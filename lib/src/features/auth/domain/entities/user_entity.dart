import 'package:solid_todo/src/common/presentation/others/equality.dart';

class UserEntity extends Equality {
  final String id;
  final String name;
  final String email;
  final String password;
  final String image;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, email, password, image];
}
