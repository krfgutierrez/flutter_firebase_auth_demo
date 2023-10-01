import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_auth_demo/src/data/auth_error.dart';
import 'package:flutter_firebase_auth_demo/src/domain/auth_repository.dart';
import 'package:flutter_firebase_auth_demo/src/domain/login_use_case.dart';
import 'package:flutter_firebase_auth_demo/src/screens/login/bloc/login_screen_bloc.dart';
import 'package:flutter_firebase_auth_demo/src/screens/login/login_form.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mocktail/mocktail.dart' as mocktail;

@GenerateNiceMocks([
  MockSpec<ILoginFormContract>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LoginUseCase>(),
  MockSpec<LoginScreenBloc>(),
  MockSpec<ILoginFormValidator>(onMissingStub: OnMissingStub.returnDefault),
])
import 'login_form_test.mocks.dart';

class MockLoginBloc extends MockBloc<LoginScreenEvent, LoginScreenState>
    implements LoginScreenBloc {}

void main() {
  group('LoginForm', () {
    const txtEmailKey = Key('LoginForm-textfield-email');
    const txtPasswordKey = Key('LoginForm-textfield-password');
    const btnSubmitkey = Key('LoginForm-button-submit');

    final contract = MockILoginFormContract();
    final validator = MockILoginFormValidator();
    const session = UserSession(accessToken: 'access-token', uid: 'user123');

    late LoginScreenBloc bloc;

    setUp(() {
      GetIt.instance.registerFactory<ILoginFormValidator>(() => validator);
      bloc = MockLoginBloc();
    });

    tearDown(() {
      reset(validator);
      GetIt.instance.reset(dispose: true);
    });

    Future<void> buildWidgetOnTest(WidgetTester tester) {
      return tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: BlocProvider<LoginScreenBloc>.value(
            value: bloc,
            child: LoginForm(contract: contract),
          ),
        ),
      ));
    }

    group('States', () {
      testWidgets('Initial State: Expect form to be enabled', (tester) async {
        whenListen<LoginScreenState>(
          bloc,
          Stream.fromIterable([]),
          initialState: LoginScreenState.initial(),
        );
        await buildWidgetOnTest(tester);
        final txtEmail = find.byKey(txtEmailKey);
        final txtPassword = find.byKey(txtPasswordKey);
        final btnSubmit = find.byKey(btnSubmitkey);
        expect(tester.widget<TextFormField>(txtEmail).enabled, isTrue);
        expect(tester.widget<TextFormField>(txtPassword).enabled, isTrue);
        expect(tester.widget<ElevatedButton>(btnSubmit).onPressed, isNotNull);
      });

      testWidgets('Processing State: Expect form to be disabled',
          (tester) async {
        whenListen(
          bloc,
          Stream.fromIterable([LoginScreenState.processing()]),
          initialState: LoginScreenState.initial(),
        );
        await buildWidgetOnTest(tester);
        await tester.pump();

        final txtEmail = find.byKey(txtEmailKey);
        final txtPassword = find.byKey(txtPasswordKey);
        final btnSubmit = find.byKey(btnSubmitkey);
        expect(tester.widget<TextFormField>(txtEmail).enabled, isFalse);
        expect(tester.widget<TextFormField>(txtPassword).enabled, isFalse);
        expect(tester.widget<ButtonStyleButton>(btnSubmit).onPressed, isNull);
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets(
          'Failed State: Expect form to be enabled and error dialog is prompted',
          (tester) async {
        const exception = InvalidCredentialException();
        whenListen(
          bloc,
          Stream.fromIterable([
            LoginScreenState.failed(exception),
          ]),
          initialState: LoginScreenState.initial(),
        );
        await buildWidgetOnTest(tester);
        await tester.pump();

        expect(find.text('Login Failed'), findsOneWidget);
        expect(find.text(exception.message), findsOneWidget);
        // If the login failed, the form should be enabled.
        final txtEmail = find.byKey(txtEmailKey);
        final txtPassword = find.byKey(txtPasswordKey);
        final btnSubmit = find.byKey(btnSubmitkey);

        expect(tester.widget<TextFormField>(txtEmail).enabled, equals(true));
        expect(tester.widget<TextFormField>(txtPassword).enabled, equals(true));
        expect(
            tester.widget<ButtonStyleButton>(btnSubmit).onPressed, isNotNull);
      });

      testWidgets(
          'Successful State: Expect [ILoginFormContract.onLoginSucceed] to be called',
          (tester) async {
        whenListen(
          bloc,
          Stream.fromIterable([LoginScreenState.success(session)]),
          initialState: LoginScreenState.initial(),
        );

        await buildWidgetOnTest(tester);
        await tester.pump();

        verify(contract.onLoginSucceed(session)).called(1);
        // If the login succeed, the form must retain disabled.
        final txtEmail = find.byKey(const Key('LoginForm-textfield-email'));
        final txtPassword =
            find.byKey(const Key('LoginForm-textfield-password'));
        final btnSubmit = find.byKey(const Key('LoginForm-button-submit'));

        expect(tester.widget<TextFormField>(txtEmail).enabled, isFalse);
        expect(tester.widget<TextFormField>(txtPassword).enabled, isFalse);
        expect(tester.widget<ButtonStyleButton>(btnSubmit).onPressed, isNull);
      });
    });

    group('Validation', () {
      testWidgets(
        'Expect email field error when email validation return an error',
        (tester) async {
          whenListen<LoginScreenState>(
            bloc,
            Stream.fromIterable([]),
            initialState: LoginScreenState.initial(),
          );
          const email = 'user!yahoo.com';
          when(validator.email(email)).thenReturn('Invalid Email');
          await buildWidgetOnTest(tester);
          await tester.enterText(find.byKey(txtEmailKey), email);
          await tester.enterText(find.byKey(txtPasswordKey), '!P@ssw0rd123');
          await tester.tap(find.byKey(btnSubmitkey));
          await tester.pump();
          verify(validator.email(email)).called(1);
          expect(find.text('Invalid Email'), findsOneWidget);
        },
      );
      testWidgets(
        'Expect password field error when password validation return an error',
        (tester) async {
          whenListen<LoginScreenState>(
            bloc,
            Stream.fromIterable([]),
            initialState: LoginScreenState.initial(),
          );
          const password = '';
          when(validator.password(password)).thenReturn('Password is required');
          await buildWidgetOnTest(tester);
          await tester.enterText(find.byKey(txtEmailKey), 'user!yahoo.com');
          await tester.tap(find.byKey(btnSubmitkey));
          await tester.pump();
          verify(validator.password(password)).called(1);
          expect(find.text('Password is required'), findsOneWidget);
        },
      );

      testWidgets('Expect to trigger login when email and password are valid',
          (tester) async {
        whenListen<LoginScreenState>(
          bloc,
          Stream.fromIterable([]),
          initialState: LoginScreenState.initial(),
        );
        await buildWidgetOnTest(tester);
        const String email = 'user@gmail.com';
        const String password = '!P@ssw0rd123';
        await tester.enterText(find.byKey(txtEmailKey), email);
        await tester.enterText(find.byKey(txtPasswordKey), password);
        await tester.tap(find.byKey(btnSubmitkey));
        await tester.pump();
        const credential = AccountCredential(email, password);
        mocktail
            .verify(() => bloc.add(LoginScreenEvent.submit(credential)))
            .called(1);
      });
    });
  });
}
