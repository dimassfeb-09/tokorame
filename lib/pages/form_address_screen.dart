import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokorame_dimasfebriyanto/logic/confirm_data_account/bloc/confirm_data_account_bloc.dart';
import 'package:tokorame_dimasfebriyanto/logic/whatsapp_otp/bloc/whatsapp_otp_bloc.dart';
import 'package:tokorame_dimasfebriyanto/models/confirm_data_account_model.dart';
import 'package:tokorame_dimasfebriyanto/pages/form_store_information_screen.dart';
import 'package:tokorame_dimasfebriyanto/widgets/option_select_custom.dart';
import 'package:tokorame_dimasfebriyanto/widgets/textfield_type_password_custom.dart';
import 'package:tokorame_dimasfebriyanto/widgets/textfield_type_text_custom.dart';

import '../logic/registration/bloc/registration_bloc.dart';
import '../widgets/button_custom.dart';

class FormAddressScreen extends StatelessWidget {
  const FormAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ConfirmDataAccountBloc confirmDataAccountBloc =
        context.read<ConfirmDataAccountBloc>();

    TextEditingController _nameController = TextEditingController();
    TextEditingController _whatsappNoController = TextEditingController(
        text: confirmDataAccountBloc.state.confirmDataAccount.noWhatsapp);
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
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 68),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Alamat Toko",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              const Text(
                "Isi form berikut untuk menambah alamat toko ",
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Informasi Pengirim",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text("Wajib terisi",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF697170)))
                    ],
                  ),
                  SizedBox(height: 28),
                  TextfieldTypeTextCustom(
                    controller: _nameController,
                    hintText: 'Nama Lengkap',
                    onChanged: (value) {},
                    prefixIcon: Image(
                        image: AssetImage("assets/icons/user-square.png")),
                  ),
                  SizedBox(height: 28),
                  TextfieldTypeTextCustom(
                    controller: _whatsappNoController,
                    hintText: 'Nomor Whatsapp',
                    prefixIcon: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                            image:
                                AssetImage("assets/icons/indonesia_logo.png")),
                        SizedBox(width: 3),
                        Text("+62")
                      ],
                    ),
                    onChanged: (value) {},
                  ),

                  SizedBox(height: 28),

                  // Alamat Penerima
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Alamat Pengirim",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text("Wajib terisi",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF697170)))
                    ],
                  ),
                  SizedBox(height: 28),
                  OptionSelectCustom(
                    options: [
                      Option(key: 'Rumah', label: 'Rumah'),
                      Option(key: 'Kontrakan', label: 'Kontrakan'),
                      Option(key: 'Kos', label: 'Kos'),
                      Option(key: 'Apartemen', label: 'Apartemen'),
                      Option(key: 'Kantor', label: 'Kantor'),
                    ],
                    onSelect: (select) {},
                    selected: Option(key: 'Rumah', label: 'Rumah'),
                    hint: 'Label Alamat',
                  ),
                  SizedBox(height: 28),
                  OptionSelectCustom(
                    options: [
                      Option(key: 'Rumah', label: 'Rumah'),
                      Option(key: 'Kontrakan', label: 'Kontrakan'),
                      Option(key: 'Kos', label: 'Kos'),
                      Option(key: 'Apartemen', label: 'Apartemen'),
                      Option(key: 'Kantor', label: 'Kantor'),
                    ],
                    onSelect: (select) {},
                    selected: Option(key: 'Rumah', label: 'Rumah'),
                    hint: 'Provinsi, Kota, Kecamatan, Kelurahan',
                  ),
                  SizedBox(height: 28),
                  TextfieldTypeTextCustom(
                    hintText: 'Alamat Lengkap',
                    prefixIcon:
                        Image(image: AssetImage("assets/icons/location.png")),
                  ),
                  SizedBox(height: 28),
                  Text(
                    "Detail Alamat",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 28),
                  TextfieldTypeTextCustom(
                    hintText: 'Detail Lainnya (Cth: patokan, no rumah, dsb)',
                    prefixIcon:
                        Image(image: AssetImage("assets/icons/location.png")),
                  ),
                  SizedBox(height: 28),
                  TextfieldTypeTextCustom(
                    hintText: 'Pilih titik map',
                    prefixIcon:
                        Image(image: AssetImage("assets/icons/location.png")),
                  ),
                  SizedBox(height: 28),
                ],
              ),
              ButtonCustom(
                name: "Selanjutnya",
                isActive: true,
                onTap: () {
                  Navigator.of(context).pushNamed('/form-store-information');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
