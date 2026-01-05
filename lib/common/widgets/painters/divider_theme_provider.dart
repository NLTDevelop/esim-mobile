import 'package:flutter/material.dart';

class DividerThemeProvider {
  final DividerThemeData _dividerTheme;
  final ThemeData _theme;
  final DividerThemeData _defaults;

  double? _width;
  double? _height;
  double? _thickness;
  double? _indent;
  double? _endIndent;
  Color? _color;

  DividerThemeProvider._(BuildContext context)
      : _dividerTheme = DividerTheme.of(context),
        _theme = Theme.of(context),
        _defaults = Theme.of(context).useMaterial3
            ? _DividerDefaultsM3(context)
            : _DividerDefaultsM2(context);

  static DividerThemeProvider of(BuildContext context) {
    return DividerThemeProvider._(context);
  }

  DividerThemeProvider withDefaults({
    double? width,
    double? height,
    double? thickness,
    double? indent,
    double? endIndent,
    Color? color,
  }) {
    _width = width ?? _width;
    _height = height ?? _height;
    _thickness = thickness ?? _thickness;
    _indent = indent ?? _indent;
    _endIndent = endIndent ?? _endIndent;
    _color = color ?? _color;

    return this;
  }

  double get width => _width ?? _dividerTheme.space ?? _defaults.space!;

  double get height => _height ?? _dividerTheme.space ?? _defaults.space!;

  double get thickness =>
      _thickness ?? _dividerTheme.thickness ?? _defaults.thickness!;

  double get indent => _indent ?? _dividerTheme.indent ?? _defaults.indent!;

  double get endIndent =>
      _endIndent ?? _dividerTheme.endIndent ?? _defaults.endIndent!;

  Color get color =>
      _color ?? _dividerTheme.color ?? _defaults.color ?? _theme.dividerColor;
}

class _DividerDefaultsM3 extends DividerThemeData {
  const _DividerDefaultsM3(this.context)
      : super(
    space: 16,
    thickness: 1.0,
    indent: 0,
    endIndent: 0,
  );

  final BuildContext context;

  @override
  Color? get color => Theme.of(context).colorScheme.outlineVariant;
}

class _DividerDefaultsM2 extends DividerThemeData {
  const _DividerDefaultsM2(this.context)
      : super(
    space: 16,
    thickness: 0,
    indent: 0,
    endIndent: 0,
  );

  final BuildContext context;

  @override
  Color? get color => Theme.of(context).dividerColor;
}