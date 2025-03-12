import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icon_chef/constants/extension_constants.dart';
import 'package:icon_chef/screens/icon_editor/providers/icon_editor_provider.dart';
import 'package:icon_chef/screens/icon_editor/widgets/android_icon_widget.dart';
import 'package:icon_chef/screens/icon_editor/widgets/background_options_widget.dart';
import 'package:icon_chef/screens/icon_editor/widgets/clip_art_widget.dart';
import 'package:icon_chef/screens/icon_editor/widgets/image_tab_options_widget.dart';
import 'package:icon_chef/screens/icon_editor/widgets/text_tab_options_widget.dart';

class IconSettingsBarWidget extends ConsumerStatefulWidget {
  const IconSettingsBarWidget({super.key});

  @override
  ConsumerState<IconSettingsBarWidget> createState() =>
      _IconSettingsBarWidgetState();
}

class _IconSettingsBarWidgetState extends ConsumerState<IconSettingsBarWidget> {
  final GlobalKey _globalKey = GlobalKey();
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final selectedTab = ref.watch(iconEditorProvider).selectedTab;
    final iconText = ref.watch(iconEditorProvider).iconText;
    return Material(
      elevation: 10,
      child: Container(
        width: 400,
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Scrollbar(
            thumbVisibility: true,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Icon',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  SegmentedButton(
                    segments: [
                      ButtonSegment(label: Text('Text'), value: 'Text'),
                      ButtonSegment(value: 'Image', label: Text('Image'))
                    ],
                    selected: {selectedTab},
                    onSelectionChanged: (Set<String> newSelection) {
                      ref
                          .read(iconEditorProvider.notifier)
                          .setSelectedTab(newSelection.first);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  selectedTab == 'Text'
                      ? TextTabOptionsWidget(
                          textController: textController,
                        )
                      : ImageTabOptionsWidget(),
                  Divider(),
                  BackgroundOptionsWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
