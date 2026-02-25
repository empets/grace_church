import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_church/core/extension/custome_extension.dart';

class ProductionFormCustomer extends StatelessWidget {
  const ProductionFormCustomer({
    super.key,
    this.onChanged,
    required this.textLabel,
    this.isCancel,
    required this.errorText,
    required this.msgError,
    this.textInputType,
    this.controller,
    this.maxLines,
    this.minLines,
    this.hintStyle,
    this.readOnly,
    this.prefixIcon,
    this.letSpace,
    required this.inputLabel,
    this.inputStyle,
    this.sufixIcon,
    this.isColorBlue = false,
    this.inputLabelSize,
  });

  final void Function(String)? onChanged;
  final String textLabel;
  final String inputLabel;
  final bool? isCancel;
  final String? errorText;
  final String msgError;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final TextStyle? hintStyle;
  final TextStyle? inputStyle;
  final bool? readOnly;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final List<TextInputFormatter>? letSpace;
  final bool isColorBlue;
  final double? inputLabelSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          inputLabel,
          style:
              inputStyle ??
              context.appTypographie.small.copyWith(
                color: Colors.grey.shade700,
                fontSize: inputLabelSize ?? 14.sp,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(height: 3.h),
        TextFormField(
          readOnly: readOnly ?? false,
          controller: controller,
          minLines: minLines ?? 1,
          maxLines: maxLines ?? 1,
          inputFormatters:
              letSpace ?? [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
          keyboardType: textInputType,
          style: GoogleFonts.roboto(color: context.appColor.primaryGrayDark),
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: sufixIcon,
            hint: Text(
              textLabel,
              style:
                  hintStyle ??
                  GoogleFonts.roboto(
                    color: const Color(0xFF888888),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            isDense: true, // Added this
            contentPadding: EdgeInsets.all(14.sp),
            filled: true,
            //'hintText: textLabel,'
            errorText: errorText,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: isColorBlue
                    ? context.appColor.primaryLightBlue
                    : Colors.grey.withOpacity(.5),
              ),
              borderRadius: BorderRadius.circular(7.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: (isCancel != null)
                    ? context.appColor.primaryGray100
                    : Colors.red,
              ),
              borderRadius: BorderRadius.circular(7.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: isColorBlue
                    ? context.appColor.primaryLightBlue
                    : Colors.grey.withOpacity(.5),
              ),
              gapPadding: 2,
              borderRadius: BorderRadius.circular(7.r),
            ),
            border: OutlineInputBorder(
              gapPadding: 2,
              borderRadius: BorderRadius.circular(7.r),
            ),
            errorStyle: GoogleFonts.roboto(
              color: (isCancel != null)
                  ? context.appColor.primaryError
                  : Colors.red.withValues(alpha: 0.2),
              fontWeight: FontWeight.bold,
            ),
            hintStyle: GoogleFonts.roboto(
              color: const Color(0xFF888888),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            fillColor: Colors.grey.shade50,
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}




class CustomSelectableTile extends StatelessWidget {
  final String title;
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const CustomSelectableTile({
    super.key,
    required this.title,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final appColor = context.appColor;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: isChecked
              ? appColor.primaryBlue
              : appColor.primaryLightBlue,
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          children: [
            /// Texte
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: appColor.primaryGrayDark,
                ),
              ),
            ),

            SizedBox(width: 10.w),

            /// Checkbox custom
            GestureDetector(
              onTap: () => onChanged(!isChecked),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                height: 24.h,
                width: 24.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: isChecked
                      ? appColor.primaryBlue
                      : Colors.transparent,
                  border: Border.all(
                    color: appColor.primaryBlue,
                    width: 2,
                  ),
                  boxShadow: isChecked
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ]
                      : [],
                ),
                child: isChecked
                    ? const Icon(
                        Icons.check,
                        size: 18,
                        color: Colors.white,
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}