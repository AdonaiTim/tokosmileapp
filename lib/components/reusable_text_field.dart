
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/constants.dart';

class ReuseableTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? inputType;
  bool obscureText;
  Function()? obscureFunction;
  Function(String? search)? onChanged;
  int? maxLength;
  final dynamic FieldKey;
  Widget? prefixIcon;
  String? Function(String?)? validator;
  Color? color;
  bool enabled = true;
  bool? autoFocus;
  Widget? suffixIcon;

  ReuseableTextField({
    Key? key,
    this.controller,
    required this.hintText,
    this.inputType,
    this.FieldKey,
    this.obscureText = false,
    this.obscureFunction,
    this.onChanged,
    this.maxLength,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.color = whiteColor,
    this.enabled = true,
    this.autoFocus = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color:Colors.black26,width:1),
              borderRadius: BorderRadius.circular(8), color: color),
          height: inputType == TextInputType.multiline ? null : 50,
          child: TextFormField(
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18
            ),
            enabled: enabled,
            controller: controller,
            keyboardType: inputType,
            autofocus:autoFocus!,
            maxLines: inputType == TextInputType.multiline ? null : 1,
            key: FieldKey,
            validator: validator,
            onChanged:onChanged,
            //maxLength: maxLength,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              fillColor: color,
              hintText: hintText,
              hintStyle: const TextStyle(
                  fontSize: 14, color: Colors.black54, fontWeight: FontWeight.w300),
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
            ),
          ),
        ),
        // Validation Error Msg
        //Text("Hello")
      ],
    );
  }
}
