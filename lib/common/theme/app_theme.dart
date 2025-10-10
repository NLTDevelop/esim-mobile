import 'package:flutter/material.dart';

import 'colored_palette/colored_palette.dart';
import 'extension/color/color_extension.dart';


ThemeData createTheme(ColoredPalette palette) => ThemeData(
  useMaterial3: true,
  fontFamily: 'Quicksand',
  scaffoldBackgroundColor: palette.background,
  brightness: palette.brightness,
  primaryColor: palette.primary,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  sliderTheme: SliderThemeData(
    valueIndicatorColor: palette.primary,
    trackHeight: 2.0,
    thumbShape: const RoundSliderThumbShape(
      enabledThumbRadius: 8.0,
      elevation: 0.0,
      pressedElevation: 0.0,
    ),
    overlayShape: const RoundSliderOverlayShape(overlayRadius: 6.0),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    modalBarrierColor: palette.onBackground.withOpacity(0.70),
  ),
  navigationBarTheme: NavigationBarThemeData(
    indicatorColor: Colors.transparent,
    backgroundColor: palette.navBarBackground,
    labelTextStyle: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return TextStyle(
          color: palette.primary,
          fontWeight: FontWeight.w600,
          fontSize: 10.0,
          letterSpacing: 0.0,
        );
      } else {
        return TextStyle(
          color: palette.disabledNavBarButton,
          fontWeight: FontWeight.w600,
          fontSize: 10.0,
          letterSpacing: 0.0,
        );
      }
    }),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0.0,
    backgroundColor: palette.navBarBackground,
    selectedItemColor: palette.primary,
    unselectedItemColor: palette.disabledNavBarButton,
    selectedIconTheme: IconThemeData(
      color: palette.primary,
      size: 24.0,
    ),
    unselectedIconTheme: IconThemeData(
      color: palette.disabledNavBarButton,
      size: 24.0,
    ),
    selectedLabelStyle: TextStyle(
      color: palette.primary,
      fontWeight: FontWeight.w600,
      fontSize: 10.0,
      letterSpacing: 0.0,
    ),
    unselectedLabelStyle: TextStyle(
      color: palette.disabledNavBarButton,
      fontWeight: FontWeight.w600,
      fontSize: 10.0,
      letterSpacing: 0.0,
    ),
    showSelectedLabels: false,
    showUnselectedLabels: false,
    enableFeedback: false,
  ),
  colorScheme: ColorScheme(
    primary: palette.primary,
    secondary: palette.primary,
    surface: palette.background,
    surfaceContainer: palette.background,
    error: palette.error,
    onPrimary: palette.onBackground,
    onSecondary: palette.onBackground,
    onSurface: palette.onBackground,
    onBackground: palette.onBackground,
    onError: palette.onBackground,
    brightness: palette.brightness,
  ),
  extensions: [
    ColorExtension(
      primary: palette.primary,
      background: palette.background,
      onBackground: palette.onBackground,
      text: palette.text,
      enabledPrimaryButton: palette.enabledPrimaryButton,
      disabledPrimaryButton: palette.disabledPrimaryButton,
      onEnabledPrimaryButton: palette.onEnabledPrimaryButton,
      onDisabledPrimaryButton: palette.onDisabledPrimaryButton,
      error: palette.error,
      textFieldHeader: palette.textFieldHeader,
      hintText: palette.hintText,
      divider: palette.divider,
      enabledSecondaryButton: palette.enabledSecondaryButton,
      disabledSecondaryButton: palette.disabledSecondaryButton,
      onEnabledSecondaryButton: palette.onEnabledSecondaryButton,
      onDisabledSecondaryButton: palette.onDisabledSecondaryButton,
      welcomeText: palette.welcomeText,
      secondaryText: palette.secondaryText,
      shadow: palette.shadow,
      textDialog: palette.textDialog,
      textDialogButton: palette.textDialogButton,
      textFieldBorder: palette.textFieldBorder,
      cardBorder: palette.cardBorder,
      navBarBackground: palette.navBarBackground,
      disabledNavBarButton: palette.disabledNavBarButton,
      enabledNavBarButton: palette.enabledNavBarButton,
      actionButton: palette.actionButton,
      darknessBackground: palette.darknessBackground,
      searchIcon: palette.searchIcon,
      searchCursor: palette.searchCursor,
      splashBackground: palette.splashBackground,
      toggleActive: palette.toggleActive,
      toggleCircle: palette.toggleCircle,
      icon: palette.icon,
      descriptionText: palette.descriptionText

    ),
  ],
  dividerTheme: DividerThemeData(
    space: 0.0,
    thickness: 1.0,
    color: palette.divider,
  ),
  appBarTheme: AppBarTheme(
    surfaceTintColor: palette.background,
    color: palette.background,
// shadowColor: palette.shadow.withOpacity(0.15),
    centerTitle: false,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: palette.text,
      fontWeight: FontWeight.w500,
      fontSize: 20.0,
      fontFamily: 'Genttars',
    ),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: palette.selectedTabLabel,
    unselectedLabelColor: palette.text,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        color: palette.text,
        width: 1.0,
      ),
      insets: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
    ),
    indicatorColor: palette.text,
    indicatorSize: TabBarIndicatorSize.tab,
    labelStyle: const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
      letterSpacing: 0.0,
      fontFamily: 'Genttars',
    ),
    unselectedLabelStyle: const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
      letterSpacing: 0.0,
      fontFamily: 'Genttars',
    ),
    dividerColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: palette.background,
    hintStyle: TextStyle(
      color: palette.hintText,
      fontWeight: FontWeight.w300,
      fontSize: 14.0,
    ),
    labelStyle: TextStyle(
      color: palette.text,
      fontWeight: FontWeight.w300,
      fontSize: 14.0,
    ),
    errorStyle: TextStyle(
      color: palette.error,
      fontWeight: FontWeight.w400,
      fontSize: 10.0,
      letterSpacing: 0.0,
    ),
    helperStyle: TextStyle(
      color: palette.text,
      fontWeight: FontWeight.w400,
      fontSize: 10.0,
      letterSpacing: 0.0,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: palette.textFieldBorder,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(0.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: palette.textFieldBorder,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(0.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: palette.textFieldBorder,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(0.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(0.0),
      borderSide: BorderSide(
        color: palette.error,
        width: 1.0,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(0.0),
      borderSide: BorderSide(
        color: palette.error,
        width: 1.0,
      ),
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all(palette.background),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return palette.primary;
      }
      return palette.background;
    }),
    side: BorderSide(
      color: palette.primary,
      width: 1.0,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2.0),
    ),
  ),
  textTheme:  TextTheme(
    displayLarge: const TextStyle(),
    displayMedium:const  TextStyle(),
    displaySmall: const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
      letterSpacing: 0.0,
    ),
    headlineLarge: const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 48.0,
      letterSpacing: 0.0,
    ),
    headlineMedium: const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 40.0,
      letterSpacing: 0.0,
    ),
    headlineSmall: const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 24.0,
      letterSpacing: 0.0,
    ),
    titleLarge: const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20.0,
    ),
    titleMedium: const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 17.0
    ),
    titleSmall: const TextStyle(
      fontWeight: FontWeight.w500,
// height: 24.0,
      fontSize: 15.0,
      letterSpacing: 0.0,
    ),
    bodyLarge: TextStyle(
      fontWeight: FontWeight.w500,
// height: 48.0,
      fontSize: 17.0,
      letterSpacing: 0.0,
        color: palette.text
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.w500,
// height: 40.0,
      fontSize: 32.0,
      letterSpacing: 2.0,
        color: palette.text
    ),
    bodySmall: const TextStyle(
      fontWeight: FontWeight.w500,
// height: 24.0,
      fontSize: 24.0,
      letterSpacing: 0.0,
    ),
    labelLarge: TextStyle(
      fontWeight: FontWeight.w600,
// height: 40.0,
      fontSize: 20.0,
      letterSpacing: 0.0,
        color: palette.text
    ),
    labelMedium: const TextStyle(
      fontWeight: FontWeight.w600,
// height: 32.0,
      fontSize: 16.0,
      letterSpacing: 0.0,
    ),
    labelSmall: const TextStyle(
      fontWeight: FontWeight.w400,
// height: 24.0,
      fontSize: 12.0,
      letterSpacing: 0.0,
    ),
  ),
);
