part of 'whatsapp_otp_bloc.dart';

@immutable
sealed class WhatsappOtpState {}

final class WhatsappOtpInitial extends WhatsappOtpState {}

class OnChangeTextFieldNoWhatsappState extends WhatsappOtpState {
  final String number;
  final bool isValid;

  OnChangeTextFieldNoWhatsappState({
    required this.number,
    this.isValid = true,
  });
}
