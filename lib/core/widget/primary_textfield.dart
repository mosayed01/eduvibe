import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/ev_colors.dart';

class PrimaryTextField extends StatelessWidget {

  final String? hintText;
  final Function(String)? onChanged;
  final Icon? icon;
  final double width;
  final IconButton? suffix;
  final bool? obscureText;
  final Color? backgroundColor;
  final Color? hintColor;
  final Color? textColor;
  final Color borderColor;
  final int? numForm;
  final String? Function(String?)? valid;
  final TextEditingController? controller;
  final TextInputType keyboardType;


  PrimaryTextField({
    this.hintText,
    required this.width,
    this.numForm,
    this.valid,
    this.controller,
    this.onChanged,
    this.suffix,
    this.icon,
    required this.keyboardType,
    this.obscureText = false,
    this.backgroundColor,
    this.hintColor,
    this.textColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width),
          child: Container(
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(32.r),
                border: Border.all(color: borderColor)),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: TextFormField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(numForm),
                ],
                keyboardType: keyboardType,
                controller: controller,
                obscureText: obscureText!,
                validator: valid,
                cursorColor: EVColors.primaryLight,
                style:  TextStyle(
                  color: textColor,
                  fontSize: 16,
                ),
                onChanged: onChanged,
                decoration: InputDecoration(
                  errorStyle: const TextStyle(
                    color: Colors.red,

                  ),
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  prefixIcon: icon,
                  hintText: hintText,
                  hintStyle:  TextStyle(
                    color: hintColor,
                    fontSize: 16,
                  ),
                  prefixText: '    ',
                  enabledBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: suffix,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
