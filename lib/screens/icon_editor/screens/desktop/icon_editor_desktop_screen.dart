import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icon_chef/constants/extension_constants.dart';
import 'package:icon_chef/screens/icon_editor/providers/icon_editor_provider.dart';
import 'package:icon_chef/screens/icon_editor/widgets/android_icon_widget.dart';
import 'package:icon_chef/screens/icon_editor/widgets/clip_art_widget.dart';
import 'package:icon_chef/screens/icon_editor/widgets/icon_settings_bar_widget.dart';
import 'package:icon_chef/screens/icon_editor/widgets/text_tab_options_widget.dart';
import 'package:icon_chef/theme/app_colors.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Icon Chef',
          style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      body: Row(
        children: [
          IconSettingsBarWidget(),
          Expanded(child: AndroidIconWidget(globalKey: _globalKey))
        ],
      ),
    );
  }
}
