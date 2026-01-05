import 'dart:ui';
import 'package:esim_mob_app/common/theme/colored_palette/colored_palette.dart';
import 'package:flutter/material.dart';

class LightColoredPalette implements ColoredPalette {
  @override
  Brightness get brightness => Brightness.light;

  @override
  Color get background => const Color(0xFFFFFFFF);

  @override
  Color get disabledPrimaryButton => const Color(0xFFEAEAEA);

  @override
  Color get enabledPrimaryButton => const Color(0xFFD8CCBC);

  @override
  Color get onBackground => const Color(0xFF000000);

  @override
  Color get onDisabledPrimaryButton => const Color(0xFF6A5E4E);

  @override
  Color get onEnabledPrimaryButton => const Color(0xFF423626);

  @override
  Color get primary => const Color(0xFF0d6efd);

  @override
  Color get text => const Color(0xFF000000);

  @override
  Color get error => const Color(0xFFF55050);

  @override
  Color get textFieldHeader => const Color(0xFF6A5E4E);

  @override
  Color get hintText => const Color(0x808E8E93);

  @override
  Color get divider => const Color(0xFFE2D6C6);

  @override
  Color get enabledSecondaryButton => const Color(0xFFFFFFFF);

  @override
  Color get disabledSecondaryButton => const Color(0xFFEAEAEA);

  @override
  Color get onEnabledSecondaryButton => const Color(0xFF000000);

  @override
  Color get onDisabledSecondaryButton => const Color(0xFF6A5E4E);

  @override
  Color get welcomeText => const Color(0xFFFFFEEE);

  @override
  Color get secondaryText => const Color(0xFFFFFFFF);

  @override
  Color get shadow => const Color(0x808E8E93);

  @override
  Color get textDialog => const Color(0xFF0F1114);

  @override
  Color get textDialogButton => const Color(0xFF746858);

  @override
  Color get textFieldBorder => const Color(0xFFD4D4D9);

  @override
  Color get cardBorder => const Color(0xFFe5e5e5);

  @override
  Color get navBarBackground => const Color(0xFFFFFFFF);

  @override
  Color get disabledNavBarButton => const Color(0xFF343a40);

  @override
  Color get enabledNavBarButton => const Color(0xFFFFFFFF);

  @override
  Color get actionButton => const Color(0xFF8E8E93);

  @override
  Color get darknessBackground => const Color(0xFFF5F5F5);

  @override
  Color get searchIcon => const Color(0xFF2E89F6);

  @override
  Color get searchCursor => const Color(0xFF9B9B94);

  @override
  Color get icon => const Color(0xFF2E89F6);

  @override
  Color get toggleCircle => const Color(0xFF002847);

  @override
  Color get toggleActive => const Color(0xFF2E89F6);

  @override
  Color get selectedTabLabel => const Color(0xFF928676);

  @override
  Color get avatarBackground => const Color(0xFFC4B8A8);

  @override
  Color get splashBackground => const Color(0xFF02101e);

  @override
  Color get descriptionText => const Color(0xFF343a40);

  @override
  Color get addBalance => const Color(0xFF198754);
}
