import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    on<OnChangePasswordEvent>((event, emit) {
      emit(OnChangePasswordState(password: event.password));
    });

    on<OnChangeConfirmPasswordEvent>((event, emit) {
      emit(OnChangeConfirmPasswordState(password: event.password));
    });
  }
}
