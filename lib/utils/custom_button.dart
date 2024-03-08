import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'text_styles.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onTap;

  const AuthButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.05,
        margin: const EdgeInsets.only(left: 20, right: 20),
        decoration: const BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Text(
            text,
            style: KTextStyle.authButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
