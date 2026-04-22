import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/custome_widget/navigate.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/gen/assets.gen.dart';
import 'package:grace_church/mabox/diagnostic_action_changbox.dart';

class DiagnosticRebootBox extends StatelessWidget {
   DiagnosticRebootBox({super.key});

  final List<Map<String, dynamic>> actions = [
    {
      "code": "",
      "libelle": "",
      "description": "",
      "response": [
        {"code": "", "libelle": ""},
        {"code": "", "libelle": ""},
      ],
    },
    {
      "code": "",
      "libelle": "",
      "description": "",
      "response": [
        {"code": "", "libelle": ""},
        {"code": "", "libelle": ""},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Diagnostic',
                  style: context.appTypographie.body.copyWith(
                    fontSize: 24.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 0.08.sh),

              Container(
                width: 0.4.sw,
                margin: EdgeInsets.only(left: 0.14.sw),
                child: Stack(
                  children: [
                    Container(
                      height: 0.19.sh,
                      child: SvgPicture.asset(
                        assets.images.iconBoxLoading.path,
                      ),
                    ),
                    Positioned(
                      top: 24.h,
                      right: 12.w,
                      child: Container(
                        margin: EdgeInsets.all(5.h),
                        padding: EdgeInsets.all(8.h),
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F1F1),
                          shape: BoxShape.circle,
                        ),
                        child: SizedBox(
                          height: 24.h,
                          width: 24.h,
                          child: CircularProgressIndicator.adaptive(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xFFF16E00),
                            ),
                            backgroundColor: Color(
                              0xFFF16E00,
                            ).withValues(alpha: 0.2),
                            strokeWidth: 2.w,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 16.h, bottom: 16.h),
                child: Text(
                  'Avez vous redémarrer votre box?',
                  style: context.appTypographie.body.copyWith(
                    fontSize: 15.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              PrimaryButton(
                label: "Oui, j’ai déjà redémarré ma box ",
                backgroundColor: Color(0xFFF9FAFB),
                borderSideColor: Colors.grey.shade300,
                borderRadius: 8.r,
                fontSize: 13.sp,
                onPressed: () {
                  Navigator.push(
                    context,
                    fadeRoute(DiagnosticActionChangeBox()),
                  );
                },
              ),

              SizedBox(height: 8.h),

              PrimaryButton(
                label: "Non, je n’ai pas redémarré ma box",
                backgroundColor: Color(0xFFF9FAFB),
                borderSideColor: Colors.grey.shade300,
                borderRadius: 8.r,
                fontSize: 13.sp,
                onPressed: () {
                    Navigator.push(
                    context,
                    fadeRoute(DiagnosticActionChangeBox()),
                  );
                },
              ),

              SizedBox(height: 20.h),

              Container(
                margin: EdgeInsets.symmetric(vertical: 25.h),
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: context.appColor.primaryLightBlue,
                  borderRadius: BorderRadius.circular(7.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Color(0xFF527EDB).withValues(alpha: 0.8),
                      size: 27.sp,
                    ),
                    SizedBox(width: 8.w),
                    Flexible(
                      child: Text(
                        "Si votre box n’a pas encore été redémarrée, elle sera brièvement éteinte puis rallumée automatiquement afin de finaliser le redémarrage.",
                        style: context.appTypographie.small.copyWith(
                          fontSize: 12.sp,
                          color: Color(0xFF527EDB).withValues(alpha: 0.8),
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
