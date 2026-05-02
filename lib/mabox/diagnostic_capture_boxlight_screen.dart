import 'package:dotted_border/dotted_border.dart' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/custome_widget/navigate.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/gen/assets.gen.dart';
import 'package:grace_church/mabox/diagnostic_reclamation.dart';
import 'package:grace_church/mabox/diagnostic_scanne_box_flow_box.dart';

class DiagnosticCaptureBoxlightScreen extends StatelessWidget {
  DiagnosticCaptureBoxlightScreen({super.key, required this.isChangeBox});
  final bool isChangeBox;

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
                        'Diagnostic terminé',
                        style: context.appTypographie.body.copyWith(
                          fontSize: 24.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Photo des voyant de la box',
                      style: context.appTypographie.body.copyWith(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Vérifiez la qualité de la photo et assurez-vous que les '
                      'informations sont lisibles. Sinon, réessayez !',
                      style: context.appTypographie.body.copyWith(
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.04.sh),

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
                        'Prenez une photo des voyant de votre box',
                        style: context.appTypographie.body.copyWith(
                          fontSize: 13.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 0.15.sw),
                        child: PrimaryButton(
                          label: "Prendre une photo",
                          backgroundColor: Color(0xFFF9FAFB),
                          borderSideColor: Colors.black,
                          borderRadius: 8.r,
                          fontSize: 13.sp,
                          onPressed: () {
                            Navigator.push(
                              context,
                              fadeRoute(DiagnosticScanneBoxFlowChange()),
                            );
                          },
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
                              "Prenez la photo de l’avant votre box fibre pour récupérer les voyants lumineux.",
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
                      Image.asset(assets.images.boxUpImage.path),
                      SizedBox(height: 13.h),
                    ],
                  ),
                ),
                PrimaryButton(
                  label: "Valider",
                  colorText: Colors.black,
                  backgroundColor: Color(0xFFF16E00),
                  borderSideColor: Colors.transparent,
                  borderRadius: 8.r,
                  fontSize: 13.sp,
                  onPressed: () async {
                    //  Navigator.push(context, fadeRoute(DiagnosticCaptureBoxlightScreen(isChangeBox: false)));
                    
                    if(isChangeBox) {
                       Navigator.push(
                              context,
                              fadeRoute(DiagnosticScanneBoxFlowChange()),
                            );
                    }
                    if (!isChangeBox) {
                      await showBottomSheetNotation(
                        context: context,
                        media: MediaQuery.of(context),
                        content: DiagnosticReclamantionSheetButtonContent(),
                      );
                    } 
                  
                    
                  },
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DiagnosticReclamantionSheetButtonContent extends StatelessWidget {
  const DiagnosticReclamantionSheetButtonContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        children: [
          Container(
            height: 4.h,
            width: 40.w,
            margin: EdgeInsets.only(top: 8.h),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8.h),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300.withValues(alpha: 0.4),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2.w),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.close, color: Colors.black, size: 20.sp),
                ),
              ),
              SizedBox(width: 19.w),
              Flexible(
                child: Text(
                  "Après plusieurs diagnostics, un ticket a été créé pour faciliter votre prise en charge",
                  style: context.appTypographie.small.copyWith(
                    fontSize: 13.5.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),

          

          SizedBox(height: 16.h),
          Container(
            height: 0.14.sh,
            width: 1.sw,
            margin: EdgeInsets.only(top: 8.h),
            decoration: BoxDecoration(
              color: Colors.grey.shade300.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Center(
              child: SizedBox(
                height: 50.h,
                width: 50.h,
                child: CircularProgressIndicator.adaptive(
                  // strokeWidth: 3.w,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFF16E00)),
                ),
              ),
            ),
          ),

          SizedBox(height: 16.h),
           PrimaryButton(
                  label: "Aller à l'accueil",
                  colorText: Colors.black,
                  backgroundColor: Color(0xFFF16E00),
                  borderSideColor: Colors.transparent,
                  borderRadius: 8.r,
                  fontSize: 13.sp,
                  onPressed: () async {
                     Navigator.push(context, fadeRoute(DiagnosticReclamation()));
                    // await showBottomSheetNotation(
                    //   context: context,
                    //   media: MediaQuery.of(context),
                    //   content: DiagnosticReclamantionSheetButtonContent(),
                    // );
                  },
                ),
        ],
      ),
    );
  }
}
