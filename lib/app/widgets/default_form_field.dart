import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:site_flautistas/app/constants/default_colors.dart';

class DefaultFormField extends StatelessWidget {
  final String text;
  final IconData icon;

  const DefaultFormField({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: DefaultColors.blueStranger,
            blurRadius: 50.0,
            offset: Offset(0, 10),
          )
        ],
      ),
      child: TextFormField(
        validator: validarCampoVazio,
        decoration: InputDecoration(
            icon: Icon(
              icon,
            ),
            border: InputBorder.none,
            hintText: text,
            hintStyle: const TextStyle(color: Colors.grey)),
      ),
    );
  }

  String? validarCampoVazio(String? value) {
    if (value != null && value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }
}
