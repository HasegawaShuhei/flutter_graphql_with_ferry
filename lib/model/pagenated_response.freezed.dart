// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pagenated_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PagenatedResponse<T> {
  List<T> get results => throw _privateConstructorUsedError;
  bool get hasNext => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PagenatedResponseCopyWith<T, PagenatedResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagenatedResponseCopyWith<T, $Res> {
  factory $PagenatedResponseCopyWith(PagenatedResponse<T> value,
          $Res Function(PagenatedResponse<T>) then) =
      _$PagenatedResponseCopyWithImpl<T, $Res>;
  $Res call({List<T> results, bool hasNext});
}

/// @nodoc
class _$PagenatedResponseCopyWithImpl<T, $Res>
    implements $PagenatedResponseCopyWith<T, $Res> {
  _$PagenatedResponseCopyWithImpl(this._value, this._then);

  final PagenatedResponse<T> _value;
  // ignore: unused_field
  final $Res Function(PagenatedResponse<T>) _then;

  @override
  $Res call({
    Object? results = freezed,
    Object? hasNext = freezed,
  }) {
    return _then(_value.copyWith(
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>,
      hasNext: hasNext == freezed
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_PagenatedResponseCopyWith<T, $Res>
    implements $PagenatedResponseCopyWith<T, $Res> {
  factory _$$_PagenatedResponseCopyWith(_$_PagenatedResponse<T> value,
          $Res Function(_$_PagenatedResponse<T>) then) =
      __$$_PagenatedResponseCopyWithImpl<T, $Res>;
  @override
  $Res call({List<T> results, bool hasNext});
}

/// @nodoc
class __$$_PagenatedResponseCopyWithImpl<T, $Res>
    extends _$PagenatedResponseCopyWithImpl<T, $Res>
    implements _$$_PagenatedResponseCopyWith<T, $Res> {
  __$$_PagenatedResponseCopyWithImpl(_$_PagenatedResponse<T> _value,
      $Res Function(_$_PagenatedResponse<T>) _then)
      : super(_value, (v) => _then(v as _$_PagenatedResponse<T>));

  @override
  _$_PagenatedResponse<T> get _value => super._value as _$_PagenatedResponse<T>;

  @override
  $Res call({
    Object? results = freezed,
    Object? hasNext = freezed,
  }) {
    return _then(_$_PagenatedResponse<T>(
      results: results == freezed
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>,
      hasNext: hasNext == freezed
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PagenatedResponse<T> implements _PagenatedResponse<T> {
  const _$_PagenatedResponse(
      {final List<T> results = const [], this.hasNext = false})
      : _results = results;

  final List<T> _results;
  @override
  @JsonKey()
  List<T> get results {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  @JsonKey()
  final bool hasNext;

  @override
  String toString() {
    return 'PagenatedResponse<$T>(results: $results, hasNext: $hasNext)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PagenatedResponse<T> &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            const DeepCollectionEquality().equals(other.hasNext, hasNext));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_results),
      const DeepCollectionEquality().hash(hasNext));

  @JsonKey(ignore: true)
  @override
  _$$_PagenatedResponseCopyWith<T, _$_PagenatedResponse<T>> get copyWith =>
      __$$_PagenatedResponseCopyWithImpl<T, _$_PagenatedResponse<T>>(
          this, _$identity);
}

abstract class _PagenatedResponse<T> implements PagenatedResponse<T> {
  const factory _PagenatedResponse(
      {final List<T> results, final bool hasNext}) = _$_PagenatedResponse<T>;

  @override
  List<T> get results;
  @override
  bool get hasNext;
  @override
  @JsonKey(ignore: true)
  _$$_PagenatedResponseCopyWith<T, _$_PagenatedResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
