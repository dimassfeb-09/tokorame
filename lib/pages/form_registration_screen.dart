import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokorame_dimasfebriyanto/pages/form_address_screen.dart';
import 'package:tokorame_dimasfebriyanto/widgets/option_select_custom.dart';
import 'package:tokorame_dimasfebriyanto/widgets/textfield_type_password_custom.dart';
import 'package:tokorame_dimasfebriyanto/widgets/textfield_type_text_custom.dart';

import '../logic/registration/bloc/registration_bloc.dart';
import '../widgets/button_custom.dart';

class FormRegistrationScreen extends StatelessWidget {
  const FormRegistrationScreen({super.key});

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
        child: SingleChildScrollView(
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
                    prefixIcon: Image(
                        image: AssetImage("assets/icons/user-square.png")),
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 28),
                  TextfieldTypeTextCustom(
                    hintText: 'Email',
                    prefixIcon:
                        Image(image: AssetImage("assets/icons/sms.png")),
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
                    prefixIcon: Image(
                        image: AssetImage("assets/icons/user-square.png")),
                    onChanged: (value) {},
                    hintText: 'Kode Referral',
                    hintUnderline: "Dapatkan kode referal",
                    hintUnderlineOnPressed: () {},
                    hintUnderlineSize: 12,
                  ),
                  SizedBox(height: 18),
                  BlocBuilder<RegistrationBloc, RegistrationState>(
                    builder: (context, state) {
                      Option? selectedOption;
                      if (state is OnSelectOptionHowDoYouKnowState) {
                        selectedOption = state.option;
                      }
                      return OptionSelectCustom(
                        options: [
                          Option(
                            key: 'Instagram',
                            label: 'Instagram',
                          ),
                          Option(
                            key: 'Facebook',
                            label: 'Facebook',
                          ),
                          Option(
                            key: 'Teman',
                            label: 'Teman',
                          ),
                          Option(
                            key: 'Website',
                            label: 'Website',
                          ),
                        ],
                        onSelect: (Option option) {
                          context.read<RegistrationBloc>().add(
                              OnSelectOptionHowDoYouKnowEvent(option: option));
                        },
                        selected: selectedOption,
                        hint: 'Darimana mengetahui Tokorame',
                      );
                    },
                  )
                ],
              ),
              SizedBox(height: 28),
              ButtonCustom(
                name: "Selanjutnya",
                isActive: true,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FormAddressScreen(),
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
