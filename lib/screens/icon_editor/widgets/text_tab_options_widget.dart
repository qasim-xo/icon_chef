import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icon_chef/constants/extension_constants.dart';
import 'package:icon_chef/constants/string_constants.dart';
import 'package:icon_chef/screens/icon_editor/providers/icon_editor_provider.dart';
import 'package:icon_chef/shared/widgets/app_custom_textfield.dart';
import 'package:icon_chef/theme/app_colors.dart';

class TextTabOptionsWidget extends ConsumerWidget {
  const TextTabOptionsWidget({super.key, required this.textController});

  final TextEditingController textController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iconTextColor = ref.watch(iconEditorProvider).iconTextColor;
    final isBold = ref.watch(iconEditorProvider).isBold;
    final isItalic = ref.watch(iconEditorProvider).isItalic;
    final selectedFont = ref.watch(iconEditorProvider).selectedFont;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Text'),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              height: 60,
              width: 200,
              child: AppTextField(
                onChanged: (val) {
                  ref.read(iconEditorProvider.notifier).setIconText(val);
                },
                textController: textController,
              ),
            ),
            GestureDetector(
              onTap: () {
                ref.read(iconEditorProvider.notifier).setIsBold(!isBold);
              },
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    color: isBold == false
                        ? AppColors.whiteColor
                        : AppColors.primaryColor.withValues(alpha: 0.3),
                    border: Border.all(color: AppColors.dividerColor)),
                child: Center(
                  child: Text(
                    'B',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                ref.read(iconEditorProvider.notifier).setIsItalic(!isItalic);
              },
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    color: isItalic == false
                        ? AppColors.whiteColor
                        : AppColors.primaryColor.withValues(alpha: 0.3),
                    border: Border.all(color: AppColors.dividerColor)),
                child: Center(
                  child: Text(
                    'I',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
        DropdownButton<String>(
          value: selectedFont,
          items: fonts.map((String font) {
            return DropdownMenuItem<String>(
              value: font,
              child: Text(font, style: GoogleFonts.getFont(font)),
            );
          }).toList(),
          onChanged: (String? newValue) {
            ref
                .read(iconEditorProvider.notifier)
                .setSelectedFont(newValue ?? 'Roboto');
          },
        ),
        Row(
          children: [
            Text('Color'),
            SizedBox(
              width: 20,
            ),

            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: AppColors.whiteColor,
                      title: const Text("Pick a Color"),
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          pickerColor: iconTextColor,
                          onColorChanged: (color) {
                            ref
                                .read(iconEditorProvider.notifier)
                                .setIconColor(color);
                          },
                          showLabel: true,
                          pickerAreaBorderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text("Close"),
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: iconTextColor,
                    borderRadius: BorderRadius.circular(10)),
              ),
            )
            // ColorPicker(
            //     pickerColor: iconTextColor,
            //     onColorChanged: (color) {
            //       ref.read(iconEditorProvider.notifier).setIconColor(color);
            //     })
          ],
        )
      ],
    );
  }
}
