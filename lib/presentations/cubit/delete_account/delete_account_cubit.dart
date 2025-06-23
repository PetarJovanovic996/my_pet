import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit(this._authenticationRepository)
    : super(DeleteAccountInitial());

  final AuthenticationRepository _authenticationRepository;

  Future<void> deleteAccount() async {
    emit(DeleteAccountLoading());

    try {
      await _authenticationRepository.deleteAccount();
      emit(DeleteAccountSuccess());
    } catch (e) {
      emit(DeleteAccountError(e.toString()));
    }
  }
}
