import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tokorame_dimasfebriyanto/models/confirm_data_account_model.dart';

part 'whatsapp_otp_event.dart';
part 'whatsapp_otp_state.dart';

class WhatsappOtpBloc extends Bloc<WhatsappOtpEvent, WhatsappOtpState> {
  WhatsappOtpBloc()
      : super(WhatsappOtpInitial(
            confirmDataAccount: ConfirmDataAccount(
                agen: '',
                noWhatsapp: '',
                level: '',
                storeName: '',
                storeDomain: ''))) {
    on<OnChangeTextFieldNoWhatsappEvent>((event, emit) {
      final isValid = RegExp(r'^8[0-9]{8,11}$').hasMatch(event.number);
      emit(OnChangeTextFieldNoWhatsappState(
          number: event.number,
          isValid: isValid,
          confirmDataAccount: super.state.confirmDataAccount));
    });
  }
}
