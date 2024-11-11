import 'package:flutter/material.dart';
import 'package:flutter_kit/src/core/theme/color_schemes.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dimens.dart';

class AppTheme {
    static final font = GoogleFonts.inter(); // Rubik pour tout le texte

  static ThemeData _buildTheme({required Brightness brightness}) {
    const ColorScheme colors = lightColorScheme;
    ThemeData baseTheme = ThemeData.from(
      useMaterial3: true,
      colorScheme: colors,
    );
    // return ThemeData(
    //   useMaterial3: true,
    //   textTheme: _buildTextTheme(colors: colors),
    //   appBarTheme: AppBarTheme(
    //     surfaceTintColor: Colors.transparent,
    //     backgroundColor: colors.surface,
    //   ),
    //   cardTheme: CardTheme(
    //     color: colors.surface,
    //   ),
    //   colorScheme: colors,
    // );
    return baseTheme.copyWith(
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: font.copyWith(fontWeight: FontWeight.w500, fontSize: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.borderRadius)),
          minimumSize: const Size(168, 47),
          padding: const EdgeInsets.symmetric(vertical: Dimens.doubleSpacing, horizontal: 28.0),
          side: BorderSide(color: colors.primary),
        ).copyWith(
          overlayColor: WidgetStateProperty.all(Colors.red.withOpacity(0.2)),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          foregroundColor: WidgetStateProperty.all(colors.primary),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          textStyle: font.copyWith(fontWeight: FontWeight.w500, fontSize: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.borderRadius)),
          minimumSize: const Size(168, 47),
          padding: const EdgeInsets.symmetric(vertical: Dimens.doubleSpacing, horizontal: 28.0),
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
        ).copyWith(
          overlayColor: WidgetStateProperty.all(Colors.red.withOpacity(0.2)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: font.copyWith(fontWeight: FontWeight.w500, fontSize: 16),
          padding: const EdgeInsets.symmetric(vertical: Dimens.doubleSpacing, horizontal: 28.0),
          foregroundColor: colors.primaryContainer,
        ).copyWith(
          overlayColor: WidgetStateProperty.all(colors.error.withOpacity(0.2)),
        ),
      ),
       elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: font.copyWith(fontWeight: FontWeight.w500, fontSize: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.borderRadius),
          ),
          minimumSize: const Size(168, 47),
          padding: const EdgeInsets.only(
            top: Dimens.doubleSpacing,
            bottom: Dimens.doubleSpacing,
            left: 28.0,
            right: 28.0,
          ),
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          alignment: Alignment.center,
        ).copyWith(
          overlayColor: WidgetStateProperty.all(Colors.red.withOpacity(0.2)),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
        elevation: 0,
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) return colors.onTertiaryContainer;
          if (states.contains(WidgetState.selected)) return colors.primary;
          return colors.primary;
        }),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) return colors.primary.withOpacity(0.08);
          if (states.contains(WidgetState.focused)) return colors.primary.withOpacity(0.12);
          return colors.tertiary;
        }),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) return colors.onTertiaryContainer; // Couleur lorsque désactivé
          if (states.contains(WidgetState.selected)) return colors.primary; // Couleur lorsque sélectionné
          return colors.surface; // Couleur lorsque non sélectionné
        }),
        checkColor: WidgetStateProperty.all(colors.onPrimary), // Couleur de la coche
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4), // Forme personnalisée (ici un carré avec des bords arrondis)
        ),
        side: BorderSide(color: colors.onPrimaryFixed), // Bordure de la case
        materialTapTargetSize: MaterialTapTargetSize.padded, // Taille plus grande pour faciliter les interactions
      ),
      scaffoldBackgroundColor: colors.surface,
      appBarTheme: AppBarTheme(
        toolbarHeight: Dimens.appBarHeight,
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: colors.surface,
        centerTitle: true,
        titleTextStyle: font.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: colors.onSecondary,
        elevation: 0,
      ),
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(horizontal: Dimens.listTilePaddingLeft, vertical: Dimens.listTilePaddingTop),
        tileColor: colors.surface,
        iconColor: colors.secondary,
        textColor: colors.secondary,
        titleTextStyle: font.copyWith(fontWeight: FontWeight.w600, fontSize: Dimens.fontSize),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.borderRadius)),
          foregroundColor: colors.onTertiaryContainer,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: colors.surface,
        filled: true,
       
        contentPadding: const EdgeInsets.symmetric(vertical: Dimens.inputPaddingVertical, horizontal: Dimens.inputPaddingHorizontal),
        hintStyle: font.copyWith(color: colors.tertiaryContainer, fontSize: 16, fontWeight: FontWeight.w400),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(Dimens.inputRadius)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: colors.tertiaryContainer), borderRadius: BorderRadius.circular(Dimens.inputRadius)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: colors.secondary), borderRadius: BorderRadius.circular(Dimens.inputRadius)),
        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: colors.error), borderRadius: BorderRadius.circular(Dimens.inputRadius)),
        disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: colors.surface), borderRadius: BorderRadius.circular(Dimens.inputRadius)),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colors.surface,
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.secondary,
        selectedIconTheme: const IconThemeData(size: Dimens.iconHeight),
        unselectedIconTheme: const IconThemeData(size: Dimens.iconHeight),
        selectedLabelStyle: font.copyWith(fontSize: Dimens.fontSize, fontWeight: FontWeight.w500),
        unselectedLabelStyle: font.copyWith(fontSize: Dimens.fontSize, fontWeight: FontWeight.w500, color: colors.secondary),
        elevation: 10,
      ),
      textTheme: _buildTextTheme(colors: colors),
    );
  }

  static TextTheme _buildTextTheme({required ColorScheme colors}) {
     return TextTheme(
      bodySmall: font.copyWith(color: colors.tertiaryContainer, fontWeight: FontWeight.w600, fontSize: 14),
      bodyLarge: font.copyWith(color: colors.tertiary, fontWeight: FontWeight.w700, fontSize: 26, height: 41.48 / 35),
      bodyMedium: font.copyWith(color: colors.onSurface, fontSize: 20, fontWeight: FontWeight.w400),
      titleLarge: font.copyWith(color: colors.secondary, fontWeight: FontWeight.w700, fontSize: 24),
      titleMedium: font.copyWith(color: colors.onSurface, fontWeight: FontWeight.w400, fontSize: 14),
      labelLarge: font.copyWith(color: colors.tertiary, fontWeight: FontWeight.w400, fontSize: 14),
      labelMedium: font.copyWith(color: colors.onSurface, fontSize: 12, fontWeight: FontWeight.w500),
      labelSmall: font.copyWith(color: colors.tertiaryContainer, fontWeight: FontWeight.w400, fontSize: 10),
    );
  }

  static final ThemeData lightTheme = _buildTheme(brightness: Brightness.light);

  static final ThemeData darkTheme = _buildTheme(brightness: Brightness.dark);
}
