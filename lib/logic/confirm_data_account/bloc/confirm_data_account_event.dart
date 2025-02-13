part of 'confirm_data_account_bloc.dart';

@immutable
sealed class ConfirmDataAccountEvent {
  final bool acceptTermAndCondition;

  ConfirmDataAccountEvent({this.acceptTermAndCondition = false});
}

class CheckboxOnPressedEvent extends ConfirmDataAccountEvent {
  CheckboxOnPressedEvent({required super.acceptTermAndCondition});
}

class ButtonConfirmDataAccountOnPressedEvent extends ConfirmDataAccountEvent {
  ButtonConfirmDataAccountOnPressedEvent();
}

class UpdateConfirmDataEvent extends ConfirmDataAccountEvent {
  final ConfirmDataAccount confirmDataAccount;

  UpdateConfirmDataEvent({required this.confirmDataAccount});
}
