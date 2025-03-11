import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icon_chef/screens/icon_editor/providers/icon_editor_provider.dart';
import 'package:image_picker/image_picker.dart';

class ImageTabOptionsWidget extends ConsumerWidget {
  const ImageTabOptionsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final webImage = ref.watch(iconEditorProvider).webImage;
    final mobileImage = ref.watch(iconEditorProvider).mobileImage;

    Future<void> pickImage() async {
      if (!kIsWeb) {
        final ImagePicker picker = ImagePicker();
        final XFile? image =
            await picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          var selected = File(image.path);
          // ref.read(iconEditorProvider.notifier).setMobileImage(selected);
        }
      } else {
        final ImagePicker picker = ImagePicker();
        final XFile? image =
            await picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          var selected = await image.readAsBytes();
          ref.read(iconEditorProvider.notifier).setWebImage(selected);
        }
      }
    }

    return Column(
      children: [
        Card(
          child: Row(
            children: [Text('Select an image')],
          ),
        )
      ],
    );
  }
}
