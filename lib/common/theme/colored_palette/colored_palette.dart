import 'dart:ui';

abstract interface class ColoredPalette {
  const ColoredPalette({
    required this.brightness,
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
    required this.selectedTabLabel,
    required this.avatarBackground,
    required this.splashBackground,
    required this.cardBorder,
    required this.icon,
    required this.toggleActive,
    required this.toggleCircle,
    required this.descriptionText,
  });

  final Brightness brightness;
  final Color primary;
  final Color background;
  final Color onBackground;
  final Color text;
  final Color descriptionText;
  final Color enabledPrimaryButton;
  final Color disabledPrimaryButton;
  final Color onEnabledPrimaryButton;
  final Color onDisabledPrimaryButton;
  final Color error;
  final Color textFieldHeader;
  final Color hintText;
  final Color divider;
  final Color enabledSecondaryButton;
  final Color disabledSecondaryButton;
  final Color onEnabledSecondaryButton;
  final Color onDisabledSecondaryButton;
  final Color welcomeText;
  final Color secondaryText;
  final Color shadow;
  final Color textDialog;
  final Color textDialogButton;
  final Color textFieldBorder;
  final Color cardBorder;
  final Color navBarBackground;
  final Color disabledNavBarButton;
  final Color enabledNavBarButton;
  final Color actionButton;
  final Color darknessBackground;
  final Color icon;
  final Color searchIcon;
  final Color searchCursor;
  final Color selectedTabLabel;
  final Color avatarBackground;
  final Color splashBackground;
  final Color toggleCircle;
  final Color toggleActive;
}
