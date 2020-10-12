import 'package:flutter/material.dart';

class TemplateTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController textEditingController;

  const TemplateTextField({
    Key key,
    this.label = 'label',
    this.icon = Icons.label,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
            labelText: label,
            hintText: 'Masukkan $label disini',
            prefixIcon: Icon(icon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            )),
      ),
    );
  }
}
