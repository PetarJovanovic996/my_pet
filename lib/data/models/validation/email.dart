import 'package:formz/formz.dart';

enum EmailValidationError { invalid, empty }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([super.value = '']) : super.dirty();

  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
  );

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) {
      return EmailValidationError.empty;
    }
    if (!_emailRegex.hasMatch(value)) {
      return EmailValidationError.invalid;
    }
    return null;
  }
}

class NotEmptyField extends FormzInput<String, EmailValidationError> {
  const NotEmptyField.pure() : super.pure('');
  const NotEmptyField.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) {
      return EmailValidationError.empty;
    } else if (value.length < 3) {
      return EmailValidationError.invalid;
    }

    return null;
  }
}

class NotEmptyField2 extends FormzInput<String, EmailValidationError> {
  const NotEmptyField2.pure() : super.pure('');
  const NotEmptyField2.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) {
      return EmailValidationError.empty;
    }

    return null;
  }
}
