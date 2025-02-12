part of 'whatsapp_otp_bloc.dart';

@immutable
sealed class WhatsappOtpEvent {}

class OnChangeTextFieldNoWhatsappEvent extends WhatsappOtpEvent {
  final String number;

  OnChangeTextFieldNoWhatsappEvent({required this.number});
}
