part of 'input_sent_otp_bloc.dart';

@immutable
sealed class InputSentOtpEvent {}

class OnOtpFieldChangedEvent extends InputSentOtpEvent {
  final String value;
  final int index;

  OnOtpFieldChangedEvent({required this.value, required this.index});
}
