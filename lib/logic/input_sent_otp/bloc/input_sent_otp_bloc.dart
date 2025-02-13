import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'input_sent_otp_event.dart';
part 'input_sent_otp_state.dart';

class InputSentOtpBloc extends Bloc<InputSentOtpEvent, InputSentOtpState> {
  List<String> otpInputs = List.generate(6, (_) => '');

  InputSentOtpBloc() : super(InputSentOtpState(isButtonActive: false)) {
    on<OnOtpFieldChangedEvent>((event, emit) {
      otpInputs[event.index] = event.value;
      bool isAllFieldsFilled = otpInputs.every((input) => input.isNotEmpty);
      emit(InputSentOtpState(isButtonActive: isAllFieldsFilled));
    });
  }
}
