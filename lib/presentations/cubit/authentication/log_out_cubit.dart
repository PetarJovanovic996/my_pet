import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'log_out_state.dart';

class LogOutCubit extends Cubit<LogOutState> {
  LogOutCubit(this._authenticationRepository) : super(LogOutInitial());

  final AuthenticationRepository _authenticationRepository;

  Future<void> logOut() async {
    emit(LogOutLoading());
    try {
      await _authenticationRepository.logOut();
      emit(LogOutCompleted());
    } catch (e) {
      emit(LogOutErrorState(e.toString()));
    }
  }

  void reset() => emit(LogOutInitial());
}
