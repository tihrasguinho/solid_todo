typedef AsyncResult<L, R> = Future<Result<L, R>>;

sealed class Result<L, R> {
  const Result();

  bool isLeft() => this is Left;

  L leftOrThrow() => switch (this) {
        Left l => l.left,
        _ => throw Exception('No left value found!'),
      };

  L leftOrElse(L Function() orElse) => switch (this) {
        Left l => l.left,
        _ => orElse(),
      };

  L? leftOrNull() => switch (this) {
        Left l => l.left,
        _ => null,
      };

  bool isRight() => this is Right;

  R rightOrThrow() => switch (this) {
        Right r => r.right,
        _ => throw Exception('No right value found!'),
      };

  R rightOrElse(R Function() orElse) => switch (this) {
        Right r => r.right,
        _ => orElse(),
      };

  R? rightOrNull() => switch (this) {
        Right r => r.right,
        _ => null,
      };

  S fold<S>(S Function(L) left, S Function(R) right) => switch (this) {
        Left l => left(l.left),
        Right r => right(r.right),
      };
}

final class Left<L, R> extends Result<L, R> {
  final L left;

  const Left(this.left);
}

final class Right<L, R> extends Result<L, R> {
  final R right;

  const Right(this.right);
}
