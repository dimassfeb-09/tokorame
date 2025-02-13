import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokorame_dimasfebriyanto/logic/confirm_data_account/bloc/confirm_data_account_bloc.dart';
import 'package:tokorame_dimasfebriyanto/models/confirm_data_account_model.dart';
import 'package:tokorame_dimasfebriyanto/pages/confirm_data_account_screen.dart';
import 'package:tokorame_dimasfebriyanto/widgets/option_select_custom.dart';
import 'package:tokorame_dimasfebriyanto/widgets/textfield_type_text_custom.dart';

import '../widgets/button_custom.dart';

class FormStoreInformationScreen extends StatelessWidget {
  const FormStoreInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tncDomain = [
      "Hanya terdiri dari angka dan huruf",
      "Tidak mengandung simbol",
      "Hanya bisa diganti sekali"
    ];

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
              "Informasi Toko",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const Text(
              "Isi form berikut untuk mengatur nama dan domain untuk toko kamu",
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 28),
                TextfieldTypeTextCustom(
                  hintText: 'Nama Toko',
                  onChanged: (value) {},
                  prefixIcon: Image(
                    image: AssetImage("assets/icons/shop.png"),
                  ),
                ),
                SizedBox(height: 28),
                TextfieldTypeTextCustom(
                  hintText: 'Domain Toko',
                  onChanged: (value) {},
                  prefixIcon: Image(
                    image: AssetImage("assets/icons/global.png"),
                  ),
                  suffixIcon: Text("tokorame.store"),
                ),

                SizedBox(height: 28),

                // Alamat Penerima
              ],
            ),
            Text("Ketentuan domain toko :"),
            Column(
              children: List.generate(
                tncDomain.length,
                (index) => Row(
                  children: [
                    Container(
                      height: 4,
                      width: 4,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      tncDomain[index],
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            ButtonCustom(
              name: "Selanjutnya",
              isActive: true,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => ConfirmDataAccountBloc(
                      confirmDataAccount: ConfirmDataAccount(
                          agen: 'agen',
                          noWhatsapp: 'noWhatsapp',
                          level: 'level',
                          storeName: 'storeName',
                          storeDomain: 'storeDomain'),
                    ),
                    child: ConfirmDataAccountScreen(),
                  ),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
