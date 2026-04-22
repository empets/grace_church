import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/custome_widget/navigate.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/gen/assets.gen.dart';
import 'package:grace_church/mabox/diagnostic_capture_boxlight_screen.dart';

class DiagnosticActionChangeBox extends StatelessWidget {
  DiagnosticActionChangeBox({super.key});

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10.h),
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
              Container(
                width: 0.4.sw,
                margin: EdgeInsets.only(left: 0.08.sw, top: 0.03.sh, bottom:  0.03.sh),
                child:  Container(
                      height: 0.19.sh,
                      child: SvgPicture.asset(
                        assets.images.iconChangeBox.path,
                      ),
                    ),
              ),

              Container(
                margin: EdgeInsets.only(top: 16.h, bottom: 16.h),
                child: Text(
                  'Avez vous déjà effectuer un changement de box?',
                  style: context.appTypographie.body.copyWith(
                    fontSize: 15.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              PrimaryButton(
                label: "Oui, j’ai déjà changé de box ",
                backgroundColor: Color(0xFFF9FAFB),
                borderSideColor: Colors.grey.shade300,
                borderRadius: 8.r,
                fontSize: 13.sp,
                onPressed: () {
                      Navigator.push(context, fadeRoute(DiagnosticCaptureBoxlightScreen(isChangeBox: true)));
                },
              ),

              SizedBox(height: 16.h),

              PrimaryButton(
                label: "Non, je n’ai jamais changé de box",
                backgroundColor: Color(0xFFF9FAFB),
                borderSideColor: Colors.grey.shade300,
                borderRadius: 8.r,
                fontSize: 13.sp,
                onPressed: () {
                     Navigator.push(context, fadeRoute(DiagnosticCaptureBoxlightScreen(isChangeBox: false)));
                },
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
