import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokorame_dimasfebriyanto/logic/confirm_data_account/bloc/confirm_data_account_bloc.dart';
import 'package:tokorame_dimasfebriyanto/logic/whatsapp_otp/bloc/whatsapp_otp_bloc.dart';
import 'package:tokorame_dimasfebriyanto/models/confirm_data_account_model.dart';
import 'package:tokorame_dimasfebriyanto/pages/form_registration_screen.dart';

import '../logic/input_sent_otp/bloc/input_sent_otp_bloc.dart';
import '../logic/registration/bloc/registration_bloc.dart';
import '../widgets/button_custom.dart';

class InputSentOtpScreen extends StatelessWidget {
  const InputSentOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Center(
              child: Icon(
                Icons.keyboard_arrow_left_outlined,
                size: 32,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 68),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Kode OTP Telah Terkirim",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const Text(
              "Periksa WhatsApp kamu, masukan kode OTP\nyang ada untuk melanjutkan tahap registrasi",
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return Container(
                  width: 40,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      counterText: '',
                    ),
                    onChanged: (value) {
                      // Kirim event ke InputSentOtpBloc
                      context.read<InputSentOtpBloc>().add(
                            OnOtpFieldChangedEvent(value: value, index: index),
                          );

                      // Pindah fokus ke TextField berikutnya jika input tidak kosong
                      if (value.isNotEmpty && index < 5) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                );
              }),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Belum dapat kode OTP?",
                ),
                SizedBox(width: 5),
                Text(
                  "Kirim ulang 3:15",
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
            const Spacer(),
            BlocBuilder<InputSentOtpBloc, InputSentOtpState>(
              builder: (context, state) {
                return ButtonCustom(
                  name: "Selanjutnya",
                  isActive: state.isButtonActive,
                  onTap: state.isButtonActive
                      ? () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => RegistrationBloc(),
                              child: FormRegistrationScreen(),
                            ),
                          ));
                        }
                      : null,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
