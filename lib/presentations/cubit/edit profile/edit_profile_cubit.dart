import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:my_pet/data/models/validation/name.dart';
import 'package:my_pet/data/models/validation/password.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this._authenticationRepository)
    : super(const EditProfileState());

  final AuthenticationRepository _authenticationRepository;

  void enteredName(String value) {
    final name = Name.dirty(value);

    emit(
      state.copyWith(
        name: name,
        isValid: Formz.validate([name, state.password, state.currentPassword]),
      ),
    );
  }

  void enteredNewPassword(String value) {
    final password = Password.dirty(value);

    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.name, password, state.currentPassword]),
      ),
    );
  }

  void enteredCurrentPassword(String value) {
    final currentPassword = Password.dirty(value);

    emit(
      state.copyWith(
        currentPassword: currentPassword,
        isValid: Formz.validate([state.name, state.password, currentPassword]),
      ),
    );
  }

  Future<void> submitNewData() async {
    if (!state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      return;
    }
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      if (state.name.value.isNotEmpty) {
        await _authenticationRepository.editUserName(state.name.value);
      }

      if (state.password.value.isNotEmpty) {
        final user = _authenticationRepository.currentUser;
        await _authenticationRepository.reauthenticateUser(
          email: user.email ?? '',
          password: state.currentPassword.value,
        );

        await _authenticationRepository.editUserPassword(state.password.value);
      }
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
