// Mocks generated by Mockito 5.4.2 from annotations
// in flutter_firebase_auth_demo/test/src/domain/get_user_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:flutter_firebase_auth_demo/src/domain/auth_repository.dart'
    as _i5;
import 'package:flutter_firebase_auth_demo/src/domain/entities/account_credential.dart'
    as _i7;
import 'package:flutter_firebase_auth_demo/src/domain/entities/registered_account.dart'
    as _i2;
import 'package:flutter_firebase_auth_demo/src/domain/entities/user_session.dart'
    as _i3;
import 'package:flutter_firebase_auth_demo/src/domain/get_user_service.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeRegisteredAccount_0 extends _i1.SmartFake
    implements _i2.RegisteredAccount {
  _FakeRegisteredAccount_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserSession_1 extends _i1.SmartFake implements _i3.UserSession {
  _FakeUserSession_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAppUser_2 extends _i1.SmartFake implements _i4.AppUser {
  _FakeAppUser_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i5.AuthRepository {
  @override
  _i6.Future<_i2.RegisteredAccount> register(
          _i7.AccountCredential? credential) =>
      (super.noSuchMethod(
        Invocation.method(
          #register,
          [credential],
        ),
        returnValue:
            _i6.Future<_i2.RegisteredAccount>.value(_FakeRegisteredAccount_0(
          this,
          Invocation.method(
            #register,
            [credential],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i2.RegisteredAccount>.value(_FakeRegisteredAccount_0(
          this,
          Invocation.method(
            #register,
            [credential],
          ),
        )),
      ) as _i6.Future<_i2.RegisteredAccount>);

  @override
  _i6.Future<_i3.UserSession> login(_i7.AccountCredential? credential) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [credential],
        ),
        returnValue: _i6.Future<_i3.UserSession>.value(_FakeUserSession_1(
          this,
          Invocation.method(
            #login,
            [credential],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i3.UserSession>.value(_FakeUserSession_1(
          this,
          Invocation.method(
            #login,
            [credential],
          ),
        )),
      ) as _i6.Future<_i3.UserSession>);

  @override
  _i6.Future<_i4.AppUser> getUser() => (super.noSuchMethod(
        Invocation.method(
          #getUser,
          [],
        ),
        returnValue: _i6.Future<_i4.AppUser>.value(_FakeAppUser_2(
          this,
          Invocation.method(
            #getUser,
            [],
          ),
        )),
        returnValueForMissingStub: _i6.Future<_i4.AppUser>.value(_FakeAppUser_2(
          this,
          Invocation.method(
            #getUser,
            [],
          ),
        )),
      ) as _i6.Future<_i4.AppUser>);
}
