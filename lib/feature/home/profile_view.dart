import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.profile});
  final ProfileResponse profile;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String extractTwoElements(String input) {
    final parts = input.split(',').map((e) => e.trim()).toList();
    if (parts.length >= 3) {
      // On récupère les deux éléments après la première virgule
      return '${parts[1]}, ${parts[2]}';
    } else if (parts.length >= 2) {
      // S'il y a au moins deux éléments, on prend le deuxième
      return parts[1];
    } else {
      // S'il n'y a qu'un élément, on le prend
      return parts[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> getPersonalInformation({
      required ProfileResponse profile,
    }) {
      final deviceInfos = <Map<String, dynamic>>[
        {
          'icon': Icons.email_outlined,
          'title': 'Email',
          'value': profile.email,
        },
        {
          'title': 'Téléphone',
          'icon': Icons.phone_outlined,
          'value': profile.contact,
        },
        {
          'title': 'Adresse & Quartier',
          'icon': Icons.location_on_outlined,
          'value': profile.zoneResidence,
        },
      ];
      return deviceInfos;
    }

    List<Map<String, dynamic>> getProfessionalInformation({
      required ProfileResponse profile,
    }) {
      final deviceInfos = <Map<String, dynamic>>[
        {
          'icon': Icons.school_outlined,
          'title': 'Métier / Études',
          'value': profile.nivauEtude,
        },
        {
          'title': 'Organisation',
          'icon': Icons.business_outlined,
          'value': profile.activity,
        },
      ];
      return deviceInfos;
    }

    List<Map<String, dynamic>> getSpiritualInformation({
      required ProfileResponse profile,
    }) {
      final deviceInfos = <Map<String, dynamic>>[
        {
          'icon': Icons.format_color_fill_sharp,
          'title': 'Date de baptême',
          'value': profile.dateBaptme,
        },
        {
          'title': 'Cellule de maison',
          'icon': Icons.home_work,
          'value': profile.cellulePriere,
        },
      ];
      return deviceInfos;
    }

    List<Map<String, dynamic>> getEngagement({
      required ProfileResponse profile,
    }) {
      final deviceInfos = <Map<String, dynamic>>[
        {
          'icon': Icons.volunteer_activism_outlined,
          'title': 'Département',
          'value': profile.departement,
        },
      ];
      return deviceInfos;
    }

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
                      widget.profile.profileImage,

                      fit: BoxFit.cover,
                      height: 0.1.sh,
                      width: 0.1.sh,
                    ),
                  ),
                ),
                CustomeText(
                  text: widget.profile.name,
                  style: context.appTypographie.button.copyWith(
                    color: context.appColor.primaryGrayDark,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                CustomeText(
                  text: widget.profile.email,
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
                        Icon(Icons.person, color: context.appColor.primaryBlue),
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
                    SizedBox(height: 7.h),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5.h),
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
                          Column(
                            children: [
                              ...getPersonalInformation(
                                profile: widget.profile,
                              ).map(
                                (items) => Container(
                                  // margin: EdgeInsets.symmetric(vertical: 1.h),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 8.h,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: items['title'] != 'Téléphone'
                                          ? BorderSide.none
                                          : BorderSide(
                                              color: context
                                                  .appColor
                                                  .primaryGray100,
                                              width: 1.w,
                                            ),
                                      top: items['title'] != 'Téléphone'
                                          ? BorderSide.none
                                          : BorderSide(
                                              color: context
                                                  .appColor
                                                  .primaryGray100,
                                              width: 1.w,
                                            ),
                                    ),
                                    color: context.appColor.primaryWhite,
                                    borderRadius: items['title'] == 'Email'
                                        ? BorderRadius.only(
                                            topLeft: Radius.circular(12.r),
                                            topRight: Radius.circular(12.r),
                                          )
                                        : items['title'] == 'Adresse & Quartier'
                                        ? BorderRadius.only(
                                            bottomLeft: Radius.circular(12.r),
                                            bottomRight: Radius.circular(12.r),
                                          )
                                        : null,
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 4.h),
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(8.w),
                                              decoration: BoxDecoration(
                                                color: context
                                                    .appColor
                                                    .primaryBlue
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                              ),
                                              child: Icon(
                                                items['icon'],
                                                color: context
                                                    .appColor
                                                    .primaryBlue,
                                              ),
                                            ),
                                            SizedBox(width: 8.w),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomeText(
                                                  text: items['title'],
                                                  style: context
                                                      .appTypographie
                                                      .button
                                                      .copyWith(
                                                        color: context
                                                            .appColor
                                                            .primaryGray500,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                ),
                                                SizedBox(width: 8.w),
                                                CustomeText(
                                                  text: extractTwoElements(
                                                    items['value'],
                                                  ),
                                                  style: context
                                                      .appTypographie
                                                      .button
                                                      .copyWith(
                                                        color: context
                                                            .appColor
                                                            .primaryGray700,
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w800,
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
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.work_outline,
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
                      margin: EdgeInsets.symmetric(vertical: 5.h),
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
                          SizedBox(height: 7.h),
                          Column(
                            children: [
                              ...getProfessionalInformation(
                                profile: widget.profile,
                              ).map(
                                (items) => Container(
                                  // margin: EdgeInsets.symmetric(vertical: 1.h),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                    vertical: 8.h,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom:
                                          items['title'] != 'Métier / Études'
                                          ? BorderSide.none
                                          : BorderSide(
                                              color: context
                                                  .appColor
                                                  .primaryGray100,
                                              width: 1.w,
                                            ),
                                      top: items['title'] != 'Téléphone'
                                          ? BorderSide.none
                                          : BorderSide(
                                              color: context
                                                  .appColor
                                                  .primaryGray100,
                                              width: 1.w,
                                            ),
                                    ),
                                    color: context.appColor.primaryWhite,
                                    borderRadius: items['title'] == 'Email'
                                        ? BorderRadius.only(
                                            topLeft: Radius.circular(12.r),
                                            topRight: Radius.circular(12.r),
                                          )
                                        : items['title'] == 'Adresse & Quartier'
                                        ? BorderRadius.only(
                                            bottomLeft: Radius.circular(12.r),
                                            bottomRight: Radius.circular(12.r),
                                          )
                                        : null,
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 4.h),
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(8.w),
                                              decoration: BoxDecoration(
                                                color: context
                                                    .appColor
                                                    .primaryBlue
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                              ),
                                              child: Icon(
                                                items['icon'],
                                                color: context
                                                    .appColor
                                                    .primaryBlue,
                                              ),
                                            ),
                                            SizedBox(width: 8.w),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomeText(
                                                  text: items['title'],
                                                  style: context
                                                      .appTypographie
                                                      .button
                                                      .copyWith(
                                                        color: context
                                                            .appColor
                                                            .primaryGray500,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                ),
                                                SizedBox(width: 8.w),
                                                CustomeText(
                                                  text: items['value'],

                                                  style: context
                                                      .appTypographie
                                                      .button
                                                      .copyWith(
                                                        color: context
                                                            .appColor
                                                            .primaryGray700,
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w800,
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
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
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
                          SizedBox(height: 7.h),
                          Column(
                            children: [
                              ...getSpiritualInformation(
                                profile: widget.profile,
                              ).map(
                                (items) => Container(
                                  // margin: EdgeInsets.symmetric(vertical: 1.h),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                    vertical: 8.h,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom:
                                          items['title'] != 'Date de baptême'
                                          ? BorderSide.none
                                          : BorderSide(
                                              color: context
                                                  .appColor
                                                  .primaryGray100,
                                              width: 1.w,
                                            ),
                                      top: items['title'] != 'Téléphone'
                                          ? BorderSide.none
                                          : BorderSide(
                                              color: context
                                                  .appColor
                                                  .primaryGray100,
                                              width: 1.w,
                                            ),
                                    ),
                                    color: context.appColor.primaryWhite,
                                    borderRadius: items['title'] == 'Email'
                                        ? BorderRadius.only(
                                            topLeft: Radius.circular(12.r),
                                            topRight: Radius.circular(12.r),
                                          )
                                        : items['title'] == 'Adresse & Quartier'
                                        ? BorderRadius.only(
                                            bottomLeft: Radius.circular(12.r),
                                            bottomRight: Radius.circular(12.r),
                                          )
                                        : null,
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 4.h),
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(8.w),
                                              decoration: BoxDecoration(
                                                color: context
                                                    .appColor
                                                    .primaryBlue
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                              ),
                                              child: Icon(
                                                items['icon'],
                                                color: context
                                                    .appColor
                                                    .primaryBlue,
                                              ),
                                            ),
                                            SizedBox(width: 8.w),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomeText(
                                                  text: items['title'],
                                                  style: context
                                                      .appTypographie
                                                      .button
                                                      .copyWith(
                                                        color: context
                                                            .appColor
                                                            .primaryGray500,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                ),
                                                SizedBox(width: 8.w),
                                                CustomeText(
                                                  text: items['value'],

                                                  style: context
                                                      .appTypographie
                                                      .button
                                                      .copyWith(
                                                        color: context
                                                            .appColor
                                                            .primaryGray700,
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w800,
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
                              ),
                            ],
                          ),
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
                          Column(
                            children: [
                              ...getEngagement(profile: widget.profile).map(
                                (items) => Container(
                                  // margin: EdgeInsets.symmetric(vertical: 1.h),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                    vertical: 8.h,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom:
                                          items['title'] != 'Métier / Études'
                                          ? BorderSide.none
                                          : BorderSide(
                                              color: context
                                                  .appColor
                                                  .primaryGray100,
                                              width: 1.w,
                                            ),
                                      top: items['title'] != 'Téléphone'
                                          ? BorderSide.none
                                          : BorderSide(
                                              color: context
                                                  .appColor
                                                  .primaryGray100,
                                              width: 1.w,
                                            ),
                                    ),
                                    color: context.appColor.primaryWhite,
                                    borderRadius: items['title'] == 'Email'
                                        ? BorderRadius.only(
                                            topLeft: Radius.circular(12.r),
                                            topRight: Radius.circular(12.r),
                                          )
                                        : items['title'] == 'Adresse & Quartier'
                                        ? BorderRadius.only(
                                            bottomLeft: Radius.circular(12.r),
                                            bottomRight: Radius.circular(12.r),
                                          )
                                        : null,
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 4.h),
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(8.w),
                                              decoration: BoxDecoration(
                                                color: context
                                                    .appColor
                                                    .primaryBlue
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                              ),
                                              child: Icon(
                                                items['icon'],
                                                color: context
                                                    .appColor
                                                    .primaryBlue,
                                              ),
                                            ),
                                            SizedBox(width: 8.w),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomeText(
                                                  text: items['title'],
                                                  style: context
                                                      .appTypographie
                                                      .button
                                                      .copyWith(
                                                        color: context
                                                            .appColor
                                                            .primaryGray500,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                ),
                                                SizedBox(width: 8.w),
                                                CustomeText(
                                                  text: items['value'],

                                                  style: context
                                                      .appTypographie
                                                      .button
                                                      .copyWith(
                                                        color: context
                                                            .appColor
                                                            .primaryGray700,
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w800,
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
                              ),
                            ],
                          ),
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
