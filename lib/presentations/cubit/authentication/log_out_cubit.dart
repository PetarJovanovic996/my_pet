import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/src/equatable.dart';

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
