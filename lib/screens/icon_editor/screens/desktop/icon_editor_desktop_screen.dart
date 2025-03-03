import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icon_chef/screens/icon_editor/providers/icon_editor_provider.dart';
import 'package:icon_chef/screens/icon_editor/widgets/android_icon_widget.dart';
import 'package:icon_chef/screens/icon_editor/widgets/clip_art_widget.dart';
import 'package:icon_chef/screens/icon_editor/widgets/icon_settings_bar_widget.dart';
import 'package:image_downloader_web/image_downloader_web.dart';

class IconEditorDesktopScreen extends ConsumerStatefulWidget {
  const IconEditorDesktopScreen({super.key});

  @override
  ConsumerState<IconEditorDesktopScreen> createState() =>
      _IconEditorDesktopScreenState();
}

class _IconEditorDesktopScreenState
    extends ConsumerState<IconEditorDesktopScreen> {
  final GlobalKey _globalKey = GlobalKey();

  Future<void> _captureAndDownload() async {
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      WebImageDownloader.downloadImageFromUInt8List(uInt8List: pngBytes);

      // final blob = Blob([pngBytes]);
      // final url = html.Url.createObjectUrlFromBlob(blob);
      // final anchor = html.AnchorElement(href: url)
      //   ..setAttribute("download", "widget_image.png")
      //   ..click();

      // html.Url.revokeObjectUrl(url);
    } catch (e) {
      print("Error: $e");
    }
  }

  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final selectedTab = ref.watch(iconEditorProvider).selectedTab;
    final iconText = ref.watch(iconEditorProvider).iconText;
    return Scaffold(
      body: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Icon'),
                  SizedBox(
                    width: 20,
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
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('Text'),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 60,
                    width: 200,
                    child: TextField(
                      onChanged: (value) {
                        ref
                            .read(iconEditorProvider.notifier)
                            .setIconText(value);
                      },
                      controller: textController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a search term',
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  _captureAndDownload();
                },
                child: AndroidIconWidget(
                  text: iconText,
                  globalKey: _globalKey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
