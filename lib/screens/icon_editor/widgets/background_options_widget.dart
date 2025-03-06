import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icon_chef/constants/extension_constants.dart';
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
  Uint8List? _imageData;

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Select Image',
            style: context.textTheme.bodyMedium
                ?.copyWith(color: AppColors.blackColor),
          ),
        ))
      ],
    );
  }
}
