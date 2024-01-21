import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextfild extends StatelessWidget {
  final String hintText;
  final Widget? counter;
  final double? height;
  final double? radius;
  final TextEditingController? controller;
  TextInputType? keyboardType;
  String? Function(String?)? validator;
  void Function(String)? onChanged;
  MyTextfild({
    super.key,
    required this.hintText,
    this.counter,
    this.height,
    this.radius,
    this.validator,
    this.onChanged,
    this.controller,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 100,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          hintText: hintText,
          counter: counter,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 16),
          ),
        ),
        onChanged: onChanged,
        validator: validator,
        keyboardType: keyboardType,
      ),
    );
  }
}
