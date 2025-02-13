part of 'whatsapp_otp_bloc.dart';

@immutable
sealed class WhatsappOtpState {
  final ConfirmDataAccount confirmDataAccount;

  WhatsappOtpState({required this.confirmDataAccount});
}

final class WhatsappOtpInitial extends WhatsappOtpState {
  WhatsappOtpInitial({required super.confirmDataAccount});
}

class OnChangeTextFieldNoWhatsappState extends WhatsappOtpState {
  final String number;
  final bool isValid;

  OnChangeTextFieldNoWhatsappState({
    required this.number,
    this.isValid = true,
    required super.confirmDataAccount,
  });
}
