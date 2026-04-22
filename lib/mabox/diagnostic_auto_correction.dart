import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/core/navigator_widget/navigator_widget.dart';
import 'package:grace_church/mabox/diagnostic_action_success.dart';

class DiagnosticAutoCorrection extends StatelessWidget {
  const DiagnosticAutoCorrection({super.key});

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
          child: Column(
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
              SizedBox(height: 40.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: Colors.grey[100]!.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40.h,
                          height: 40.h,
                          padding: EdgeInsets.all(9.h),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade50,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: SizedBox(
                            height: 10.h,
                            width: 10.h,
                            child: CircularProgressIndicator.adaptive(
                              strokeWidth: 3.w,
                              backgroundColor: Colors.orange.shade100,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFFFF7900),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Correction en cours...',
                              style: context.appTypographie.body.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                                height: 2.sp,
                                color: const Color(0xFF101828),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Nous tentons de résoudre le problème \nautomatiquement",
                                  style: context.appTypographie.body.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: const Color(0xFF4A5565),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),

                    // BlocBuilder<TimerCounterBloc, int>(
                    //   builder: (context, state) {
                    //     return Column(
                    //       children: [
                    //         ...List.generate(stepsAfterProblem.length, (index) {
                    //           return _buildStepIndicator(
                    //             step: stepsAfterProblem[index],
                    //             context: context,
                    //           );
                    //         }),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          fadeRoute(DiagnosticActionSuccess()),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 19.h),
                        child: Row(
                          children: [
                            // isCorrectionInProgress
                            // ?
                            Container(
                              padding: EdgeInsets.all(3.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0xFFFF7900),
                                  width: 2.w,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.circle,
                                color: Color(0xFFFF7900),
                                size: 13.sp,
                              ),
                            ),
                            // :
                            // SvgPicture.asset(MyAssets
                            //     .images.iconDianosticSuccessCheck.path),
                            SizedBox(width: 10.w),
                            Text(
                              // correctionSetMessage ??
                              'Mise à jour des informations de la box',
                              style: context.appTypographie.body.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                                color: const Color(0xFF454447),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //       ],
                    //     );
                    //   },
                    // ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 25.h),
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: context.appColor.primaryLightBlue.withValues(
                    alpha: 0.2,
                  ),
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
                        "La correction automatique n’a pas encore abouti, mais nous allons crée un ticket a partir de toute les informations fournir !",
                        style: context.appTypographie.small.copyWith(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
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
