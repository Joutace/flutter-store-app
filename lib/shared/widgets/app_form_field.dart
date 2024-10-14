import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challange/shared/themes/app_colors.dart';
import 'package:flutter_challange/shared/themes/app_text_styles.dart';

class LoginFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool isPassword;
  final void Function(String value) onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const LoginFormField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.errorText,
    required this.onChanged,
    this.keyboardType,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    final double borderRadius = 14;
    return TextFormField(
      style: AppTextStyles.h6.copyWith(color: AppColors.white),
      onChanged: onChanged,
      obscureText: isPassword,
      decoration: InputDecoration(
        filled: true,
        errorText: errorText,
        contentPadding: const EdgeInsets.only(left: 9),
        fillColor: AppColors.darkGrey,
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.white40),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(width: 1, color: AppColors.primary),
        ),
        hintText: hintText,
        hintStyle: AppTextStyles.subtitle1.copyWith(color: AppColors.white),
      ),
    );
  }
}
