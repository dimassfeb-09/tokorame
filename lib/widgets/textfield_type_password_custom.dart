import 'package:flutter/material.dart';

class TextfieldTypePasswordCustom extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final Function(String value)? onChanged;

  final String? hintUnderline;
  final Color? hintUnderlineColor;
  final AlignmentGeometry? hintUnderlinePosition;
  final double? hintUnderlineSize;
  final Function()? hintUnderlineOnPressed;

  const TextfieldTypePasswordCustom({
    super.key,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.hintUnderline,
    this.hintUnderlinePosition = Alignment.centerLeft,
    this.hintUnderlineSize = 10,
    this.hintUnderlineColor,
    this.hintUnderlineOnPressed,
  });

  @override
  _TextfieldTypePasswordCustomState createState() =>
      _TextfieldTypePasswordCustomState();
}

class _TextfieldTypePasswordCustomState
    extends State<TextfieldTypePasswordCustom> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: widget.controller,
                keyboardType: TextInputType.visiblePassword,
                obscureText: _obscureText,
                onChanged: (value) {
                  if (widget.onChanged != null) {
                    widget.onChanged!(value);
                  }
                },
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image(
                      image: AssetImage("assets/icons/lock.png"),
                    ),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              onPressed: _togglePasswordVisibility,
              icon: Image(
                image: AssetImage(
                  _obscureText
                      ? "assets/icons/eye-slash.png"
                      : "assets/icons/eye.png",
                ),
              ),
            ),
          ],
        ),
        Divider(height: 0),
        if (widget.hintUnderline != null)
          Align(
            alignment: widget.hintUnderlinePosition!,
            child: GestureDetector(
              onTap: widget.hintUnderlineOnPressed,
              child: Text(
                widget.hintUnderline!,
                style: TextStyle(
                    fontSize: widget.hintUnderlineSize,
                    color: widget.hintUnderlineColor ?? Colors.blue),
              ),
            ),
          )
      ],
    );
  }
}
