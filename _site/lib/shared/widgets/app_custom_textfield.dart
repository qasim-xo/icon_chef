import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icon_chef/constants/extension_constants.dart';
import 'package:icon_chef/theme/app_colors.dart';

class AppTextField extends StatefulWidget {
  final bool isNumber;
  final String? initialValue;
  final TextAlign? textAlign;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function()? onTapOutside;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final bool? enabled;
  final bool? autofocus;
  final TextInputAction? textInputAction;
  final TextEditingController? textController;
  final TextInputType? keyboardType;
  final VoidCallback? onPressed;
  final Color? fillColor;
  final String? Function(String?)? validator;
  final int lines;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final InputBorder? focusedBorder;
  final EdgeInsetsGeometry? contentPadding;
  final Color? cursorColor;
  final bool readOnly;
  final InputBorder? border;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final int? maxLength;
  final bool alwaysFocused;
  final FocusNode? focusNode;
  final InputDecoration? inputDecoration;
  final TextStyle? style;

  const AppTextField({
    super.key,
    this.initialValue,
    this.textAlign,
    this.isNumber = false,
    this.onFieldSubmitted,
    this.onChanged,
    this.onEditingComplete,
    this.inputFormatters,
    this.obscureText = false,
    this.enabled = true,
    this.autofocus = false,
    this.textInputAction,
    this.textController,
    this.keyboardType,
    this.onPressed,
    this.fillColor,
    this.validator,
    this.lines = 1,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderRadius,
    this.prefixIcon,
    this.maxLength,
    this.suffixIcon,
    this.hintText,
    this.focusedBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: AppColors.blackColor),
    ),
    this.cursorColor,
    this.readOnly = false,
    this.border = const OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    this.labelText,
    this.labelStyle,
    this.hintStyle,
    this.textStyle,
    this.contentPadding,
    this.alwaysFocused = false,
    this.onTapOutside,
    this.focusNode,
    this.inputDecoration,
    this.style,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: widget.onChanged,
      textAlign: widget.textAlign ?? TextAlign.start,
      initialValue: widget.initialValue,
      onFieldSubmitted: widget.onFieldSubmitted,
      onEditingComplete: widget.onEditingComplete,
      enabled: widget.enabled,
      autofocus: widget.autofocus!,
      focusNode: widget.focusNode,
      obscureText: widget.obscureText,
      cursorColor: widget.cursorColor ?? AppColors.primaryColor,
      maxLines: widget.lines,
      readOnly: widget.readOnly || !widget.enabled!,
      controller: widget.textController,
      maxLength: widget.maxLength,
      validator: widget.validator,
      inputFormatters: widget.inputFormatters,
      style: widget.textStyle ?? context.textTheme.bodyMedium,
      keyboardType: widget.keyboardType,
      onTap: widget.onPressed,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIconConstraints: const BoxConstraints(
          maxWidth: 42,
          maxHeight: 42,
          minHeight: 26,
          minWidth: 26,
        ),
        // prefixIcon: widget.prefixIcon?.padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 10),
        // ),
        hintStyle: widget.hintStyle ??
            context.textTheme.bodySmall?.copyWith(
              color: AppColors.dividerColor,
            ),
        suffixIcon: widget.suffixIcon,
        labelStyle: widget.labelStyle,
        focusedBorder: widget.focusedBorder,
        enabledBorder: widget.border,
        disabledBorder: widget.border,
        errorBorder: widget.border,
        filled: true,
        fillColor: widget.fillColor ?? AppColors.primaryColor,
        // border: widget.border ?? widget.focusedBorder,
        labelText: widget.labelText,
        contentPadding: widget.contentPadding ??
            const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      ),
    );
  }
}
