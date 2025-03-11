// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icon_editor_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IconEditorState _$IconEditorStateFromJson(Map<String, dynamic> json) =>
    _IconEditorState(
      selectedTab: json['selectedTab'] as String,
      shape: $enumDecodeNullable(_$ShapeEnumMap, json['shape']) ?? Shape.circle,
      iconText: json['iconText'] as String,
      iconTextColor: (json['iconTextColor'] as num).toInt(),
      backgroundColor: (json['backgroundColor'] as num).toInt(),
      isBold: json['isBold'] as bool,
      isItalic: json['isItalic'] as bool,
      selectedFont: json['selectedFont'] as String,
      isBoldOrItalic: json['isBoldOrItalic'] as String,
      padding: (json['padding'] as num).toDouble(),
      webImage:
          const Uint8ListConverter().fromJson(json['webImage'] as List<int>?),
      mobileImage:
          const FileConverter().fromJson(json['mobileImage'] as String?),
      mobileBgImage:
          const FileConverter().fromJson(json['mobileBgImage'] as String?),
      webBgImage:
          const Uint8ListConverter().fromJson(json['webBgImage'] as List<int>?),
    );

Map<String, dynamic> _$IconEditorStateToJson(_IconEditorState instance) =>
    <String, dynamic>{
      'selectedTab': instance.selectedTab,
      'shape': _$ShapeEnumMap[instance.shape]!,
      'iconText': instance.iconText,
      'iconTextColor': instance.iconTextColor,
      'backgroundColor': instance.backgroundColor,
      'isBold': instance.isBold,
      'isItalic': instance.isItalic,
      'selectedFont': instance.selectedFont,
      'isBoldOrItalic': instance.isBoldOrItalic,
      'padding': instance.padding,
      'webImage': const Uint8ListConverter().toJson(instance.webImage),
      'mobileImage': const FileConverter().toJson(instance.mobileImage),
      'mobileBgImage': const FileConverter().toJson(instance.mobileBgImage),
      'webBgImage': const Uint8ListConverter().toJson(instance.webBgImage),
    };

const _$ShapeEnumMap = {
  Shape.circle: 'circle',
  Shape.square: 'square',
};
