import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokorame_dimasfebriyanto/logic/whatsapp_otp/bloc/whatsapp_otp_bloc.dart';
import 'package:tokorame_dimasfebriyanto/models/confirm_data_account_model.dart';
import 'package:tokorame_dimasfebriyanto/models/splash_screen__content_model.dart';

import '../logic/confirm_data_account/bloc/confirm_data_account_bloc.dart';
import 'whatsapp_otp_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentIndex = 0;

  final List<SplashScreenContent> content = [
    SplashScreenContent(
      imagePath: "assets/images/splash_1.png",
      title: "Gratis Materi Belajar\nMenjadi Seller Handal",
      subtitle:
          "Nggak bisa jualan?\nJangan khawatir, Tokorama akan membimbing kamu hingga menjadi seller langsung dari ahlinya.",
    ),
    SplashScreenContent(
      imagePath: "assets/images/splash_2.png",
      title: "Ribuan Produk\ndengan Kualitas Terbaik",
      subtitle:
          "Tokorame menyediakan ribuan produk dengan kualitas derbaik dari seller terpercaya.",
    ),
    SplashScreenContent(
      imagePath: "assets/images/splash_3.png",
      title: "Toko Online Unik\nUntuk Kamu Jualan",
      subtitle: "Subdomain unik dan toko online profesional siap pakai",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: generatedSplashScreen(
        imagePath: content[currentIndex].imagePath,
        currentIndex: currentIndex,
        title: content[currentIndex].title,
        subtitle: content[currentIndex].subtitle,
      ),
    );
  }

  Widget generatedSplashScreen(
      {String imagePath = '',
      int currentIndex = 0,
      String title = '',
      String subtitle = ''}) {
    return Stack(
      children: [
        // Background image
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover, // Menyesuaikan gambar dengan layar
            ),
          ),
        ),
        // Overlay Card
        Column(
          children: [
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      width: currentIndex == index ? 20 : 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      duration: Duration(milliseconds: 500),
                    ),
                    if (index !=
                        2) // Hindari penambahan gap setelah elemen terakhir
                      const SizedBox(width: 8), // Gap antar Container
                  ],
                ),
              ),
            ),
            SizedBox(height: 21),
            Container(
              padding: const EdgeInsets.all(24.0),
              height: 326,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 35),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (this.currentIndex < 2) {
                            this.currentIndex++; // Menggunakan increment yang benar
                          } else {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MultiBlocProvider(
                                  providers: [
                                    BlocProvider(
                                      create: (context) =>
                                          ConfirmDataAccountBloc(
                                        confirmDataAccount: ConfirmDataAccount(
                                          agen: '',
                                          noWhatsapp: '',
                                          level: '',
                                          storeName: '',
                                          storeDomain: '',
                                        ),
                                      ),
                                    ),
                                    BlocProvider(
                                      create: (context) => WhatsappOtpBloc(),
                                    ),
                                  ],
                                  child: WhatsappOtpScreen(),
                                ),
                              ),
                            );
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        "Selanjutnya",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
