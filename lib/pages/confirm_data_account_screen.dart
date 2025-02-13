import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokorame_dimasfebriyanto/logic/confirm_data_account/bloc/confirm_data_account_bloc.dart';
import 'package:tokorame_dimasfebriyanto/widgets/card_confirm_data_account.dart';

import '../widgets/button_custom.dart';
import '../widgets/textfield_type_text_custom.dart';

class ConfirmDataAccountScreen extends StatelessWidget {
  const ConfirmDataAccountScreen({super.key});

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
              "Konfirmasi Data Akun",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const Text(
              "Anda akan terdaftar sebagai mitra Tokorame dengan data sebagai berikut",
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 15),
            BlocBuilder<ConfirmDataAccountBloc, ConfirmDataAccountState>(
              builder: (context, state) {
                final account =
                    context.watch<ConfirmDataAccountBloc>().confirmDataAccount;
                return CardConfirmDataAccount(confirmDataAccount: account);
              },
            ),
            Spacer(),
            Row(
              children: [
                BlocBuilder<ConfirmDataAccountBloc, ConfirmDataAccountState>(
                  builder: (context, state) {
                    bool? isChecked = false;

                    if (state is CheckboxOnPressedState) {
                      isChecked = state.acceptTermAndCondition;
                    }

                    return Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        context.read<ConfirmDataAccountBloc>().add(
                            CheckboxOnPressedEvent(
                                acceptTermAndCondition: value!));
                      },
                    );
                  },
                ),
                Text.rich(
                  TextSpan(
                    text: "Saya setuju dengan ",
                    style: TextStyle(fontSize: 12),
                    children: [
                      TextSpan(
                        text: "Syarat dan Ketentuan",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      TextSpan(
                        text: "\ndari Tokorame",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 14),
            BlocBuilder<ConfirmDataAccountBloc, ConfirmDataAccountState>(
              builder: (context, state) {
                bool isChecked = state.acceptTermAndCondition;

                return ButtonCustom(
                  name: "Selanjutnya",
                  isActive: isChecked,
                  onTap: () {
                    context
                        .read<ConfirmDataAccountBloc>()
                        .add(ButtonConfirmDataAccountOnPressedEvent());
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
