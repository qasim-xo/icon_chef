import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icon_chef/constants/data_constants.dart';
import 'package:icon_chef/constants/extension_constants.dart';
import 'package:icon_chef/screens/icon_editor/providers/icon_editor_provider.dart';

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
    final padding = ref.watch(iconEditorProvider).padding;
    final bgColor = ref.watch(iconEditorProvider).backgroundColor;
    final shape = ref.watch(iconEditorProvider).shape;
    // final mobileImage = ref.watch(iconEditorProvider).mobileImage;
    final webImage = ref.watch(iconEditorProvider).webBgImage;
    return RepaintBoundary(
      key: globalKey,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: shape == Shape.square ? BorderRadius.circular(6) : null,
          image: webImage != null
              ? DecorationImage(
                  image: MemoryImage(webImage),
                )
              : null, // No image if webImage is null

          shape: shape == Shape.circle ? BoxShape.circle : BoxShape.rectangle,
          color: webImage == null
              ? Color(bgColor)
              : null, // Use primary color if no image
        ),
        child: Center(
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Text(
                text,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontFamily: GoogleFonts.getFont(selectedFont).fontFamily,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
                  fontSize: 40,
                  color: Color(iconTextColor),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
