import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokorame_dimasfebriyanto/logic/confirm_data_account/bloc/confirm_data_account_bloc.dart';
import 'package:tokorame_dimasfebriyanto/logic/input_sent_otp/bloc/input_sent_otp_bloc.dart';
import 'package:tokorame_dimasfebriyanto/logic/registration/bloc/registration_bloc.dart';
import 'package:tokorame_dimasfebriyanto/logic/whatsapp_otp/bloc/whatsapp_otp_bloc.dart';
import 'package:tokorame_dimasfebriyanto/models/confirm_data_account_model.dart';
import 'package:tokorame_dimasfebriyanto/pages/confirm_data_account_screen.dart';
import 'package:tokorame_dimasfebriyanto/pages/form_address_screen.dart';
import 'package:tokorame_dimasfebriyanto/pages/form_registration_screen.dart';
import 'package:tokorame_dimasfebriyanto/pages/form_store_information_screen.dart';
import 'package:tokorame_dimasfebriyanto/pages/input_sent_otp_screen.dart';
import 'package:tokorame_dimasfebriyanto/pages/whatsapp_otp_screen.dart';

import 'pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ConfirmDataAccountBloc confirmDataAccountBloc = ConfirmDataAccountBloc();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      initialRoute: '/splash-screen',
      routes: {
        '/splash-screen': (context) => SplashScreen(),
        '/whatsapp-otp': (context) => MultiBlocProvider(
              providers: [
                BlocProvider.value(value: confirmDataAccountBloc),
                BlocProvider(
                  create: (context) => WhatsappOtpBloc(),
                )
              ],
              child: WhatsappOtpScreen(),
            ),
        '/input-sent-otp': (context) => BlocProvider(
              create: (context) => InputSentOtpBloc(),
              child: InputSentOtpScreen(),
            ),
        '/form-registration': (context) => MultiBlocProvider(
              providers: [
                BlocProvider.value(value: confirmDataAccountBloc),
                BlocProvider(
                  create: (context) => RegistrationBloc(),
                )
              ],
              child: FormRegistrationScreen(),
            ),
        '/form-address-store': (context) => BlocProvider.value(
              value: confirmDataAccountBloc,
              child: FormAddressScreen(),
            ),
        '/form-store-information': (context) => BlocProvider.value(
              value: confirmDataAccountBloc,
              child: FormStoreInformationScreen(),
            ),
        '/confirm-data-account': (context) => BlocProvider.value(
              value: confirmDataAccountBloc,
              child: ConfirmDataAccountScreen(),
            ),
      },
    );
  }
}
