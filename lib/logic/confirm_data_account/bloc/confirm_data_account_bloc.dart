import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tokorame_dimasfebriyanto/models/confirm_data_account_model.dart';

part 'confirm_data_account_event.dart';
part 'confirm_data_account_state.dart';

class ConfirmDataAccountBloc
    extends Bloc<ConfirmDataAccountEvent, ConfirmDataAccountState> {
  final ConfirmDataAccount confirmDataAccount;

  ConfirmDataAccountBloc({required this.confirmDataAccount})
      : super(ConfirmDataAccountInitial()) {
    on<CheckboxOnPressedEvent>((event, emit) {
      emit(CheckboxOnPressedState(
          acceptTermAndCondition: event.acceptTermAndCondition));
    });

    on<ButtonConfirmDataAccountOnPressedEvent>((event, emit) {
      emit(ButtonConfirmDataAccountOnPressedState(
          acceptTermAndCondition: event.acceptTermAndCondition));
    });

    on<UpdateConfirmDataEvent>((event, emit) {
      emit(
        state.copyWith(
          confirmDataAccount: event.confirmDataAccount,
        ),
      );
    });
  }
}
