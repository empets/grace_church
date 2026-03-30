import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/extension/custome_extension.dart';

class EditingCelluleRaport extends StatefulWidget {
  const EditingCelluleRaport({super.key});

  @override
  State<EditingCelluleRaport> createState() => _EditingCelluleRaportState();
}

class _EditingCelluleRaportState extends State<EditingCelluleRaport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Container(
        margin: EdgeInsets.only(top: 28.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.h),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 9.h,
                          horizontal: 16.w,
                        ),
                        decoration: BoxDecoration(
                          color: context.appColor.primaryBlue,
                          borderRadius: BorderRadius.circular(7.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomeText(
                              text: "SESSION EN COURS",
                              style: context.appTypographie.h2.copyWith(
                                fontSize: 15.sp,
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w300,
                                height: 1.6.h,
                              ),
                            ),
                            CustomeText(
                              text: "Rapport Hebdomadaire Ouvrier",
                              style: context.appTypographie.h2.copyWith(
                                fontSize: 16.sp,
                                color: context.appColor.primaryWhite,
                                height: 1.2.h,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Container(
                              width: 0.6.sw,
                              margin: EdgeInsets.symmetric(vertical: 5.h),
                              padding: EdgeInsets.symmetric(
                                horizontal: 4.w,
                                vertical: 2.h,
                              ),
                              decoration: BoxDecoration(
                                color: context.appColor.primaryWhite.withValues(
                                  alpha: 0.2,
                                ),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    color: context.appColor.primaryWhite,
                                  ),
                                  SizedBox(width: 8.w),
                                  CustomeText(
                                    text: "Semaine du: 12 - 18 Mai 2024",
                                    style: context.appTypographie.h2.copyWith(
                                      fontSize: 12.sp,
                                      color: context.appColor.primaryWhite
                                          .withValues(alpha: 0.9),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: -19.h,
                        right: -26.w,
                        child: Transform.rotate(
                          angle: 0.3,
                          child: Icon(
                            Icons.assignment,
                            color: context.appColor.primaryWhite.withValues(
                              alpha: 0.2,
                            ),
                            size: 100.h,
                          ),
                        ),
                      ),
                    ],
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
