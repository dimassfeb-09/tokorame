part of 'confirm_data_account_bloc.dart';

@immutable
class ConfirmDataAccountState {
  final bool acceptTermAndCondition;
  final ConfirmDataAccount confirmDataAccount;

  const ConfirmDataAccountState({
    this.confirmDataAccount = const ConfirmDataAccount(
      agen: '',
      noWhatsapp: '',
      level: '',
      storeName: '',
      storeDomain: '',
    ),
    this.acceptTermAndCondition = false,
  });

  // Tambahkan copyWith agar bisa memperbarui state secara selektif
  ConfirmDataAccountState copyWith({
    bool? acceptTermAndCondition,
    ConfirmDataAccount? confirmDataAccount,
  }) {
    return ConfirmDataAccountState(
      acceptTermAndCondition:
          acceptTermAndCondition ?? this.acceptTermAndCondition,
      confirmDataAccount: confirmDataAccount ?? this.confirmDataAccount,
    );
  }
}

final class ConfirmDataAccountInitial extends ConfirmDataAccountState {
  const ConfirmDataAccountInitial() : super();
}

class CheckboxOnPressedState extends ConfirmDataAccountState {
  const CheckboxOnPressedState({required super.acceptTermAndCondition});
}

class ButtonConfirmDataAccountOnPressedState extends ConfirmDataAccountState {
  const ButtonConfirmDataAccountOnPressedState(
      {required super.acceptTermAndCondition});
}

class UpdateConfirmAccountState extends ConfirmDataAccountState {}
