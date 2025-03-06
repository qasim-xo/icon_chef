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
    final padding = ref.watch(iconEditorProvider).padding;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Text',
          style: context.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 3,
        ),
        SizedBox(
          height: 60,
          width: double.infinity,
          child: AppTextField(
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryTextColor)),
            borderRadius: BorderRadius.circular(3),
            fillColor: AppColors.whiteColor,
            onChanged: (val) {
              ref.read(iconEditorProvider.notifier).setIconText(val);
            },
            textController: textController,
          ),
        ),
        Text(
          'Style',
          style: context.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Text('Bold'),
                SizedBox(
                  width: 10,
                ),
                Checkbox(
                    value: isBold,
                    onChanged: (value) {
                      ref
                          .read(iconEditorProvider.notifier)
                          .setIsBold(value ?? false);
                    }),
              ],
            ),
            Row(
              children: [
                Text('Italic'),
                SizedBox(
                  width: 10,
                ),
                Checkbox(
                    value: isItalic,
                    onChanged: (value) {
                      ref
                          .read(iconEditorProvider.notifier)
                          .setIsItalic(value ?? false);
                    }),
              ],
            ),
          ],
        ),
        Text(
          'Font',
          style: context.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        DropdownButton<String>(
          isDense: false,
          padding: EdgeInsets.zero,
          isExpanded: true,
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
        Text(
          'Color',
          style: context.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 3,
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
            height: 30,
            width: 80,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryTextColor),
                color: iconTextColor,
                borderRadius: BorderRadius.circular(3)),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text('Padding',
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold)),
        Slider(
            value: padding,
            min: 0,
            max: 100,
            onChanged: (value) {
              ref.read(iconEditorProvider.notifier).setPadding(value);
            })
      ],
    );
  }
}
