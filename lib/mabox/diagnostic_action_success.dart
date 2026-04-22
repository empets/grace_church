import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiagnosticActionSuccess extends StatelessWidget {
  const DiagnosticActionSuccess({super.key});

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
                      'Correction ',
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
                      assets.images.diagnosticSuccesser.path,
                    ),
                  ),
                  const SizedBox(height: 20),

                  SizedBox(height: 20.h),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 17.h),
                    child: Text(
                      'Tentative de correction terminée',
                      style: context.appTypographie.body.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 18.sp,
                        color: const Color(0xFF1C1B1F),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 17.h),
                    child: Text(
                      'Nous vous invitons à redémarrer votre box Internet. et patienter 5 minutes.\nSi le problème persiste, n’hésitez pas à revenir vers nous, nous restons à votre disposition.',
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
