import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icon_chef/constants/data_constants.dart';
import 'package:icon_chef/screens/icon_editor/providers/state/icon_editor_state.dart';
import 'package:icon_chef/theme/app_colors.dart';

// class IconEditorState {
//   final String selectedTab;
//   final String iconText;
//   final Color iconTextColor;
//   final bool isBold;
//   final bool isItalic;
//   final String selectedFont;
//   final String isBoldOrItalic;
//   final double padding;
//   final File? mobileImage;
//   final Uint8List? webImage;

//   IconEditorState(
//       {required this.selectedTab,
//       required this.isBoldOrItalic,
//       required this.iconTextColor,
//       required this.isBold,
//       required this.isItalic,
//       required this.selectedFont,
//       required this.padding,
//       required this.iconText,
//       required this.mobileImage,
//       required this.webImage});

//   IconEditorState copyWith(
//       {String? selectedTab,
//       String? iconText,
//       Color? iconTextColor,
//       bool? isBold,
//       String? selectedFont,
//       String? isBoldOrItalic,
//       double? padding,
//       bool? isItalic,
//       File? mobileImage,
//       Uint8List? webImage}) {
//     return IconEditorState(
//         selectedTab: selectedTab ?? this.selectedTab,
//         iconTextColor: iconTextColor ?? this.iconTextColor,
//         iconText: iconText ?? this.iconText,
//         isBold: isBold ?? this.isBold,
//         isItalic: isItalic ?? this.isItalic,
//         selectedFont: selectedFont ?? this.selectedFont,
//         isBoldOrItalic: isBoldOrItalic ?? this.isBoldOrItalic,
//         padding: padding ?? this.padding,
//         mobileImage: mobileImage ?? this.mobileImage,
//         webImage: webImage ?? this.webImage);
//   }

//   factory IconEditorState.initial() {
//     return IconEditorState(
//         selectedTab: 'Text',
//         iconText: 'Aa',
//         iconTextColor: AppColors.whiteColor,
//         isBold: false,
//         isItalic: false,
//         selectedFont: 'Roboto',
//         isBoldOrItalic: '',
//         padding: 25,
//         mobileImage: null,
//         webImage: null);
//   }
// }

class IconEditorNotifier extends Notifier<IconEditorState> {
  @override
  IconEditorState build() {
    return IconEditorState.initial();
  }

  void setShape(Shape shape) {
    state = state.copyWith(shape: shape);
  }

  void setMobileImage(File image) {
    state = state.copyWith(mobileImage: image);
  }

  void setBgColor(int colotInt) {
    state = state.copyWith(backgroundColor: colotInt);
  }

  void resetImages() {
    state = state.copyWith(mobileImage: null, webImage: null);
  }

  void setWebImage(Uint8List image) {
    state = state.copyWith(webImage: image);
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

  void setPadding(double padding) {
    state = state.copyWith(padding: padding);
  }

  void setIconText(String iconText) {
    state = state.copyWith(iconText: iconText);
  }

  void setIconColor(int colorInt) {
    state = state.copyWith(iconTextColor: colorInt);
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
