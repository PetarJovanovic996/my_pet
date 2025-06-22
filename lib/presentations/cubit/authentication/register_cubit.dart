import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:my_pet/data/models/validation/confirmed_password.dart';
import 'package:my_pet/data/models/validation/email.dart';
import 'package:my_pet/data/models/validation/name.dart';
import 'package:my_pet/data/models/validation/password.dart';
import 'package:my_pet/data/models/validation/username.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authenticationRepository) : super(RegisterState());

  final AuthenticationRepository _authenticationRepository;

  void enteredName(String value) {
    final name = Name.dirty(value);

    emit(
      state.copyWith(
        name: name,
        isValid: Formz.validate([
          name,
          state.username,
          state.email,
          state.password,
          state.confirmedPassword,
        ]),
      ),
    );
  }

  void enteredUsername(String value) {
    final username = Username.dirty(value);

    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate([
          state.name,
          username,
          state.email,
          state.password,
          state.confirmedPassword,
        ]),
      ),
    );
  }

  void enteredEmail(String value) {
    final email = Email.dirty(value);

    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([
          state.name,
          state.username,
          email,
          state.password,
          state.confirmedPassword,
        ]),
      ),
    );
  }

  void enteredPassword(String value) {
    final password = Password.dirty(value);
    final confirmedPassword = ConfirmedPassword.dirty(
      password: password.value,
      value: state.confirmedPassword.value,
    );

    emit(
      state.copyWith(
        password: password,
        confirmedPassword: confirmedPassword,

        isValid: Formz.validate([
          state.name,
          state.username,
          state.email,
          password,
          confirmedPassword,
        ]),
      ),
    );
  }

  void enteredConfirmedPassword(String value) {
    final confirmedPassword = ConfirmedPassword.dirty(
      password: state.password.value,
      value: value,
    );

    emit(
      state.copyWith(
        confirmedPassword: confirmedPassword,
        isValid: Formz.validate([
          state.name,
          state.username,
          state.email,
          state.password,
          confirmedPassword,
        ]),
      ),
    );
  }

  Future<void> register() async {
    if (!state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      return;
    }
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _authenticationRepository.register(
        email: state.email.value,
        password: state.password.value,
        name: state.name.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on RegisterWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
