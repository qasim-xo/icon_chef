import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icon_chef/constants/extension_constants.dart';
import 'package:icon_chef/theme/app_colors.dart';

class AndroidIconWidget extends ConsumerWidget {
  const AndroidIconWidget(
      {super.key,
      required this.text,
      required this.globalKey,
      this.backgroundColor = AppColors.primaryColor,
      this.textColor = AppColors.whiteColor,
      this.fontWeight = FontWeight.bold});

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final FontWeight fontWeight;
  final GlobalKey globalKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RepaintBoundary(
      key: globalKey,
      child: Container(
        height: 60,
        width: 60,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
        child: Center(
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                text,
                style: context.textTheme.bodyMedium?.copyWith(
                    fontSize: 20,
                    color: textColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
