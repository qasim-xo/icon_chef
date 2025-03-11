import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icon_chef/constants/data_constants.dart';
import 'package:icon_chef/theme/app_colors.dart';

part 'icon_editor_state.freezed.dart';
part 'icon_editor_state.g.dart';

@freezed
abstract class IconEditorState with _$IconEditorState {
  factory IconEditorState({
    required String selectedTab,
    @Default(Shape.circle) Shape shape,
    required String iconText,
    required int iconTextColor,
    required int backgroundColor,
    required bool isBold,
    required bool isItalic,
    required String selectedFont,
    required String isBoldOrItalic,
    required double padding,
    @FileConverter() required File? mobileImage,
    @Uint8ListConverter() required Uint8List? webImage,
  }) = _IconEditorState;

  factory IconEditorState.initial() {
    return IconEditorState(
        backgroundColor: AppColors.primaryColor.toARGB32(),
        selectedTab: 'Text',
        iconText: 'Aa',
        iconTextColor: AppColors.whiteColor.toARGB32(),
        isBold: false,
        isItalic: false,
        selectedFont: 'Roboto',
        isBoldOrItalic: '',
        padding: 25,
        mobileImage: null,
        webImage: null,
        shape: Shape.circle);
  }

  factory IconEditorState.fromJson(Map<String, dynamic> json) =>
      _$IconEditorStateFromJson(json);
}

class ColorConverter extends JsonConverter<Color?, int?> {
  const ColorConverter();

  @override
  Color? fromJson(int? json) {
    return json != null ? Color(json) : null;
  }

  @override
  int? toJson(Color? object) {
    return object?.toARGB32(); // Use `value` instead of `toARGB32()`
  }
}

class Uint8ListConverter implements JsonConverter<Uint8List?, List<int>?> {
  const Uint8ListConverter();

  @override
  Uint8List? fromJson(List<int>? json) {
    return json == null ? null : Uint8List.fromList(json);
  }

  @override
  List<int>? toJson(Uint8List? object) {
    return object?.toList();
  }
}

class FileConverter extends JsonConverter<File?, String?> {
  const FileConverter();

  @override
  File? fromJson(String? json) {
    return json != null ? File(json) : null;
  }

  @override
  String? toJson(File? object) {
    return object?.path;
  }
}
