import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String label;
  final String? Function(String?)? validate;
  final void Function(String)? onChanged;
  final bool isClickable;
  final IconData prefix;
  final Color? prefixIconColor;
  final double radius;
  final double height;
  final Color? fillingColor;
  final bool isFilledColor;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? digitLimit;

  const DefaultTextFormField({
    super.key,
    required this.controller,
    this.height = 15.0,
    this.prefixIconColor,
    this.fillingColor,
    this.isFilledColor = true,
    this.radius = 4.0,
    this.isPassword = false,
    required this.validate,
    required this.label,
    required this.prefix,
    this.isClickable = true,
    this.inputFormatters,
    this.onChanged,
    this.keyboardType,
    this.digitLimit,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(digitLimit),
      ],
      onChanged: onChanged,
      controller: controller,
      obscureText: isPassword,
      enabled: isClickable,
      validator: validate,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: height),
        fillColor: fillingColor,
        filled: isFilledColor,
        labelText: label,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Icon(
            prefix,
            color: prefixIconColor,
          ),
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(radius))),
      ),
    );
  }
}
