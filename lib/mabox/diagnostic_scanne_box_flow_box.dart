import 'dart:ui';

import 'package:dotted_border/dotted_border.dart' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/custome_widget/form_filed.dart'
    show ProductionFormCustomer;
import 'package:grace_church/core/custome_widget/navigate.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/gen/assets.gen.dart';
import 'package:grace_church/mabox/diagnostic_auto_correction.dart';

class DiagnosticScanneBoxFlowChange extends StatelessWidget {
  DiagnosticScanneBoxFlowChange({super.key});

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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    SizedBox(height: 8.h),
                    Text(
                      'Photo SN de la box',
                      style: context.appTypographie.body.copyWith(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Vérifiez la qualité de la photo et assurez-vous que les informations sont lisibles. Sinon, réessayez !",
                      style: context.appTypographie.body.copyWith(
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.04.sh),

                ProductionFormCustomer(
                  readOnly: false,
                  inputLabelSize: 0.sp,
                  isColorBlue: false,
                  lable: 'SN',
                  inputLabel: '',
                  textLabel: "",
                  errorText: null,
                  msgError: 'Veuillez renseigner ce champ',
                ),

                SizedBox(height: 7.h),

                ProductionFormCustomer(
                  readOnly: false,
                  inputLabelSize: 0.sp,
                  isColorBlue: false,
                  lable: 'Mac',
                  inputLabel: '',
                  textLabel: "",
                  errorText: null,
                  msgError: 'Veuillez renseigner ce champ',
                ),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(
                    "Ou",
                    style: context.appTypographie.body.copyWith(
                      fontSize: 13.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),

                ui.DottedBorder(
                  color: Colors.grey.shade300,
                  padding: EdgeInsets.all(18.h),
                  strokeWidth: 2,
                  dashPattern: [6, 3],
                  strokeCap: StrokeCap.round, // 👈 rend les coins plus propres
                  borderType: ui.BorderType.RRect,
                  radius: Radius.circular(12),
                  child: Column(
                    children: [
                      Text(
                        'Scanner le SN de la box',
                        style: context.appTypographie.body.copyWith(
                          fontSize: 13.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 0.08.sw),
                        child: PrimaryButton(
                          label: "Cliquer ici pour scanner",
                          backgroundColor: Color(0xFFF9FAFB),
                          borderSideColor: Colors.black,
                          borderRadius: 8.r,
                          fontSize: 13.sp,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6.h),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 25.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: context.appColor.primaryLightBlue,
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                  child: Column(
                    children: [
                      Row(
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
                              "Scannez le 3e code barre en dessous de votre box fibre pour récupérer votre SN.",
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
                      SizedBox(height: 13.h),
                      Image.asset(assets.images.scanBox.path),
                      SizedBox(height: 13.h),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 2.h, bottom: 12.h),
                  child: PrimaryButton(
                    label: "Valider",
                    colorText: Colors.black,
                    backgroundColor: Color(0xFFF16E00),
                    borderSideColor: Colors.transparent,
                    borderRadius: 8.r,
                    fontSize: 13.sp,
                    onPressed: () {
                      Navigator.push(
                        context,
                        fadeRoute(
                          DiagnosticAutoCorrection(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
