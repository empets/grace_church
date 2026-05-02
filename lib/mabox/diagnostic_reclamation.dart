import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/core/navigator_widget/navigator_widget.dart';
import 'package:grace_church/gen/assets.gen.dart';
import 'package:grace_church/mabox/diagnostic_end_with_autocorrection.dart';

class DiagnosticReclamation extends StatelessWidget {
  const DiagnosticReclamation({super.key});

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
                      'Reclamation ',
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
                      assets.images.checkReclamation.path,
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
                      'Tentative de correction terminée',
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
                      "Un ticket a bien été créé pour traiter votre demande en priorité. Nos équipes sont mobilisées pour résoudre votre problème dans les plus brefs délais.\nVous serez automatiquement notifié(e) dès qu’une mise à jour ou une disponibilité sera enregistrée.",
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
                    onPressed: () {
                     Navigator.push(context, fadeRoute( DiagnosticEndWithAutoCorrectionFail()));
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
