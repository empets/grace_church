import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_church/core/extension/custome_extension.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.isLoading = false,
    this.backgroundColor,
    this.colorText,
    this.borderSideColor,

    this.fontSize,
  });
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? colorText;
  final Color? borderSideColor;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // height: 40.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: context.appColor.primaryBlue,
          foregroundColor: context.appColor.primaryBlue,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderSideColor ?? Colors.transparent),
            borderRadius: BorderRadius.circular(8.r),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(
                      icon,
                      size: 20.h,
                      color: context.appColor.primaryWhite,
                    ),
                    SizedBox(width: 7.w),
                  ],
                  Text(
                    label,
                    style: context.appTypographie.small.copyWith(
                      color: colorText,
                      fontSize: fontSize ?? 16.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
