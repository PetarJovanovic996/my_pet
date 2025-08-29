part of 'edit_profile_cubit.dart';

final class EditProfileState extends Equatable {
  const EditProfileState({
    this.name = const Name.pure(),
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
    this.currentPassword = const Password.pure(),
  });

  final Name name;
  final Password password;
  final Password currentPassword;

  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  EditProfileState copyWith({
    Name? name,
    Password? password,
    Password? currentPassword,

    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) {
    return EditProfileState(
      name: name ?? this.name,
      password: password ?? this.password,
      currentPassword: currentPassword ?? this.currentPassword,

      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    name,
    password,
    currentPassword,
    status,
    isValid,
    errorMessage,
  ];
}
