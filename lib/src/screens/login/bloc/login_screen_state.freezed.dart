// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginScreenState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() processing,
    required TResult Function(UserSession session) success,
    required TResult Function(Object error) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? processing,
    TResult? Function(UserSession session)? success,
    TResult? Function(Object error)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? processing,
    TResult Function(UserSession session)? success,
    TResult Function(Object error)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginScreenInitialState value) initial,
    required TResult Function(LoginScreenProcessingState value) processing,
    required TResult Function(LoginScreenAuthenticatedState value) success,
    required TResult Function(LoginScreenFailedState value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginScreenInitialState value)? initial,
    TResult? Function(LoginScreenProcessingState value)? processing,
    TResult? Function(LoginScreenAuthenticatedState value)? success,
    TResult? Function(LoginScreenFailedState value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginScreenInitialState value)? initial,
    TResult Function(LoginScreenProcessingState value)? processing,
    TResult Function(LoginScreenAuthenticatedState value)? success,
    TResult Function(LoginScreenFailedState value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginScreenStateCopyWith<$Res> {
  factory $LoginScreenStateCopyWith(
          LoginScreenState value, $Res Function(LoginScreenState) then) =
      _$LoginScreenStateCopyWithImpl<$Res, LoginScreenState>;
}

/// @nodoc
class _$LoginScreenStateCopyWithImpl<$Res, $Val extends LoginScreenState>
    implements $LoginScreenStateCopyWith<$Res> {
  _$LoginScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoginScreenInitialStateCopyWith<$Res> {
  factory _$$LoginScreenInitialStateCopyWith(_$LoginScreenInitialState value,
          $Res Function(_$LoginScreenInitialState) then) =
      __$$LoginScreenInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginScreenInitialStateCopyWithImpl<$Res>
    extends _$LoginScreenStateCopyWithImpl<$Res, _$LoginScreenInitialState>
    implements _$$LoginScreenInitialStateCopyWith<$Res> {
  __$$LoginScreenInitialStateCopyWithImpl(_$LoginScreenInitialState _value,
      $Res Function(_$LoginScreenInitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginScreenInitialState implements LoginScreenInitialState {
  _$LoginScreenInitialState();

  @override
  String toString() {
    return 'LoginScreenState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginScreenInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() processing,
    required TResult Function(UserSession session) success,
    required TResult Function(Object error) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? processing,
    TResult? Function(UserSession session)? success,
    TResult? Function(Object error)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? processing,
    TResult Function(UserSession session)? success,
    TResult Function(Object error)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginScreenInitialState value) initial,
    required TResult Function(LoginScreenProcessingState value) processing,
    required TResult Function(LoginScreenAuthenticatedState value) success,
    required TResult Function(LoginScreenFailedState value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginScreenInitialState value)? initial,
    TResult? Function(LoginScreenProcessingState value)? processing,
    TResult? Function(LoginScreenAuthenticatedState value)? success,
    TResult? Function(LoginScreenFailedState value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginScreenInitialState value)? initial,
    TResult Function(LoginScreenProcessingState value)? processing,
    TResult Function(LoginScreenAuthenticatedState value)? success,
    TResult Function(LoginScreenFailedState value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class LoginScreenInitialState implements LoginScreenState {
  factory LoginScreenInitialState() = _$LoginScreenInitialState;
}

/// @nodoc
abstract class _$$LoginScreenProcessingStateCopyWith<$Res> {
  factory _$$LoginScreenProcessingStateCopyWith(
          _$LoginScreenProcessingState value,
          $Res Function(_$LoginScreenProcessingState) then) =
      __$$LoginScreenProcessingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginScreenProcessingStateCopyWithImpl<$Res>
    extends _$LoginScreenStateCopyWithImpl<$Res, _$LoginScreenProcessingState>
    implements _$$LoginScreenProcessingStateCopyWith<$Res> {
  __$$LoginScreenProcessingStateCopyWithImpl(
      _$LoginScreenProcessingState _value,
      $Res Function(_$LoginScreenProcessingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginScreenProcessingState implements LoginScreenProcessingState {
  _$LoginScreenProcessingState();

  @override
  String toString() {
    return 'LoginScreenState.processing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginScreenProcessingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() processing,
    required TResult Function(UserSession session) success,
    required TResult Function(Object error) failed,
  }) {
    return processing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? processing,
    TResult? Function(UserSession session)? success,
    TResult? Function(Object error)? failed,
  }) {
    return processing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? processing,
    TResult Function(UserSession session)? success,
    TResult Function(Object error)? failed,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginScreenInitialState value) initial,
    required TResult Function(LoginScreenProcessingState value) processing,
    required TResult Function(LoginScreenAuthenticatedState value) success,
    required TResult Function(LoginScreenFailedState value) failed,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginScreenInitialState value)? initial,
    TResult? Function(LoginScreenProcessingState value)? processing,
    TResult? Function(LoginScreenAuthenticatedState value)? success,
    TResult? Function(LoginScreenFailedState value)? failed,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginScreenInitialState value)? initial,
    TResult Function(LoginScreenProcessingState value)? processing,
    TResult Function(LoginScreenAuthenticatedState value)? success,
    TResult Function(LoginScreenFailedState value)? failed,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class LoginScreenProcessingState implements LoginScreenState {
  factory LoginScreenProcessingState() = _$LoginScreenProcessingState;
}

/// @nodoc
abstract class _$$LoginScreenAuthenticatedStateCopyWith<$Res> {
  factory _$$LoginScreenAuthenticatedStateCopyWith(
          _$LoginScreenAuthenticatedState value,
          $Res Function(_$LoginScreenAuthenticatedState) then) =
      __$$LoginScreenAuthenticatedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({UserSession session});
}

/// @nodoc
class __$$LoginScreenAuthenticatedStateCopyWithImpl<$Res>
    extends _$LoginScreenStateCopyWithImpl<$Res,
        _$LoginScreenAuthenticatedState>
    implements _$$LoginScreenAuthenticatedStateCopyWith<$Res> {
  __$$LoginScreenAuthenticatedStateCopyWithImpl(
      _$LoginScreenAuthenticatedState _value,
      $Res Function(_$LoginScreenAuthenticatedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = null,
  }) {
    return _then(_$LoginScreenAuthenticatedState(
      null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as UserSession,
    ));
  }
}

/// @nodoc

class _$LoginScreenAuthenticatedState implements LoginScreenAuthenticatedState {
  _$LoginScreenAuthenticatedState(this.session);

  @override
  final UserSession session;

  @override
  String toString() {
    return 'LoginScreenState.success(session: $session)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginScreenAuthenticatedState &&
            (identical(other.session, session) || other.session == session));
  }

  @override
  int get hashCode => Object.hash(runtimeType, session);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginScreenAuthenticatedStateCopyWith<_$LoginScreenAuthenticatedState>
      get copyWith => __$$LoginScreenAuthenticatedStateCopyWithImpl<
          _$LoginScreenAuthenticatedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() processing,
    required TResult Function(UserSession session) success,
    required TResult Function(Object error) failed,
  }) {
    return success(session);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? processing,
    TResult? Function(UserSession session)? success,
    TResult? Function(Object error)? failed,
  }) {
    return success?.call(session);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? processing,
    TResult Function(UserSession session)? success,
    TResult Function(Object error)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(session);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginScreenInitialState value) initial,
    required TResult Function(LoginScreenProcessingState value) processing,
    required TResult Function(LoginScreenAuthenticatedState value) success,
    required TResult Function(LoginScreenFailedState value) failed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginScreenInitialState value)? initial,
    TResult? Function(LoginScreenProcessingState value)? processing,
    TResult? Function(LoginScreenAuthenticatedState value)? success,
    TResult? Function(LoginScreenFailedState value)? failed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginScreenInitialState value)? initial,
    TResult Function(LoginScreenProcessingState value)? processing,
    TResult Function(LoginScreenAuthenticatedState value)? success,
    TResult Function(LoginScreenFailedState value)? failed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class LoginScreenAuthenticatedState implements LoginScreenState {
  factory LoginScreenAuthenticatedState(final UserSession session) =
      _$LoginScreenAuthenticatedState;

  UserSession get session;
  @JsonKey(ignore: true)
  _$$LoginScreenAuthenticatedStateCopyWith<_$LoginScreenAuthenticatedState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginScreenFailedStateCopyWith<$Res> {
  factory _$$LoginScreenFailedStateCopyWith(_$LoginScreenFailedState value,
          $Res Function(_$LoginScreenFailedState) then) =
      __$$LoginScreenFailedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class __$$LoginScreenFailedStateCopyWithImpl<$Res>
    extends _$LoginScreenStateCopyWithImpl<$Res, _$LoginScreenFailedState>
    implements _$$LoginScreenFailedStateCopyWith<$Res> {
  __$$LoginScreenFailedStateCopyWithImpl(_$LoginScreenFailedState _value,
      $Res Function(_$LoginScreenFailedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$LoginScreenFailedState(
      null == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$LoginScreenFailedState implements LoginScreenFailedState {
  _$LoginScreenFailedState(this.error);

  @override
  final Object error;

  @override
  String toString() {
    return 'LoginScreenState.failed(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginScreenFailedState &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginScreenFailedStateCopyWith<_$LoginScreenFailedState> get copyWith =>
      __$$LoginScreenFailedStateCopyWithImpl<_$LoginScreenFailedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() processing,
    required TResult Function(UserSession session) success,
    required TResult Function(Object error) failed,
  }) {
    return failed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? processing,
    TResult? Function(UserSession session)? success,
    TResult? Function(Object error)? failed,
  }) {
    return failed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? processing,
    TResult Function(UserSession session)? success,
    TResult Function(Object error)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginScreenInitialState value) initial,
    required TResult Function(LoginScreenProcessingState value) processing,
    required TResult Function(LoginScreenAuthenticatedState value) success,
    required TResult Function(LoginScreenFailedState value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginScreenInitialState value)? initial,
    TResult? Function(LoginScreenProcessingState value)? processing,
    TResult? Function(LoginScreenAuthenticatedState value)? success,
    TResult? Function(LoginScreenFailedState value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginScreenInitialState value)? initial,
    TResult Function(LoginScreenProcessingState value)? processing,
    TResult Function(LoginScreenAuthenticatedState value)? success,
    TResult Function(LoginScreenFailedState value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class LoginScreenFailedState implements LoginScreenState {
  factory LoginScreenFailedState(final Object error) = _$LoginScreenFailedState;

  Object get error;
  @JsonKey(ignore: true)
  _$$LoginScreenFailedStateCopyWith<_$LoginScreenFailedState> get copyWith =>
      throw _privateConstructorUsedError;
}
