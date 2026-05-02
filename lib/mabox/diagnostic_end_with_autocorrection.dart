import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/custome_widget/navigate.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/gen/assets.gen.dart';

class DiagnosticEndWithAutoCorrectionFail extends StatelessWidget {
  const DiagnosticEndWithAutoCorrectionFail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 9.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Diagnostic terminé',
                      style: context.appTypographie.body.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 24.sp,
                        color: const Color(0xFF1C1B1F),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      assets.images.waitReclamation.path,
                    ),
                  ),
                  const SizedBox(height: 20),

                  SizedBox(height: 20.h),
                  Text(
                      'Ticket crée',
                      style: context.appTypographie.body.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 18.sp,
                        color: const Color(0xFF527EDB),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  Container(
                    margin: EdgeInsets.only(top: 9.h),
                    child: Text(
                      'Problème non résolu',
                      style: context.appTypographie.body.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                        color: const Color(0xFF1C1B1F),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 6.h),
                    child: Text(
                      "La correction automatique n'a pas encore abouti, mais nous avons crée un ticket a partir de toute les informations fournir!",
                      style: context.appTypographie.body.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: const Color(0xFF1C1B1F),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),

                  SizedBox(height: 0.08.sh),
                     PrimaryButton(
                    label: "Voir la réclamation",
                    colorText: Colors.black,
                    backgroundColor: Color(0xFFF16E00),
                    borderRadius: 8.r,
                    onPressed: () async{
                    await  showBottomSheetNotation(
                        context: context,
                        media: MediaQuery.of(context),
                        content: DiagnosticEndWithAutomaticCorrectionFailSheetButtonContent(),
                      );
                    },
                  ),
                  SizedBox(height: 10.h),
                  PrimaryButton(
                    label: "Aller a l’accueil",
                    colorText: Colors.black,
                    backgroundColor: Colors.white,
                    borderSideColor: Colors.black,
                    borderRadius: 8.r,
                    onPressed: () {
                      // context.push(PageRoutes.reclamationList);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DiagnosticEndWithAutomaticCorrectionFailSheetButtonContent extends StatelessWidget {
  const DiagnosticEndWithAutomaticCorrectionFailSheetButtonContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 4.h,
              width: 40.w,
              margin: EdgeInsets.only(top: 8.h),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          SizedBox(height: 30.h),
          Text(
                  "Détails de l’intervention",
                  style: context.appTypographie.small.copyWith(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
        

          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 8.w),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                Icon(Icons.info, color: Colors.blue, size: 28.sp),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                   "ID 0123456789",
                  style: context.appTypographie.small.copyWith(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  "08/07/2025 14:30",
                  style: context.appTypographie.small.copyWith(
                    fontSize: 12.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.left,
                ),
                    
                  ],
                ),
              ],
            ),
          ),


          SizedBox(height: 16.h),
           PrimaryButton(
                  label: "Suivre la demande",
                  colorText: Colors.black,
                  backgroundColor: Color(0xFFF16E00),
                  borderSideColor: Colors.transparent,
                  borderRadius: 8.r,
                  fontSize: 13.sp,
                  onPressed: () async {
                    //  Navigator.push(context, fadeRoute(DiagnosticReclamation()));
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
