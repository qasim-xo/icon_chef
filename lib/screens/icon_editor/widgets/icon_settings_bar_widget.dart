import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icon_chef/screens/icon_editor/widgets/clip_art_widget.dart';

class IconSettingsBarWidget extends ConsumerWidget {
  const IconSettingsBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [ClipArtWidget()],
    );
  }
}
