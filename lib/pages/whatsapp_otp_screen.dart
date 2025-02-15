import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokorame_dimasfebriyanto/logic/confirm_data_account/bloc/confirm_data_account_bloc.dart';
import 'package:tokorame_dimasfebriyanto/logic/whatsapp_otp/bloc/whatsapp_otp_bloc.dart';
import 'package:tokorame_dimasfebriyanto/widgets/button_custom.dart';

class WhatsappOtpScreen extends StatelessWidget {
  const WhatsappOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _noWhatsappController = TextEditingController();

    ConfirmDataAccountBloc _confirmDataAccountBloc =
        context.read<ConfirmDataAccountBloc>();

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
              "Masukkan No Whatsapp",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const Text(
              "Masukan nomor WhatsApp kamu untuk\nmelanjutkan tahap registrasi",
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Row(
                    children: [
                      const Image(
                        image: AssetImage("assets/icons/indonesia_logo.png"),
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        "+62",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _noWhatsappController,
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(fontSize: 14),
                      onChanged: (value) {
                        context.read<WhatsappOtpBloc>().add(
                            OnChangeTextFieldNoWhatsappEvent(number: value));
                      },
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(fontSize: 14),
                        hintText: 'No Whatsapp',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<WhatsappOtpBloc, WhatsappOtpState>(
              builder: (context, state) {
                bool isValid = true;
                if (state is OnChangeTextFieldNoWhatsappState) {
                  isValid = state.isValid;
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: isValid ? Colors.black : Colors.red,
                    ),
                    if (!isValid)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          'Nomor tidak valid',
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
            const Spacer(),
            BlocBuilder<WhatsappOtpBloc, WhatsappOtpState>(
              builder: (context, state) {
                bool isNotBlank = false;
                bool isValid = false;
                if (state is OnChangeTextFieldNoWhatsappState &&
                    state.number.isNotEmpty) {
                  isNotBlank = true;
                  isValid = state.isValid;
                }

                return ButtonCustom(
                  name: "Kirim Kode OTP",
                  isActive: isNotBlank && isValid,
                  onTap: () {
                    if (isNotBlank) {
                      _confirmDataAccountBloc.add(
                        UpdateConfirmDataEvent(
                          confirmDataAccount: _confirmDataAccountBloc
                              .state.confirmDataAccount
                              .copyWith(
                            noWhatsapp: _noWhatsappController.text,
                          ),
                        ),
                      );
                      Navigator.of(context).pushNamed('/input-sent-otp');
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
