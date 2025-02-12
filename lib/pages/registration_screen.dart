import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokorame_dimasfebriyanto/logic/whatsapp_otw/bloc/whatsapp_otp_bloc.dart';
import 'package:tokorame_dimasfebriyanto/pages/input_sent_otp_screen.dart';
import 'package:tokorame_dimasfebriyanto/widgets/textfield_type_password_custom.dart';
import 'package:tokorame_dimasfebriyanto/widgets/textfield_type_text_custom.dart';

import '../logic/registration/bloc/registration_bloc.dart';
import '../widgets/button_custom.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _confirmPasswordController = TextEditingController();
    TextEditingController _referralCodeController = TextEditingController();
    TextEditingController _howDoYouNowController = TextEditingController();

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
              "Jadilah Mitra Tokorame",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const Text(
              "isi form berikut untuk menjadi mitra Tokorame",
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 30),
            Column(
              children: [
                TextfieldTypeTextCustom(
                  hintText: 'Nama',
                  iconPath: "assets/icons/user-square.png",
                  onChanged: (value) {},
                ),
                SizedBox(height: 28),
                TextfieldTypeTextCustom(
                  hintText: 'Email',
                  iconPath: "assets/icons/sms.png",
                  onChanged: (value) {},
                ),
                SizedBox(height: 28),
                TextfieldTypePasswordCustom(
                  hintText: 'Password',
                ),
                SizedBox(height: 28),
                BlocBuilder<RegistrationBloc, RegistrationState>(
                  builder: (context, state) {
                    bool isPasswordMismatch = false;

                    // Hanya tampilkan error jika konfirmasi password diubah
                    if (state is OnChangeConfirmPasswordState &&
                        _passwordController.text.isNotEmpty &&
                        _confirmPasswordController.text.isNotEmpty) {
                      isPasswordMismatch =
                          _passwordController.text != state.password;
                    }

                    return TextfieldTypePasswordCustom(
                      controller: _confirmPasswordController,
                      hintText: 'Konfirmasi Password',
                      hintUnderline:
                          isPasswordMismatch ? 'Password tidak sesuai' : null,
                      hintUnderlineColor:
                          isPasswordMismatch ? Colors.red : null,
                      onChanged: (value) {
                        // Trigger event untuk validasi setiap perubahan
                        context.read<RegistrationBloc>().add(
                              OnChangeConfirmPasswordEvent(password: value),
                            );
                      },
                    );
                  },
                ),
                SizedBox(height: 28),
                TextfieldTypeTextCustom(
                  iconPath: "assets/icons/mobile.png",
                  onChanged: (value) {},
                  hintText: 'Kode Referral',
                  hintUnderline: "Dapatkan kode referal",
                  hintUnderlineOnPressed: () {},
                  hintUnderlineSize: 12,
                ),
                SizedBox(height: 28),
                TextfieldTypeTextCustom(
                  hintText: "Darimana mengetahui Tokorame",
                  iconPath: "assets/icons/message-text.png",
                ),
              ],
            ),
            const Spacer(),
            ButtonCustom(
              name: "Selanjutnya",
              isActive: true,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
