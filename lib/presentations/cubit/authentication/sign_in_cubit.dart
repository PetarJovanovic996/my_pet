import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:my_pet/data/models/validation/email.dart';
import 'package:my_pet/data/models/validation/password.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this._authenticationRepository) : super(SignInState());

  final AuthenticationRepository _authenticationRepository;

  void enteredEmail(String value) {
    final email = Email.dirty(value);

    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password]),
      ),
    );
  }

  void enteredPassword(String value) {
    final password = Password.dirty(value);

    emit(
      state.copyWith(
        password: password,

        isValid: Formz.validate([state.email, password]),
      ),
    );
  }

  Future<void> signIn() async {
    if (!state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      return;
    }
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _authenticationRepository.logInWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on LogInWithEmailAndPasswordFailure catch (e) {
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
