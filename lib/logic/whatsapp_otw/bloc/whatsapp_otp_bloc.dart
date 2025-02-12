import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'whatsapp_otp_event.dart';
part 'whatsapp_otp_state.dart';

class WhatsappOtpBloc extends Bloc<WhatsappOtpEvent, WhatsappOtpState> {
  WhatsappOtpBloc() : super(WhatsappOtpInitial()) {
    on<OnChangeTextFieldNoWhatsappEvent>((event, emit) {
      final isValid = RegExp(r'^8[0-9]{8,11}$').hasMatch(event.number);
      emit(OnChangeTextFieldNoWhatsappState(
          number: event.number, isValid: isValid));
    });
  }
}
