import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icon_chef/constants/data_constants.dart';
import 'package:icon_chef/constants/extension_constants.dart';
import 'package:icon_chef/screens/icon_editor/providers/icon_editor_provider.dart';
import 'package:icon_chef/theme/app_colors.dart';
import 'package:image_picker/image_picker.dart';

class BackgroundOptionsWidget extends ConsumerStatefulWidget {
  const BackgroundOptionsWidget({super.key});

  @override
  ConsumerState<BackgroundOptionsWidget> createState() =>
      _BackgroundOptionsWidgetState();
}

class _BackgroundOptionsWidgetState
    extends ConsumerState<BackgroundOptionsWidget> {
  Future<void> pickImage() async {
    if (!kIsWeb) {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = File(image.path);
        ref.read(iconEditorProvider.notifier).setMobileImage(selected);
      }
    } else {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = await image.readAsBytes();
        ref.read(iconEditorProvider.notifier).setWebImage(selected);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = ref.watch(iconEditorProvider).backgroundColor;
    final shape = ref.watch(iconEditorProvider).shape;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () => pickImage(),
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Select Image',
                  style: context.textTheme.bodyMedium
                      ?.copyWith(color: AppColors.blackColor),
                ),
              )),
            ),
            GestureDetector(
              onTap: () {
                ref.read(iconEditorProvider.notifier).resetImages();
              },
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Reset Image',
                  style: context.textTheme.bodyMedium
                      ?.copyWith(color: AppColors.blackColor),
                ),
              )),
            ),
          ],
        ),
        Text(
          'Background Color',
          style: context.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
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
                      pickerColor: Color(bgColor),
                      onColorChanged: (color) {
                        ref
                            .read(iconEditorProvider.notifier)
                            .setBgColor(color.toARGB32());
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
                color: Color(bgColor),
                borderRadius: BorderRadius.circular(3)),
          ),
        ),
        Text(
          'Shape',
          style: context.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        RadioListTile(
          title: Text('Circle'),
          value: shape,
          groupValue: Shape.circle,
          onChanged: (shape) {
            ref.read(iconEditorProvider.notifier).setShape(Shape.circle);
          },
        ),
        RadioListTile(
          title: Text('Square'),
          value: shape,
          groupValue: Shape.square,
          onChanged: (value) {
            ref.read(iconEditorProvider.notifier).setShape(Shape.square);
          },
        ),
      ],
    );
  }
}
