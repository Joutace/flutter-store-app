import 'package:flutter/material.dart';
import 'package:flutter_challange/shared/themes/app_colors.dart';
import 'package:flutter_challange/shared/themes/app_text_styles.dart';

class AppButton extends StatelessWidget {
  final void Function() onPressed;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final String label;
  final bool isLoading;
  final bool isEnabled;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final BorderSide? borderSide;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.width,
    this.height,
    this.textStyle,
    this.isLoading = false,
    this.isEnabled = true,
    this.foregroundColor,
    this.backgroundColor,
    this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 53,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          disabledBackgroundColor:
              isEnabled == false ? AppColors.greyBackgroundAlt : null,
          side: borderSide ?? const BorderSide(color: Colors.transparent),
          textStyle: textStyle ?? AppTextStyles.h6,
          foregroundColor: foregroundColor ?? AppColors.darkGrey,
          backgroundColor: backgroundColor ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: isLoading || !isEnabled ? null : onPressed,
        child: child(),
      ),
    );
  }

  Widget child() {
    if (isLoading) {
      return const SizedBox(
        height: 25,
        width: 25,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
        ),
      );
    } else {
      return Text(label);
    }
  }
}

class AppRoundButton extends StatelessWidget {
  const AppRoundButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.color,
    this.height,
    this.textColor,
    this.width,
  });

  final GestureTapCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final IconData? icon;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height ?? 40,
      minWidth: width ?? 40,
      onPressed: onPressed,
      color: color ?? AppColors.black,
      textColor: textColor ?? AppColors.white,
      shape: const CircleBorder(),
      child: Icon(
        icon,
        size: 25,
      ),
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.image,
  });

  final GestureTapCallback? onPressed;
  final String image;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: TextButton.icon(
        onPressed: onPressed,
        icon: Image.asset(
          image,
          width: 20,
          height: 20,
        ),
        label: Text(label, style: AppTextStyles.subtitle1),
      ),
    );
  }
}

class AppTextOutlinedButton extends StatelessWidget {
  const AppTextOutlinedButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.borderRadius,
  });

  final GestureTapCallback? onPressed;

  final String label;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(65, 35),
        backgroundColor: AppColors.black.withOpacity(0.15),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
      ),
      child: Text(
        label,
        style: AppTextStyles.subtitle1,
      ),
    );
  }
}
