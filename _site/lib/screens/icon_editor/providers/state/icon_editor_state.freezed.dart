// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'icon_editor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IconEditorState {
  String get selectedTab;
  Shape get shape;
  String get iconText;
  int get iconTextColor;
  int get backgroundColor;
  bool get isBold;
  bool get isItalic;
  String get selectedFont;
  String get isBoldOrItalic;
  double get padding;
  @FileConverter()
  File? get mobileImage;
  @Uint8ListConverter()
  Uint8List? get webImage;

  /// Create a copy of IconEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IconEditorStateCopyWith<IconEditorState> get copyWith =>
      _$IconEditorStateCopyWithImpl<IconEditorState>(
          this as IconEditorState, _$identity);

  /// Serializes this IconEditorState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IconEditorState &&
            (identical(other.selectedTab, selectedTab) ||
                other.selectedTab == selectedTab) &&
            (identical(other.shape, shape) || other.shape == shape) &&
            (identical(other.iconText, iconText) ||
                other.iconText == iconText) &&
            (identical(other.iconTextColor, iconTextColor) ||
                other.iconTextColor == iconTextColor) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.isBold, isBold) || other.isBold == isBold) &&
            (identical(other.isItalic, isItalic) ||
                other.isItalic == isItalic) &&
            (identical(other.selectedFont, selectedFont) ||
                other.selectedFont == selectedFont) &&
            (identical(other.isBoldOrItalic, isBoldOrItalic) ||
                other.isBoldOrItalic == isBoldOrItalic) &&
            (identical(other.padding, padding) || other.padding == padding) &&
            (identical(other.mobileImage, mobileImage) ||
                other.mobileImage == mobileImage) &&
            const DeepCollectionEquality().equals(other.webImage, webImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedTab,
      shape,
      iconText,
      iconTextColor,
      backgroundColor,
      isBold,
      isItalic,
      selectedFont,
      isBoldOrItalic,
      padding,
      mobileImage,
      const DeepCollectionEquality().hash(webImage));

  @override
  String toString() {
    return 'IconEditorState(selectedTab: $selectedTab, shape: $shape, iconText: $iconText, iconTextColor: $iconTextColor, backgroundColor: $backgroundColor, isBold: $isBold, isItalic: $isItalic, selectedFont: $selectedFont, isBoldOrItalic: $isBoldOrItalic, padding: $padding, mobileImage: $mobileImage, webImage: $webImage)';
  }
}

/// @nodoc
abstract mixin class $IconEditorStateCopyWith<$Res> {
  factory $IconEditorStateCopyWith(
          IconEditorState value, $Res Function(IconEditorState) _then) =
      _$IconEditorStateCopyWithImpl;
  @useResult
  $Res call(
      {String selectedTab,
      Shape shape,
      String iconText,
      int iconTextColor,
      int backgroundColor,
      bool isBold,
      bool isItalic,
      String selectedFont,
      String isBoldOrItalic,
      double padding,
      @FileConverter() File? mobileImage,
      @Uint8ListConverter() Uint8List? webImage});
}

/// @nodoc
class _$IconEditorStateCopyWithImpl<$Res>
    implements $IconEditorStateCopyWith<$Res> {
  _$IconEditorStateCopyWithImpl(this._self, this._then);

  final IconEditorState _self;
  final $Res Function(IconEditorState) _then;

  /// Create a copy of IconEditorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedTab = null,
    Object? shape = null,
    Object? iconText = null,
    Object? iconTextColor = null,
    Object? backgroundColor = null,
    Object? isBold = null,
    Object? isItalic = null,
    Object? selectedFont = null,
    Object? isBoldOrItalic = null,
    Object? padding = null,
    Object? mobileImage = freezed,
    Object? webImage = freezed,
  }) {
    return _then(_self.copyWith(
      selectedTab: null == selectedTab
          ? _self.selectedTab
          : selectedTab // ignore: cast_nullable_to_non_nullable
              as String,
      shape: null == shape
          ? _self.shape
          : shape // ignore: cast_nullable_to_non_nullable
              as Shape,
      iconText: null == iconText
          ? _self.iconText
          : iconText // ignore: cast_nullable_to_non_nullable
              as String,
      iconTextColor: null == iconTextColor
          ? _self.iconTextColor
          : iconTextColor // ignore: cast_nullable_to_non_nullable
              as int,
      backgroundColor: null == backgroundColor
          ? _self.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as int,
      isBold: null == isBold
          ? _self.isBold
          : isBold // ignore: cast_nullable_to_non_nullable
              as bool,
      isItalic: null == isItalic
          ? _self.isItalic
          : isItalic // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedFont: null == selectedFont
          ? _self.selectedFont
          : selectedFont // ignore: cast_nullable_to_non_nullable
              as String,
      isBoldOrItalic: null == isBoldOrItalic
          ? _self.isBoldOrItalic
          : isBoldOrItalic // ignore: cast_nullable_to_non_nullable
              as String,
      padding: null == padding
          ? _self.padding
          : padding // ignore: cast_nullable_to_non_nullable
              as double,
      mobileImage: freezed == mobileImage
          ? _self.mobileImage
          : mobileImage // ignore: cast_nullable_to_non_nullable
              as File?,
      webImage: freezed == webImage
          ? _self.webImage
          : webImage // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _IconEditorState implements IconEditorState {
  _IconEditorState(
      {required this.selectedTab,
      this.shape = Shape.circle,
      required this.iconText,
      required this.iconTextColor,
      required this.backgroundColor,
      required this.isBold,
      required this.isItalic,
      required this.selectedFont,
      required this.isBoldOrItalic,
      required this.padding,
      @FileConverter() required this.mobileImage,
      @Uint8ListConverter() required this.webImage});
  factory _IconEditorState.fromJson(Map<String, dynamic> json) =>
      _$IconEditorStateFromJson(json);

  @override
  final String selectedTab;
  @override
  @JsonKey()
  final Shape shape;
  @override
  final String iconText;
  @override
  final int iconTextColor;
  @override
  final int backgroundColor;
  @override
  final bool isBold;
  @override
  final bool isItalic;
  @override
  final String selectedFont;
  @override
  final String isBoldOrItalic;
  @override
  final double padding;
  @override
  @FileConverter()
  final File? mobileImage;
  @override
  @Uint8ListConverter()
  final Uint8List? webImage;

  /// Create a copy of IconEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IconEditorStateCopyWith<_IconEditorState> get copyWith =>
      __$IconEditorStateCopyWithImpl<_IconEditorState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IconEditorStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IconEditorState &&
            (identical(other.selectedTab, selectedTab) ||
                other.selectedTab == selectedTab) &&
            (identical(other.shape, shape) || other.shape == shape) &&
            (identical(other.iconText, iconText) ||
                other.iconText == iconText) &&
            (identical(other.iconTextColor, iconTextColor) ||
                other.iconTextColor == iconTextColor) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.isBold, isBold) || other.isBold == isBold) &&
            (identical(other.isItalic, isItalic) ||
                other.isItalic == isItalic) &&
            (identical(other.selectedFont, selectedFont) ||
                other.selectedFont == selectedFont) &&
            (identical(other.isBoldOrItalic, isBoldOrItalic) ||
                other.isBoldOrItalic == isBoldOrItalic) &&
            (identical(other.padding, padding) || other.padding == padding) &&
            (identical(other.mobileImage, mobileImage) ||
                other.mobileImage == mobileImage) &&
            const DeepCollectionEquality().equals(other.webImage, webImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedTab,
      shape,
      iconText,
      iconTextColor,
      backgroundColor,
      isBold,
      isItalic,
      selectedFont,
      isBoldOrItalic,
      padding,
      mobileImage,
      const DeepCollectionEquality().hash(webImage));

  @override
  String toString() {
    return 'IconEditorState(selectedTab: $selectedTab, shape: $shape, iconText: $iconText, iconTextColor: $iconTextColor, backgroundColor: $backgroundColor, isBold: $isBold, isItalic: $isItalic, selectedFont: $selectedFont, isBoldOrItalic: $isBoldOrItalic, padding: $padding, mobileImage: $mobileImage, webImage: $webImage)';
  }
}

/// @nodoc
abstract mixin class _$IconEditorStateCopyWith<$Res>
    implements $IconEditorStateCopyWith<$Res> {
  factory _$IconEditorStateCopyWith(
          _IconEditorState value, $Res Function(_IconEditorState) _then) =
      __$IconEditorStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String selectedTab,
      Shape shape,
      String iconText,
      int iconTextColor,
      int backgroundColor,
      bool isBold,
      bool isItalic,
      String selectedFont,
      String isBoldOrItalic,
      double padding,
      @FileConverter() File? mobileImage,
      @Uint8ListConverter() Uint8List? webImage});
}

/// @nodoc
class __$IconEditorStateCopyWithImpl<$Res>
    implements _$IconEditorStateCopyWith<$Res> {
  __$IconEditorStateCopyWithImpl(this._self, this._then);

  final _IconEditorState _self;
  final $Res Function(_IconEditorState) _then;

  /// Create a copy of IconEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selectedTab = null,
    Object? shape = null,
    Object? iconText = null,
    Object? iconTextColor = null,
    Object? backgroundColor = null,
    Object? isBold = null,
    Object? isItalic = null,
    Object? selectedFont = null,
    Object? isBoldOrItalic = null,
    Object? padding = null,
    Object? mobileImage = freezed,
    Object? webImage = freezed,
  }) {
    return _then(_IconEditorState(
      selectedTab: null == selectedTab
          ? _self.selectedTab
          : selectedTab // ignore: cast_nullable_to_non_nullable
              as String,
      shape: null == shape
          ? _self.shape
          : shape // ignore: cast_nullable_to_non_nullable
              as Shape,
      iconText: null == iconText
          ? _self.iconText
          : iconText // ignore: cast_nullable_to_non_nullable
              as String,
      iconTextColor: null == iconTextColor
          ? _self.iconTextColor
          : iconTextColor // ignore: cast_nullable_to_non_nullable
              as int,
      backgroundColor: null == backgroundColor
          ? _self.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as int,
      isBold: null == isBold
          ? _self.isBold
          : isBold // ignore: cast_nullable_to_non_nullable
              as bool,
      isItalic: null == isItalic
          ? _self.isItalic
          : isItalic // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedFont: null == selectedFont
          ? _self.selectedFont
          : selectedFont // ignore: cast_nullable_to_non_nullable
              as String,
      isBoldOrItalic: null == isBoldOrItalic
          ? _self.isBoldOrItalic
          : isBoldOrItalic // ignore: cast_nullable_to_non_nullable
              as String,
      padding: null == padding
          ? _self.padding
          : padding // ignore: cast_nullable_to_non_nullable
              as double,
      mobileImage: freezed == mobileImage
          ? _self.mobileImage
          : mobileImage // ignore: cast_nullable_to_non_nullable
              as File?,
      webImage: freezed == webImage
          ? _self.webImage
          : webImage // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

// dart format on
