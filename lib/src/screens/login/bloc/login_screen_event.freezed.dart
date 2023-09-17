// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_screen_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginScreenEvent {
  AccountCredential get credentail => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AccountCredential credentail) submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AccountCredential credentail)? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AccountCredential credentail)? submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginScreenSubmitEvent value) submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginScreenSubmitEvent value)? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginScreenSubmitEvent value)? submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginScreenEventCopyWith<LoginScreenEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginScreenEventCopyWith<$Res> {
  factory $LoginScreenEventCopyWith(
          LoginScreenEvent value, $Res Function(LoginScreenEvent) then) =
      _$LoginScreenEventCopyWithImpl<$Res, LoginScreenEvent>;
  @useResult
  $Res call({AccountCredential credentail});
}

/// @nodoc
class _$LoginScreenEventCopyWithImpl<$Res, $Val extends LoginScreenEvent>
    implements $LoginScreenEventCopyWith<$Res> {
  _$LoginScreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? credentail = null,
  }) {
    return _then(_value.copyWith(
      credentail: null == credentail
          ? _value.credentail
          : credentail // ignore: cast_nullable_to_non_nullable
              as AccountCredential,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginScreenSubmitEventCopyWith<$Res>
    implements $LoginScreenEventCopyWith<$Res> {
  factory _$$LoginScreenSubmitEventCopyWith(_$LoginScreenSubmitEvent value,
          $Res Function(_$LoginScreenSubmitEvent) then) =
      __$$LoginScreenSubmitEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AccountCredential credentail});
}

/// @nodoc
class __$$LoginScreenSubmitEventCopyWithImpl<$Res>
    extends _$LoginScreenEventCopyWithImpl<$Res, _$LoginScreenSubmitEvent>
    implements _$$LoginScreenSubmitEventCopyWith<$Res> {
  __$$LoginScreenSubmitEventCopyWithImpl(_$LoginScreenSubmitEvent _value,
      $Res Function(_$LoginScreenSubmitEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? credentail = null,
  }) {
    return _then(_$LoginScreenSubmitEvent(
      null == credentail
          ? _value.credentail
          : credentail // ignore: cast_nullable_to_non_nullable
              as AccountCredential,
    ));
  }
}

/// @nodoc

class _$LoginScreenSubmitEvent implements LoginScreenSubmitEvent {
  _$LoginScreenSubmitEvent(this.credentail);

  @override
  final AccountCredential credentail;

  @override
  String toString() {
    return 'LoginScreenEvent.submit(credentail: $credentail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginScreenSubmitEvent &&
            (identical(other.credentail, credentail) ||
                other.credentail == credentail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, credentail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginScreenSubmitEventCopyWith<_$LoginScreenSubmitEvent> get copyWith =>
      __$$LoginScreenSubmitEventCopyWithImpl<_$LoginScreenSubmitEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AccountCredential credentail) submit,
  }) {
    return submit(credentail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AccountCredential credentail)? submit,
  }) {
    return submit?.call(credentail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AccountCredential credentail)? submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(credentail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginScreenSubmitEvent value) submit,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginScreenSubmitEvent value)? submit,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginScreenSubmitEvent value)? submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class LoginScreenSubmitEvent implements LoginScreenEvent {
  factory LoginScreenSubmitEvent(final AccountCredential credentail) =
      _$LoginScreenSubmitEvent;

  @override
  AccountCredential get credentail;
  @override
  @JsonKey(ignore: true)
  _$$LoginScreenSubmitEventCopyWith<_$LoginScreenSubmitEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
