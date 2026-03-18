import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/custome_widget/form_filed.dart';
import 'package:grace_church/core/extension/custome_extension.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(backgroundColor: Colors.grey.shade50),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductionFormCustomer(
                textLabel: "Rechercher une annonce",
                errorText: null,
                prefixIcon: Icon(
                  Icons.search,
                  color: context.appColor.primaryGray700,
                ),
                msgError: "",
                inputLabel: "",
                onChanged: (value) {},
                
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      label: "Urgent",
                      colorText: Colors.red,
                      leadingIcon: Icons.warning,
                      iconLeading: true,
                      iconColor: Colors.red,
                      borderSideColor: Colors.red,
                      backgroundColor: Colors.red.shade50,
                      borderRadius: 20,
                      fontSize: 12.sp,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: PrimaryButton(
                      label: "Info",
                      colorText: context.appColor.primaryBlue,
                      leadingIcon: Icons.info,
                      iconLeading: true,
                      iconColor: context.appColor.primaryBlue,
                      borderSideColor: context.appColor.primaryBlue,
                      backgroundColor: context.appColor.primaryBlue.withValues(
                        alpha: 0.1,
                      ),
                      borderRadius: 20,
                      fontSize: 12.sp,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: PrimaryButton(
                      label: "Rappel",
                      colorText: context.appColor.primaryWarning,
                      leadingIcon: Icons.access_time_filled_outlined,
                      iconLeading: true,
                      iconColor: context.appColor.primaryWarning,
                      borderSideColor: context.appColor.primaryWarning,
                      backgroundColor: context.appColor.primaryWarning
                          .withValues(alpha: 0.1),
                      borderRadius: 20,
                      fontSize: 12.sp,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              CustomeText(
                text: "ANNONCE RECENTES",
                style: context.appTypographie.button.copyWith(
                  color: context.appColor.primaryGray700,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16.h),

              Container(
                height: 0.79.sh,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 8.h),
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 8.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 4.r,
                            offset: Offset(0, 2.h),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 3.h,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.red.shade100.withValues(
                                    alpha: 0.3,
                                  ),
                                  borderRadius: BorderRadius.circular(17.r),
                                ),
                                child: CustomeText(
                                  text: "Important",
                                  style: context.appTypographie.button.copyWith(
                                    color: Colors.red.shade900,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              CustomeText(
                                text: "Il y a 2 heures",
                                style: context.appTypographie.button.copyWith(
                                  color: context.appColor.primaryGray500,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          CustomeText(
                            text: "Réunion de prière",
                            style: context.appTypographie.button.copyWith(
                              color: context.appColor.primaryGrayDark,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          CustomeText(
                            text:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            style: context.appTypographie.body.copyWith(
                              color: context.appColor.primaryGrayDark,
                              fontSize: 14.sp,
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.symmetric(vertical: 8.h),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 16.sp,
                                  color: context.appColor.primaryBlue,
                                ),
                                SizedBox(width: 8.w),
                                CustomeText(
                                  text: "25 Octobre 2025 à 14h00",
                                  style: context.appTypographie.button.copyWith(
                                    color: context.appColor.primaryGray500,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
