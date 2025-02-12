import 'package:flutter/material.dart';

class TextfieldTypeTextCustom extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String iconPath;
  final String? hintUnderline;

  final Function(String value)? onChanged;

  final AlignmentGeometry? hintUnderlinePosition;
  final double? hintUnderlineSize;
  final Function()? hintUnderlineOnPressed;

  const TextfieldTypeTextCustom({
    super.key,
    required this.hintText,
    required this.iconPath,
    this.onChanged,
    this.controller,
    this.hintUnderline,
    this.hintUnderlineOnPressed,
    this.hintUnderlinePosition = Alignment.centerRight,
    this.hintUnderlineSize = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0), // Sesuaikan padding
              child: Image(
                image: AssetImage(iconPath),
              ),
            ),
            border: UnderlineInputBorder(), // Tambahkan jika ingin ada border
          ),
        ),
        if (hintUnderline != null)
          Align(
            alignment: hintUnderlinePosition!,
            child: GestureDetector(
              onTap: hintUnderlineOnPressed,
              child: Text(
                hintUnderline!,
                style:
                    TextStyle(fontSize: hintUnderlineSize, color: Colors.blue),
              ),
            ),
          )
      ],
    );
  }
}
