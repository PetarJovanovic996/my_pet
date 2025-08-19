part of 'sign_in_with_google_cubit.dart';

final class SignInWithGoogleState extends Equatable {
  const SignInWithGoogleState({
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage,
  });

  final FormzSubmissionStatus status;
  final String? errorMessage;

  SignInWithGoogleState copyWith({
    FormzSubmissionStatus? status,
    String? errorMessage,
  }) {
    return SignInWithGoogleState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];
}
