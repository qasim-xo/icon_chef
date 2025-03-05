import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icon_chef/theme/app_colors.dart';

class IconEditorState {
  final String selectedTab;
  final String iconText;
  final Color iconTextColor;
  final bool isBold;
  final bool isItalic;
  final String selectedFont;
  final String isBoldOrItalic;

  IconEditorState(
      {required this.selectedTab,
      required this.isBoldOrItalic,
      required this.iconTextColor,
      required this.isBold,
      required this.isItalic,
      required this.selectedFont,
      required this.iconText});

  IconEditorState copyWith(
      {String? selectedTab,
      String? iconText,
      Color? iconTextColor,
      bool? isBold,
      String? selectedFont,
      String? isBoldOrItalic,
      bool? isItalic}) {
    return IconEditorState(
        selectedTab: selectedTab ?? this.selectedTab,
        iconTextColor: iconTextColor ?? this.iconTextColor,
        iconText: iconText ?? this.iconText,
        isBold: isBold ?? this.isBold,
        isItalic: isItalic ?? this.isItalic,
        selectedFont: selectedFont ?? this.selectedFont,
        isBoldOrItalic: isBoldOrItalic ?? this.isBoldOrItalic);
  }

  factory IconEditorState.initial() {
    return IconEditorState(
        selectedTab: 'Text',
        iconText: 'Aa',
        iconTextColor: AppColors.whiteColor,
        isBold: false,
        isItalic: false,
        selectedFont: 'Roboto',
        isBoldOrItalic: '');
  }
}

class IconEditorNotifier extends Notifier<IconEditorState> {
  @override
  IconEditorState build() {
    return IconEditorState.initial();
  }

  void setSelectedTab(String selectedTab) {
    state = state.copyWith(selectedTab: selectedTab);
  }

  void setIsBoldOrItalic(String isBoldOrItalic) {
    state = state.copyWith(isBoldOrItalic: isBoldOrItalic);
  }

  void setSelectedFont(String font) {
    state = state.copyWith(selectedFont: font);
  }

  void setIconText(String iconText) {
    state = state.copyWith(iconText: iconText);
  }

  void setIconColor(Color color) {
    state = state.copyWith(iconTextColor: color);
  }

  void setIsBold(bool isBold) {
    state = state.copyWith(isBold: isBold);
  }

  void setIsItalic(bool isItalic) {
    state = state.copyWith(isItalic: isItalic);
  }
}

final iconEditorProvider =
    NotifierProvider<IconEditorNotifier, IconEditorState>(
        () => IconEditorNotifier());
