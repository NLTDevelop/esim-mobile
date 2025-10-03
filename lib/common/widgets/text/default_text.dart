
import 'package:flutter/material.dart';

enum DefaultTextType {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall
}

class DefaultText extends StatelessWidget {
  const DefaultText.displayLarge(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.displayLarge;

  const DefaultText.displayMedium(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.displayMedium;

  const DefaultText.displaySmall(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.displaySmall;

  const DefaultText.headlineLarge(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.headlineLarge;

  const DefaultText.headlineMedium(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.headlineMedium;

  const DefaultText.headlineSmall(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.headlineSmall;

  const DefaultText.titleLarge(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.titleLarge;

  const DefaultText.titleMedium(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.titleMedium;

  const DefaultText.titleSmall(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.titleSmall;

  const DefaultText.bodyLarge(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.bodyLarge;

  const DefaultText.bodyMedium(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.bodyMedium;

  const DefaultText.bodySmall(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.bodySmall;

  const DefaultText.labelLarge(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.labelLarge;

  const DefaultText.labelMedium(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.labelMedium;

  const DefaultText.labelSmall(
      this.text, {
        super.key,
        this.color,
        this.fontSize,
        this.fontWeight,
        this.decoration,
        this.decorationColor,
        this.textAlign,
        this.maxLines,
        this.overflow,
        this.height,
        this.letterSpacing,
        this.fontFamily,
      }) : _type = DefaultTextType.labelSmall;

  final String text;
  final DefaultTextType _type;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? height;
  final double? letterSpacing;
  final String? fontFamily;
  final Color? decorationColor;

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: _getStyle(context)?.copyWith(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: decoration,
      decorationColor: decorationColor,
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily,
    ),
    maxLines: maxLines,
    overflow: overflow,
    textAlign: textAlign,
  );

  TextStyle? _getStyle(BuildContext context) => switch (_type) {
    DefaultTextType.displaySmall => Theme.of(context).textTheme.displaySmall,
    DefaultTextType.displayLarge => Theme.of(context).textTheme.displayLarge,
    DefaultTextType.displayMedium => Theme.of(context).textTheme.displayMedium,
    DefaultTextType.headlineLarge => Theme.of(context).textTheme.headlineLarge,
    DefaultTextType.headlineMedium => Theme.of(context).textTheme.headlineMedium,
    DefaultTextType.headlineSmall => Theme.of(context).textTheme.headlineSmall,
    DefaultTextType.titleLarge => Theme.of(context).textTheme.titleLarge,
    DefaultTextType.titleMedium => Theme.of(context).textTheme.titleMedium,
    DefaultTextType.titleSmall => Theme.of(context).textTheme.titleSmall,
    DefaultTextType.bodyLarge => Theme.of(context).textTheme.bodyLarge,
    DefaultTextType.bodyMedium => Theme.of(context).textTheme.bodyMedium,
    DefaultTextType.bodySmall => Theme.of(context).textTheme.bodySmall,
    DefaultTextType.labelLarge => Theme.of(context).textTheme.labelLarge,
    DefaultTextType.labelMedium => Theme.of(context).textTheme.labelMedium,
    DefaultTextType.labelSmall => Theme.of(context).textTheme.labelSmall,
  };
}
