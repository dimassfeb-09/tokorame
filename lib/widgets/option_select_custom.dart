import 'package:flutter/material.dart';

class Option {
  final String key;
  final String label;
  Option({required this.key, required this.label});
}

class OptionSelectCustom extends StatefulWidget {
  final List<Option> options;
  final Option? selected;
  final String hint;
  final Function(Option select) onSelect;
  const OptionSelectCustom(
      {super.key,
      required this.options,
      required this.onSelect,
      required this.selected,
      required this.hint});

  @override
  State<OptionSelectCustom> createState() => _OptionSelectCustomState();
}

class _OptionSelectCustomState extends State<OptionSelectCustom> {
  bool _isOpened = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isOpened = !_isOpened;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  Image(
                    image: AssetImage(
                      "assets/icons/message-text.png",
                    ),
                  ),
                  SizedBox(width: 14),
                  Text(
                    widget.selected != null
                        ? widget.selected!.label
                        : widget.hint,
                    style: TextStyle(fontSize: 16),
                  ),
                  Spacer(),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 26,
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          AnimatedContainer(
            duration: Duration(milliseconds: 100),
            height: !_isOpened
                ? 0
                : widget.options.length > 4
                    ? 200
                    : widget.options.length * 45,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300)),
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: List.generate(
                      widget.options.length,
                      (index) => GestureDetector(
                        onTap: () {
                          widget.onSelect(widget.options[index]);
                          _isOpened = !_isOpened;
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: widget.options[index].key ==
                                      widget.selected?.key
                                  ? Color(0xFFF6FEC3)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              widget.options[index].label,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
