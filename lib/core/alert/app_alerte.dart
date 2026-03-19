import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_church/core/extension/custome_extension.dart';

class AppAlert {
  static void showSuccess(
    BuildContext context,
    String message, {
    IconData? iconRight,
    String? imageIcon,
    Duration duration = const Duration(seconds: 3),
    bool showOnTop = false,
  }) {
    _showAppSnackBar(
      context,
      message: message,
      backgroundColor: context.appColor.primarySuccess,
      icon: Icons.check_circle,
      iconRight: iconRight,
      imageIcon: imageIcon,
      duration: duration,
      showOnTop: showOnTop,
    );
  }

  static void showError(
    BuildContext context,
    String message, {
    IconData? iconRight,
    String? imageIcon,
    Duration duration = const Duration(seconds: 3),
    bool showOnTop = false,
  }) {
    _showAppSnackBar(
      context,
      message: message,
      backgroundColor: Colors.red,
      icon: Icons.error,
      iconRight: iconRight,
      imageIcon: imageIcon,
      duration: duration,
      showOnTop: showOnTop,
    );
  }

  static void showInfo(
    BuildContext context,
    String message, {
    IconData? iconRight,
    String? imageIcon,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showAppSnackBar(
      context,
      message: message,
      backgroundColor: context.appColor.primaryWarning,
      icon: Icons.info,
      iconRight: iconRight,
      imageIcon: imageIcon,
      duration: duration,
    );
  }

  static void showWarning(
    BuildContext context,
    String message, {
    IconData? iconRight,
    String? imageIcon,
    Duration duration = const Duration(seconds: 3),
    bool showOnTop = false,
  }) {
    _showAppSnackBar(
      context,
      message: message,
      backgroundColor: context.appColor.primaryWarning,
      icon: Icons.warning,
      iconRight: iconRight,
      imageIcon: imageIcon,
      duration: duration,
    );
  }

  /// Fonction générique pour afficher une snackbar personnalisée.
  ///
  /// [context] : le BuildContext de la vue actuelle.
  /// [message] : le texte à afficher.
  /// [icon] : une icône optionnelle (ex: Icons.error, Icons.check_circle).
  /// [backgroundColor] : la couleur de fond de la snackbar.
  /// [duration] : durée d’affichage (par défaut 3 secondes).
  ///

  static void _showAppSnackBar(
    BuildContext context, {
    required String message,
    IconData? icon,
    IconData? iconRight,
    Color backgroundColor = Colors.blue,
    String? imageIcon,
    Duration duration = const Duration(seconds: 3),
    bool showOnTop = false,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 7.w, vertical: 3.h),
          behavior: showOnTop
              ? SnackBarBehavior.fixed
              : SnackBarBehavior.floating,
          backgroundColor: backgroundColor,
          duration: duration,
          content: Row(
            children: [
              if (icon != null) ...[
                Icon(icon, color: Colors.white),
                SizedBox(width: 10.w),
              ],
              if (imageIcon != null && imageIcon.isNotEmpty) ...[
                SvgPicture.asset(imageIcon),
                SizedBox(width: 10.w),
              ],
              Expanded(
                child: Container(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 7.w,
                    vertical: 3.h,
                  ),
                  child: Text(
                    message,
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              if (iconRight != null) ...[
                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                  icon: Icon(iconRight, color: Colors.white),
                ),
              ],
            ],
          ),
        ),
      );
  }
}
