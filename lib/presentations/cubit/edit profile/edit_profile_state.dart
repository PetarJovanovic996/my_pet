part of 'edit_profile_cubit.dart';

class EditProfileState extends Equatable {
  const EditProfileState({
    this.name = const Name.pure(),
    this.password = const Password.pure(),
    this.currentPassword = const Password.pure(),
    this.isChangingPassword = false,
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
  });

  final Name name;
  final Password password;
  final Password currentPassword;
  final bool isChangingPassword;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  EditProfileState copyWith({
    Name? name,
    Password? password,
    Password? currentPassword,
    bool? isChangingPassword,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) {
    return EditProfileState(
      name: name ?? this.name,
      password: password ?? this.password,
      currentPassword: currentPassword ?? this.currentPassword,
      isChangingPassword: isChangingPassword ?? this.isChangingPassword,
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
    isChangingPassword,
    status,
    isValid,
    errorMessage,
  ];
}
