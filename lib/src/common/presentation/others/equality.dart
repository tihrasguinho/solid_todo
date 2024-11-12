abstract class Equality {
  const Equality();

  List<Object?> get props;

  @override
  String toString() {
    return '$runtimeType(${props.join(', ')})';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    bool listEquals(List<Object?> a, List<Object?> b) {
      if (a.length != b.length) return false;
      for (int i = 0; i < a.length; i++) {
        if (a[i] != b[i]) return false;
      }
      return true;
    }

    return other is Equality && listEquals(props, other.props);
  }

  @override
  int get hashCode => Object.hashAll(props);
}
