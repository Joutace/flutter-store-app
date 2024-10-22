import 'package:flutter/material.dart';
import 'package:flutter_challange/shared/themes/app_text_styles.dart';
import 'package:flutter_challange/shared/widgets/app_buttons.dart';
import 'package:flutter_challange/shared/widgets/app_exception.dart';

Future showAppBottomSheet(BuildContext context,
    {String? title, required String message}) {
  final children = <Widget>[];
  if (title != null) {
    children.add(Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(title,
          style: AppTextStyles.h5.copyWith(fontWeight: FontWeight.w700)),
    ));
  }
  children.add(Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Text(message, style: AppTextStyles.body1),
  ));
  children
      .add(AppButton(onPressed: () => Navigator.pop(context), label: "Fechar"));

  return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: children,
          ),
        );
      });
}

Future showErrorAppBottomSheet(BuildContext context,
    {required AppException exception}) {
  return showAppBottomSheet(context,
      title: "Erro", message: exception.getMessage());
}
