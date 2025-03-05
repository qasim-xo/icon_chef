import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icon_chef/constants/extension_constants.dart';
import 'package:icon_chef/screens/icon_editor/providers/icon_editor_provider.dart';
import 'package:icon_chef/theme/app_colors.dart';

class AndroidIconWidget extends ConsumerWidget {
  const AndroidIconWidget({super.key, required this.globalKey});

  final GlobalKey globalKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(iconEditorProvider).iconText;
    final iconTextColor = ref.watch(iconEditorProvider).iconTextColor;
    final isBold = ref.watch(iconEditorProvider).isBold;
    final isItalic = ref.watch(iconEditorProvider).isItalic;
    final selectedFont = ref.watch(iconEditorProvider).selectedFont;
    return RepaintBoundary(
      key: globalKey,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: AppColors.primaryColor),
        child: Center(
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                text,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontFamily: GoogleFonts.getFont(selectedFont).fontFamily,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
                  fontSize: 20,
                  color: iconTextColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
