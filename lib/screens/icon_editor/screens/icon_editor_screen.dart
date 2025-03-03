import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icon_chef/screens/icon_editor/screens/desktop/icon_editor_desktop_screen.dart';
import 'package:icon_chef/screens/icon_editor/screens/mobile/icon_editor_mobile_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class IconEditorScreen extends ConsumerWidget {
  const IconEditorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResponsiveBreakpoints.of(context).isDesktop
        ? IconEditorDesktopScreen()
        : IconEditorMobileScreen();
  }
}
