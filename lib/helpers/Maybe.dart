// This class serves as a "nullable" wrapper around
// types to guarantee typechecked null-safety.
// Maybe also considers the empty string ("")
// and an empty iterable as nothing. We can
// deprecate this helper when non-nullable types
// finally land.
// (https://github.com/dart-lang/language/issues/110)

class Maybe<T> {

  final T _value;

  /// Create an empty Maybe.
  const Maybe.nothing() : _value = null;

  /// Wrap [value] into a Maybe.
  const Maybe.from(T value) : _value = value;

  /// Returns whether this Maybe contains a value.
  bool get isSomething => _value != null && _value != "" && (_value is Iterable ? (_value as Iterable).isNotEmpty : true);

  /// Returns whether this Maybe contains no value.
  bool get isNothing => !isSomething;

  /// Returns the value of this Maybe, or [alternative] if the Maybe has no value.
  T or(T alternative) => (isSomething) ? _value : alternative;

  /// Returns [alternative] if this Maybe holds no value, otherwise it returns [this].
  Maybe<T> orMaybe(T alternative) => (isSomething) ? this : Maybe.from(alternative);

  /// Returns the value of this Maybe.
  T unwrap() => _value;

  /// Maps the value of this Maybe with [mapper], and wraps it in another Maybe.
  Maybe<T2> map<T2>(T2 Function(T) mapper) => (isSomething) ? Maybe.from(mapper(_value)) : Maybe.nothing();

  /// Runs a function [handler] when this Maybe holds a value.
  void afterwards(void Function(T) handler) { if (isSomething) handler(_value); }

  @override
  bool operator == (other) => other is Maybe<T> && other._value == _value;

  @override
  String toString() =>
      (isSomething) ? "Maybe { value: $_value }" : "nothing";

}