import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'color_extension.tailor.dart';

@TailorMixin()
class ColorExtension extends ThemeExtension<ColorExtension> with _$ColorExtensionTailorMixin {
  const ColorExtension({
    required this.primary,
    required this.background,
    required this.onBackground,
    required this.text,
    required this.enabledPrimaryButton,
    required this.disabledPrimaryButton,
    required this.onEnabledPrimaryButton,
    required this.onDisabledPrimaryButton,
    required this.error,
    required this.textFieldHeader,
    required this.hintText,
    required this.divider,
    required this.enabledSecondaryButton,
    required this.disabledSecondaryButton,
    required this.onEnabledSecondaryButton,
    required this.onDisabledSecondaryButton,
    required this.welcomeText,
    required this.secondaryText,
    required this.shadow,
    required this.textDialog,
    required this.textDialogButton,
    required this.textFieldBorder,
    required this.navBarBackground,
    required this.disabledNavBarButton,
    required this.enabledNavBarButton,
    required this.actionButton,
    required this.darknessBackground,
    required this.searchIcon,
    required this.searchCursor,
    required this.splashBackground,
    required this.cardBorder,
    required this.icon,
    required this.toggleCircle,
    required this.toggleActive,
    required this.descriptionText,
  });

  @override
  final Color primary;
  @override
  final Color background;
  @override
  final Color onBackground;
  @override
  final Color text;
  @override
  final Color enabledPrimaryButton;
  @override
  final Color disabledPrimaryButton;
  @override
  final Color onEnabledPrimaryButton;
  @override
  final Color onDisabledPrimaryButton;
  @override
  final Color error;
  @override
  final Color textFieldHeader;
  @override
  final Color hintText;
  @override
  final Color divider;
  @override
  final Color onEnabledSecondaryButton;
  @override
  final Color onDisabledSecondaryButton;
  @override
  final Color enabledSecondaryButton;
  @override
  final Color disabledSecondaryButton;
  @override
  final Color welcomeText;
  @override
  final Color secondaryText;
  @override
  final Color shadow;
  @override
  final Color textDialog;
  @override
  final Color textDialogButton;
  @override
  final Color textFieldBorder;
  @override
  final Color cardBorder;
  @override
  final Color navBarBackground;
  @override
  final Color disabledNavBarButton;
  @override
  final Color enabledNavBarButton;
  @override
  final Color actionButton;
  @override
  final Color darknessBackground;
  @override
  final Color icon;
  @override
  final Color searchIcon;
  @override
  final Color searchCursor;
  @override
  final Color splashBackground;
  @override
  final Color toggleCircle;
  @override
  final Color toggleActive;
  @override
  final Color descriptionText;
}
