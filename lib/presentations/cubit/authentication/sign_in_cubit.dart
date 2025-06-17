import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:my_pet/data/models/validation/confirmed_password.dart';
import 'package:my_pet/data/models/validation/email.dart';
import 'package:my_pet/data/models/validation/name.dart';
import 'package:my_pet/data/models/validation/password.dart';
import 'package:my_pet/data/models/validation/username.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInState());
}
