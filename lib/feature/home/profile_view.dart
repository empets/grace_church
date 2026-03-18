import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/extension/custome_extension.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(backgroundColor: Colors.grey.shade50),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.appColor.primaryLightBlue,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.network(
                      loadingBuilder: (context, child, loadingProgress) {
                        return child;
                      },
                      errorBuilder: (_, __, ___) => ClipOval(
                        child: Image.network(
                          "yAssets.icons.profileAvatarPlaceholderLarge .path",
                          fit: BoxFit.contain,
                          height: 0.08.sh,
                          width: 0.08.sh,
                        ),
                      ),
                      "https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_640.png",

                      fit: BoxFit.cover,
                      height: 0.1.sh,
                      width: 0.1.sh,
                    ),
                  ),
                ),
                CustomeText(
                  text: "Jean Dupont",
                  style: context.appTypographie.button.copyWith(
                    color: context.appColor.primaryGrayDark,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                CustomeText(
                  text: "jean.dupont@gmail.com",
                  style: context.appTypographie.button.copyWith(
                    color: context.appColor.primaryGray700,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 50.w,
                    vertical: 18.h,
                  ),
                  child: PrimaryButton(
                    label: "Modifier",
                    colorText: context.appColor.primaryWhite,
                    leadingIcon: Icons.edit_note_sharp,
                    iconLeading: true,
                    iconColor: context.appColor.primaryWhite,
                    backgroundColor: context.appColor.primaryBlue,
                    fontSize: 12.sp,
                    onPressed: () {},
                  ),
                ),

                Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.phone, color: context.appColor.primaryBlue),
                        SizedBox(width: 8.w),
                        CustomeText(
                          text: "Informations Personnelles",
                          style: context.appTypographie.button.copyWith(
                            color: context.appColor.primaryGray700,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5.sp,
                          ),
                        ),
                      ],
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 9.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: context.appColor.primaryWhite,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        children: [
                          ...List.generate(3, (index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 9.h),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8.w),
                                    decoration: BoxDecoration(
                                      color: context.appColor.primaryBlue
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Icon(
                                      Icons.phone,
                                      color: context.appColor.primaryBlue,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomeText(
                                        text: "Email",
                                        style: context.appTypographie.button
                                            .copyWith(
                                              color: context
                                                  .appColor
                                                  .primaryGray500,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                      ),
                                      SizedBox(width: 8.w),
                                      CustomeText(
                                        text: "email@example.com",
                                        style: context.appTypographie.button
                                            .copyWith(
                                              color: context
                                                  .appColor
                                                  .primaryGray700,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w800,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.badge_rounded,
                          color: context.appColor.primaryBlue,
                        ),
                        SizedBox(width: 8.w),
                        CustomeText(
                          text: "Profil Social-Professionnel",
                          style: context.appTypographie.button.copyWith(
                            color: context.appColor.primaryGray700,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5.sp,
                          ),
                        ),
                      ],
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 9.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: context.appColor.primaryWhite,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        children: [
                          ...List.generate(2, (index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 9.h),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8.w),
                                    decoration: BoxDecoration(
                                      color: context.appColor.primaryBlue
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Icon(
                                      Icons.phone,
                                      color: context.appColor.primaryBlue,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomeText(
                                        text: "Email",
                                        style: context.appTypographie.button
                                            .copyWith(
                                              color: context
                                                  .appColor
                                                  .primaryGray500,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                      ),
                                      SizedBox(width: 8.w),
                                      CustomeText(
                                        text: "john.doe@example.com",
                                        style: context.appTypographie.button
                                            .copyWith(
                                              color: context
                                                  .appColor
                                                  .primaryGray700,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w800,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),

                //---------------------------------------
                // Spiritual Life
                //--------------------------------------
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.auto_awesome,
                          color: context.appColor.primaryBlue,
                        ),
                        SizedBox(width: 8.w),
                        CustomeText(
                          text: "Vie Spirituelle",
                          style: context.appTypographie.button.copyWith(
                            color: context.appColor.primaryGray700,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5.sp,
                          ),
                        ),
                      ],
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 9.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: context.appColor.primaryWhite,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        children: [
                          ...List.generate(2, (index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 9.h),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8.w),
                                    decoration: BoxDecoration(
                                      color: context.appColor.primaryBlue
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Icon(
                                      Icons.phone,
                                      color: context.appColor.primaryBlue,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomeText(
                                        text: "Email",
                                        style: context.appTypographie.button
                                            .copyWith(
                                              color: context
                                                  .appColor
                                                  .primaryGray500,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                      ),
                                      SizedBox(width: 8.w),
                                      CustomeText(
                                        text: "john.doe@example.com",
                                        style: context.appTypographie.button
                                            .copyWith(
                                              color: context
                                                  .appColor
                                                  .primaryGray700,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w800,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),

                //---------------------------------------
                //  Life Engagement
                //--------------------------------------
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.group, color: context.appColor.primaryBlue),
                        SizedBox(width: 8.w),
                        CustomeText(
                          text: "Engagement",
                          style: context.appTypographie.button.copyWith(
                            color: context.appColor.primaryGray700,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5.sp,
                          ),
                        ),
                      ],
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 9.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: context.appColor.primaryWhite,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        children: [
                          ...List.generate(1, (index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 9.h),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8.w),
                                    decoration: BoxDecoration(
                                      color: context.appColor.primaryBlue
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Icon(
                                      Icons.phone,
                                      color: context.appColor.primaryBlue,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomeText(
                                        text: "Email",
                                        style: context.appTypographie.button
                                            .copyWith(
                                              color: context
                                                  .appColor
                                                  .primaryGray500,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                      ),
                                      SizedBox(width: 8.w),
                                      CustomeText(
                                        text: "john.doe@example.com",
                                        style: context.appTypographie.button
                                            .copyWith(
                                              color: context
                                                  .appColor
                                                  .primaryGray700,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w800,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
