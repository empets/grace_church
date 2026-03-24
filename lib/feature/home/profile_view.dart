import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grace_church/core/alert/app_alerte.dart';
import 'package:grace_church/core/bloc_state/bloc_state.dart';
import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/custome_widget/navigate.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/core/injection/injection_container.dart';
import 'package:grace_church/feature/authen/domaine/usercase/create_profile_usercase.dart';
import 'package:grace_church/feature/authen/domaine/usercase/create_social_profile_usercase.dart';
import 'package:grace_church/feature/authen/domaine/usercase/create_spiritual_profile.dart';
import 'package:grace_church/feature/authen/page/bloc/create_compte/form_profile_bloc.dart';
import 'package:grace_church/feature/authen/page/bloc/create_compte/form_profile_social_bloc.dart';
import 'package:grace_church/feature/authen/page/bloc/create_compte/form_profile_spirituallife_bloc.dart';
import 'package:grace_church/feature/authen/page/form_engagement.dart';
import 'package:grace_church/feature/authen/page/form_holly_living.dart';
import 'package:grace_church/feature/authen/page/form_profile.dart';
import 'package:grace_church/feature/authen/page/form_social_professionnal.dart';
import 'package:grace_church/feature/home/data/model/home_model.dart';
import 'package:grace_church/feature/home/data/service/steam_remote_service.dart';
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/feature/home/page/bloc/get_profile/event/profile_event.dart';
import 'package:grace_church/feature/home/page/bloc/get_profile/get_profile_bloc.dart';
import 'package:grace_church/gen/assets.gen.dart';
import 'package:intl/intl.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.profile});
  final ProfileResponseModel? profile;

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

  String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    // String formattedDate = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    String formatted = DateFormat(
      "d MMMM y"
          'H:mm',
      'fr',
    ).format(dateTime);
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> getPersonalInformation({
      required ProfileResponseModel? profile,
    }) {
      final deviceInfos = <Map<String, dynamic>>[
        {
          'icon': Icons.email_outlined,
          'title': 'Email',
          'value': profile?.email ?? "",
        },
        {
          'title': 'Téléphone',
          'icon': Icons.phone_outlined,
          'value': profile?.contact ?? "",
        },
        {
          'title': 'Adresse & Quartier',
          'icon': Icons.location_on_outlined,
          'value': profile?.zoneResidence ?? "",
        },
      ];
      return deviceInfos;
    }

    List<Map<String, dynamic>> getProfessionalInformation({
      required ProfileResponseModel? profile,
    }) {
      final deviceInfos = <Map<String, dynamic>>[
        {
          'icon': Icons.school_outlined,
          'title': 'Métier / Études',
          'value': profile?.nivauEtude ?? "",
        },
        {
          'title': 'Organisation',
          'icon': Icons.business_outlined,
          'value': profile?.activity ?? "",
        },
      ];
      return deviceInfos;
    }

    List<Map<String, dynamic>> getSpiritualInformation({
      required ProfileResponseModel? profile,
    }) {
      final deviceInfos = <Map<String, dynamic>>[
        {
          'icon': Icons.format_color_fill_sharp,
          'title': 'Date de baptême',
          'value': profile?.dateBaptme?.contains('NA') == true
              ? ""
              : profile?.dateBaptme,
        },
        {
          'title': 'Cellule de maison',
          'icon': Icons.home_work,
          'value': profile?.cellulePriere ?? "",
        },
      ];
      return deviceInfos;
    }

    List<Map<String, dynamic>> getEngagement({
      required ProfileResponseModel? profile,
    }) {
      final deviceInfos = <Map<String, dynamic>>[
        {
          'icon': Icons.volunteer_activism_outlined,
          'title': 'Département',
          'value': profile?.departement ?? "",
        },
      ];
      return deviceInfos;
    }

    return BlocProvider.value(
      value: context.read<GetProfileBloc>(),
      child: BlocListener<GetProfileBloc, ApiState<ProfileResponse>>(
        listener: (context, profileListenerState) {
          if (profileListenerState is SuccessState<ProfileResponse>) {
            AppAlert.showSuccess(context, "Profil mis à jour avec succès");
          }
        },
        child: Scaffold(
          backgroundColor: Colors.grey.shade50,
          appBar: AppBar(backgroundColor: Colors.grey.shade50),
          body: StreamBuilder(
            stream: getIt<ImpleSteamRemoteService>().getProfileStream(),
            builder: (context, profileStream) {
              if (profileStream.hasData && profileStream.data != null) {
                return SafeArea(
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 1.5.sh,
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5.r),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: context
                                                .appColor
                                                .primaryLightBlue,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: ClipOval(
                                          child: Image.network(
                                            loadingBuilder:
                                                (
                                                  context,
                                                  child,
                                                  loadingProgress,
                                                ) {
                                                  return child;
                                                },
                                            errorBuilder: (_, __, ___) => ClipOval(
                                              child: Image.network(
                                                "https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_640.png",
                                                fit: BoxFit.contain,
                                                height: 0.08.sh,
                                                width: 0.08.sh,
                                              ),
                                            ),
                                            profileStream.data?.profileImage ??
                                                "",

                                            fit: BoxFit.cover,
                                            height: 0.1.sh,
                                            width: 0.1.sh,
                                          ),
                                        ),
                                      ),
                                      CustomeText(
                                        text: profileStream.data?.name ?? "",
                                        style: context.appTypographie.button
                                            .copyWith(
                                              color: context
                                                  .appColor
                                                  .primaryGrayDark,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w800,
                                            ),
                                      ),
                                      CustomeText(
                                        text: profileStream.data?.email ?? "",
                                        style: context.appTypographie.button
                                            .copyWith(
                                              color: context
                                                  .appColor
                                                  .primaryGray700,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                      ),

                                      SizedBox(height: 29.h),

                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 50.w,
                                          vertical: 18.h,
                                        ),
                                        child: PrimaryButton(
                                          label: "Modifier",
                                          colorText:
                                              context.appColor.primaryWhite,
                                          leadingIcon: Icons.edit_note_sharp,
                                          iconLeading: true,
                                          iconColor:
                                              context.appColor.primaryWhite,
                                          backgroundColor:
                                              context.appColor.primaryBlue,
                                          fontSize: 12.sp,
                                          onPressed: () {},
                                        ),
                                      ),
                                      //---------------------------------------
                                      //  Profile
                                      //--------------------------------------
                                      Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.person,
                                                      color: context
                                                          .appColor
                                                          .primaryBlue,
                                                    ),
                                                    SizedBox(width: 8.w),
                                                    CustomeText(
                                                      text:
                                                          "Informations Personnelles",
                                                      style: context
                                                          .appTypographie
                                                          .button
                                                          .copyWith(
                                                            color: context
                                                                .appColor
                                                                .primaryGray700,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            letterSpacing:
                                                                0.5.sp,
                                                          ),
                                                    ),
                                                  ],
                                                ),

                                                SizedBox(width: 8.w),
                                                BlocBuilder<
                                                  GetProfileBloc,
                                                  ApiState<ProfileResponse>
                                                >(
                                                  builder: (context, state) {
                                                    return GestureDetector(
                                                      onTap: () async {
                                                        final profile =
                                                            await Navigator.of(
                                                              context,
                                                            ).push(
                                                              fadeRoute(
                                                                BlocProvider(
                                                                  create:
                                                                      (
                                                                        context,
                                                                      ) => FormProfileBloc(
                                                                        createProfileUsercase:
                                                                            getIt<
                                                                              CreateProfileUsercase
                                                                            >(),
                                                                      ),
                                                                  child:
                                                                      FormProfile(
                                                                        profile:
                                                                            true,
                                                                      ),
                                                                ),
                                                              ),
                                                            );
                                                        if (profile as bool) {
                                                          log(
                                                            'Profile updated $profile',
                                                          );
                                                          context
                                                              .read<
                                                                GetProfileBloc
                                                              >()
                                                              .add(
                                                                const ProfileEvent.fetch(),
                                                              );
                                                        }
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.all(
                                                          8.r,
                                                        ),
                                                        decoration: BoxDecoration(
                                                          color: context
                                                              .appColor
                                                              .primaryBlue,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                8.r,
                                                              ),
                                                        ),
                                                        child: Icon(
                                                          Icons.edit_note_sharp,
                                                          color: context
                                                              .appColor
                                                              .primaryWhite,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),

                                          SizedBox(height: 7.h),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                              vertical: 5.h,
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 8.w,
                                              vertical: 8.h,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  context.appColor.primaryWhite,
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                            child: Column(
                                              children: [
                                                Column(
                                                  children: [
                                                    ...getPersonalInformation(
                                                      profile:
                                                          profileStream.data,
                                                    ).map(
                                                      (items) => Container(
                                                        // margin: EdgeInsets.symmetric(vertical: 1.h),
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              horizontal: 10.w,
                                                              vertical: 8.h,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          border: Border(
                                                            bottom:
                                                                items['title'] !=
                                                                    'Téléphone'
                                                                ? BorderSide
                                                                      .none
                                                                : BorderSide(
                                                                    color: context
                                                                        .appColor
                                                                        .primaryGray100,
                                                                    width: 1.w,
                                                                  ),
                                                            top:
                                                                items['title'] !=
                                                                    'Téléphone'
                                                                ? BorderSide
                                                                      .none
                                                                : BorderSide(
                                                                    color: context
                                                                        .appColor
                                                                        .primaryGray100,
                                                                    width: 1.w,
                                                                  ),
                                                          ),
                                                          color: context
                                                              .appColor
                                                              .primaryWhite,
                                                          borderRadius:
                                                              items['title'] ==
                                                                  'Email'
                                                              ? BorderRadius.only(
                                                                  topLeft:
                                                                      Radius.circular(
                                                                        12.r,
                                                                      ),
                                                                  topRight:
                                                                      Radius.circular(
                                                                        12.r,
                                                                      ),
                                                                )
                                                              : items['title'] ==
                                                                    'Adresse & Quartier'
                                                              ? BorderRadius.only(
                                                                  bottomLeft:
                                                                      Radius.circular(
                                                                        12.r,
                                                                      ),
                                                                  bottomRight:
                                                                      Radius.circular(
                                                                        12.r,
                                                                      ),
                                                                )
                                                              : null,
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  EdgeInsets.only(
                                                                    bottom: 4.h,
                                                                  ),
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                          8.w,
                                                                        ),
                                                                    decoration: BoxDecoration(
                                                                      color: context
                                                                          .appColor
                                                                          .primaryBlue
                                                                          .withOpacity(
                                                                            0.1,
                                                                          ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            8.r,
                                                                          ),
                                                                    ),
                                                                    child: Icon(
                                                                      items['icon'],
                                                                      color: context
                                                                          .appColor
                                                                          .primaryBlue,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 8.w,
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      CustomeText(
                                                                        text:
                                                                            items['title'],
                                                                        style: context.appTypographie.button.copyWith(
                                                                          color: context
                                                                              .appColor
                                                                              .primaryGray500,
                                                                          fontSize:
                                                                              14.sp,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            8.w,
                                                                      ),
                                                                      CustomeText(
                                                                        text: extractTwoElements(
                                                                          items['value'],
                                                                        ),
                                                                        style: context.appTypographie.button.copyWith(
                                                                          color: context
                                                                              .appColor
                                                                              .primaryGray700,
                                                                          fontSize:
                                                                              11.sp,
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
                                      //---------------------------------------
                                      //  Profile Social-Professionnel
                                      //--------------------------------------
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.work_outline,
                                                    color: context
                                                        .appColor
                                                        .primaryBlue,
                                                  ),
                                                  SizedBox(width: 8.w),
                                                  CustomeText(
                                                    text:
                                                        "Profil Social-Professionnel",
                                                    style: context
                                                        .appTypographie
                                                        .button
                                                        .copyWith(
                                                          color: context
                                                              .appColor
                                                              .primaryGray700,
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          letterSpacing: 0.5.sp,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 8.w),
                                              GestureDetector(
                                                onTap: () async {
                                                  final result =
                                                      await Navigator.of(
                                                        context,
                                                      ).push(
                                                        fadeRoute(
                                                          BlocProvider(
                                                            create: (context) =>
                                                                CreateCompteProfileSocialBloc(
                                                                  createSocialProfileUsercase:
                                                                      getIt<
                                                                        CreateSocialProfileUsercase
                                                                      >(),
                                                                ),
                                                            child:
                                                                FormSocialProfessionnal(
                                                                  profile: true,
                                                                ),
                                                          ),
                                                        ),
                                                      );
                                                  if (result as bool) {
                                                    log(
                                                      'Profile updated $result',
                                                    );
                                                    context
                                                        .read<GetProfileBloc>()
                                                        .add(
                                                          const ProfileEvent.fetch(),
                                                        );
                                                  }
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(8.r),
                                                  decoration: BoxDecoration(
                                                    color: context
                                                        .appColor
                                                        .primaryBlue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8.r,
                                                        ),
                                                  ),
                                                  child: Icon(
                                                    Icons.edit_note_sharp,
                                                    color: context
                                                        .appColor
                                                        .primaryWhite,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          Container(
                                            margin: EdgeInsets.symmetric(
                                              vertical: 5.h,
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 8.w,
                                              vertical: 8.h,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  context.appColor.primaryWhite,
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                            child: Column(
                                              children: [
                                                SizedBox(height: 7.h),
                                                Column(
                                                  children: [
                                                    ...getProfessionalInformation(
                                                      profile:
                                                          profileStream.data,
                                                    ).map(
                                                      (items) => Container(
                                                        // margin: EdgeInsets.symmetric(vertical: 1.h),
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              horizontal: 8.w,
                                                              vertical: 8.h,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          border: Border(
                                                            bottom:
                                                                items['title'] !=
                                                                    'Métier / Études'
                                                                ? BorderSide
                                                                      .none
                                                                : BorderSide(
                                                                    color: context
                                                                        .appColor
                                                                        .primaryGray100,
                                                                    width: 1.w,
                                                                  ),
                                                            top:
                                                                items['title'] !=
                                                                    'Téléphone'
                                                                ? BorderSide
                                                                      .none
                                                                : BorderSide(
                                                                    color: context
                                                                        .appColor
                                                                        .primaryGray100,
                                                                    width: 1.w,
                                                                  ),
                                                          ),
                                                          color: context
                                                              .appColor
                                                              .primaryWhite,
                                                          borderRadius:
                                                              items['title'] ==
                                                                  'Email'
                                                              ? BorderRadius.only(
                                                                  topLeft:
                                                                      Radius.circular(
                                                                        12.r,
                                                                      ),
                                                                  topRight:
                                                                      Radius.circular(
                                                                        12.r,
                                                                      ),
                                                                )
                                                              : items['title'] ==
                                                                    'Adresse & Quartier'
                                                              ? BorderRadius.only(
                                                                  bottomLeft:
                                                                      Radius.circular(
                                                                        12.r,
                                                                      ),
                                                                  bottomRight:
                                                                      Radius.circular(
                                                                        12.r,
                                                                      ),
                                                                )
                                                              : null,
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  EdgeInsets.only(
                                                                    bottom: 4.h,
                                                                  ),
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                          8.w,
                                                                        ),
                                                                    decoration: BoxDecoration(
                                                                      color: context
                                                                          .appColor
                                                                          .primaryBlue
                                                                          .withOpacity(
                                                                            0.1,
                                                                          ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            8.r,
                                                                          ),
                                                                    ),
                                                                    child: Icon(
                                                                      items['icon'],
                                                                      color: context
                                                                          .appColor
                                                                          .primaryBlue,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 8.w,
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      CustomeText(
                                                                        text:
                                                                            items['title'],
                                                                        style: context.appTypographie.button.copyWith(
                                                                          color: context
                                                                              .appColor
                                                                              .primaryGray500,
                                                                          fontSize:
                                                                              14.sp,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            8.w,
                                                                      ),
                                                                      CustomeText(
                                                                        text:
                                                                            items['value'],

                                                                        style: context.appTypographie.button.copyWith(
                                                                          color: context
                                                                              .appColor
                                                                              .primaryGray700,
                                                                          fontSize:
                                                                              11.sp,
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
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 13.w,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.auto_awesome,
                                                      color: context
                                                          .appColor
                                                          .primaryBlue,
                                                    ),
                                                    SizedBox(width: 8.w),
                                                    CustomeText(
                                                      text: "Vie Spirituelle",
                                                      style: context
                                                          .appTypographie
                                                          .button
                                                          .copyWith(
                                                            color: context
                                                                .appColor
                                                                .primaryGray700,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            letterSpacing:
                                                                0.5.sp,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 10.w),
                                                GestureDetector(
                                                  onTap: () async {
                                                    final profile =
                                                        await Navigator.of(
                                                          context,
                                                        ).push(
                                                          fadeRoute(
                                                            BlocProvider(
                                                              create: (context) =>
                                                                  CreateComteProfileSpiritualLifeBloc(
                                                                    createSpiritualProfileUsercase:
                                                                        getIt<
                                                                          CreateSpiritualProfileUsercase
                                                                        >(),
                                                                  ),
                                                              child:
                                                                  FormHollyLiving(
                                                                    profile:
                                                                        true,
                                                                  ),
                                                            ),
                                                          ),
                                                        );
                                                    if (profile as bool) {
                                                      log(
                                                        'Profile updated $profile',
                                                      );
                                                      context
                                                          .read<
                                                            GetProfileBloc
                                                          >()
                                                          .add(
                                                            const ProfileEvent.fetch(),
                                                          );
                                                    }
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.all(
                                                      8.r,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: context
                                                          .appColor
                                                          .primaryBlue,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8.r,
                                                          ),
                                                    ),
                                                    child: Icon(
                                                      Icons.edit_note_sharp,
                                                      color: context
                                                          .appColor
                                                          .primaryWhite,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          Container(
                                            margin: EdgeInsets.symmetric(
                                              vertical: 9.h,
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 8.w,
                                              vertical: 8.h,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  context.appColor.primaryWhite,
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                            child: Column(
                                              children: [
                                                SizedBox(height: 7.h),
                                                Column(
                                                  children: [
                                                    ...getSpiritualInformation(
                                                      profile:
                                                          profileStream.data,
                                                    ).map(
                                                      (items) => Container(
                                                        // margin: EdgeInsets.symmetric(vertical: 1.h),
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              horizontal: 8.w,
                                                              vertical: 8.h,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          border: Border(
                                                            bottom:
                                                                items['title'] !=
                                                                    'Date de baptême'
                                                                ? BorderSide
                                                                      .none
                                                                : BorderSide(
                                                                    color: context
                                                                        .appColor
                                                                        .primaryGray100,
                                                                    width: 1.w,
                                                                  ),
                                                            top:
                                                                items['title'] !=
                                                                    'Téléphone'
                                                                ? BorderSide
                                                                      .none
                                                                : BorderSide(
                                                                    color: context
                                                                        .appColor
                                                                        .primaryGray100,
                                                                    width: 1.w,
                                                                  ),
                                                          ),
                                                          color: context
                                                              .appColor
                                                              .primaryWhite,
                                                          borderRadius:
                                                              items['title'] ==
                                                                  'Email'
                                                              ? BorderRadius.only(
                                                                  topLeft:
                                                                      Radius.circular(
                                                                        12.r,
                                                                      ),
                                                                  topRight:
                                                                      Radius.circular(
                                                                        12.r,
                                                                      ),
                                                                )
                                                              : items['title'] ==
                                                                    'Adresse & Quartier'
                                                              ? BorderRadius.only(
                                                                  bottomLeft:
                                                                      Radius.circular(
                                                                        12.r,
                                                                      ),
                                                                  bottomRight:
                                                                      Radius.circular(
                                                                        12.r,
                                                                      ),
                                                                )
                                                              : null,
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  EdgeInsets.only(
                                                                    bottom: 4.h,
                                                                  ),
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                          8.w,
                                                                        ),
                                                                    decoration: BoxDecoration(
                                                                      color: context
                                                                          .appColor
                                                                          .primaryBlue
                                                                          .withOpacity(
                                                                            0.1,
                                                                          ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            8.r,
                                                                          ),
                                                                    ),
                                                                    child: Icon(
                                                                      items['icon'],
                                                                      color: context
                                                                          .appColor
                                                                          .primaryBlue,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 8.w,
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      CustomeText(
                                                                        text:
                                                                            items['title'],
                                                                        style: context.appTypographie.button.copyWith(
                                                                          color: context
                                                                              .appColor
                                                                              .primaryGray500,
                                                                          fontSize:
                                                                              14.sp,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            8.w,
                                                                      ),
                                                                      CustomeText(
                                                                        text:
                                                                            items['value'],

                                                                        style: context.appTypographie.button.copyWith(
                                                                          color: context
                                                                              .appColor
                                                                              .primaryGray700,
                                                                          fontSize:
                                                                              11.sp,
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
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 13.w,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.group,
                                                      color: context
                                                          .appColor
                                                          .primaryBlue,
                                                    ),
                                                    SizedBox(width: 8.w),
                                                    CustomeText(
                                                      text: "Engagement",
                                                      style: context
                                                          .appTypographie
                                                          .button
                                                          .copyWith(
                                                            color: context
                                                                .appColor
                                                                .primaryGray700,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            letterSpacing:
                                                                0.5.sp,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 10.w),
                                                GestureDetector(
                                                  onTap: () async {
                                                    final profile =
                                                        await Navigator.of(
                                                          context,
                                                        ).push(
                                                          fadeRoute(
                                                            FormEngagement(
                                                              profile: true,
                                                            ),
                                                          ),
                                                        );
                                                    if (profile as bool) {
                                                      log(
                                                        'Profile updated $profile',
                                                      );
                                                      context
                                                          .read<
                                                            GetProfileBloc
                                                          >()
                                                          .add(
                                                            const ProfileEvent.fetch(),
                                                          );
                                                    }
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.all(
                                                      8.r,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: context
                                                          .appColor
                                                          .primaryBlue,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8.r,
                                                          ),
                                                    ),
                                                    child: Icon(
                                                      Icons.edit_note_sharp,
                                                      color: context
                                                          .appColor
                                                          .primaryWhite,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          Container(
                                            margin: EdgeInsets.symmetric(
                                              vertical: 9.h,
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 8.w,
                                              vertical: 8.h,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  context.appColor.primaryWhite,
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                            child: Column(
                                              children: [
                                                Column(
                                                  children: [
                                                    ...getEngagement(
                                                      profile:
                                                          profileStream.data,
                                                    ).map(
                                                      (items) => Container(
                                                        // margin: EdgeInsets.symmetric(vertical: 1.h),
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              horizontal: 8.w,
                                                              vertical: 8.h,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          border: Border(
                                                            bottom:
                                                                items['title'] !=
                                                                    'Métier / Études'
                                                                ? BorderSide
                                                                      .none
                                                                : BorderSide(
                                                                    color: context
                                                                        .appColor
                                                                        .primaryGray100,
                                                                    width: 1.w,
                                                                  ),
                                                            top:
                                                                items['title'] !=
                                                                    'Téléphone'
                                                                ? BorderSide
                                                                      .none
                                                                : BorderSide(
                                                                    color: context
                                                                        .appColor
                                                                        .primaryGray100,
                                                                    width: 1.w,
                                                                  ),
                                                          ),
                                                          color: context
                                                              .appColor
                                                              .primaryWhite,
                                                          borderRadius:
                                                              items['title'] ==
                                                                  'Email'
                                                              ? BorderRadius.only(
                                                                  topLeft:
                                                                      Radius.circular(
                                                                        12.r,
                                                                      ),
                                                                  topRight:
                                                                      Radius.circular(
                                                                        12.r,
                                                                      ),
                                                                )
                                                              : items['title'] ==
                                                                    'Adresse & Quartier'
                                                              ? BorderRadius.only(
                                                                  bottomLeft:
                                                                      Radius.circular(
                                                                        12.r,
                                                                      ),
                                                                  bottomRight:
                                                                      Radius.circular(
                                                                        12.r,
                                                                      ),
                                                                )
                                                              : null,
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  EdgeInsets.only(
                                                                    bottom: 4.h,
                                                                  ),
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                          8.w,
                                                                        ),
                                                                    decoration: BoxDecoration(
                                                                      color: context
                                                                          .appColor
                                                                          .primaryBlue
                                                                          .withOpacity(
                                                                            0.1,
                                                                          ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            8.r,
                                                                          ),
                                                                    ),
                                                                    child: Icon(
                                                                      items['icon'],
                                                                      color: context
                                                                          .appColor
                                                                          .primaryBlue,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 8.w,
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      CustomeText(
                                                                        text:
                                                                            items['title'],
                                                                        style: context.appTypographie.button.copyWith(
                                                                          color: context
                                                                              .appColor
                                                                              .primaryGray500,
                                                                          fontSize:
                                                                              14.sp,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            8.w,
                                                                      ),
                                                                      CustomeText(
                                                                        text:
                                                                            items['value'],

                                                                        style: context.appTypographie.button.copyWith(
                                                                          color: context
                                                                              .appColor
                                                                              .primaryGray700,
                                                                          fontSize:
                                                                              11.sp,
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              if (profileStream.connectionState == ConnectionState.waiting) {
                return SafeArea(
                  child: Container(
                    height: 1.sh,
                    color: context.appColor.primaryGray100.withValues(
                      alpha: 0.6,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: CircularProgressIndicator.adaptive(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      context.appColor.primaryBlue,
                                    ),
                                    backgroundColor: context
                                        .appColor
                                        .primaryGray500
                                        .withValues(alpha: 0.3),
                                  ),
                                ),
                                SizedBox(height: 19.h),
                                Text(
                                  "Recupération des données en cours...",
                                  style: context.appTypographie.body.copyWith(
                                    fontSize: 12.sp,
                                    color: context.appColor.primaryBlue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return SafeArea(
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          child: SvgPicture.asset(
                            assets.images.problemeRequest.path,
                          ),
                        ),
                        Text(
                          "Une erreur est survenue !",
                          style: context.appTypographie.body.copyWith(
                            color: context.appColor.primaryBlue,
                          ),
                        ),
                        SizedBox(height: 14.h),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 0.17.sw),
                          child:
                              BlocBuilder<
                                GetProfileBloc,
                                ApiState<ProfileResponse>
                              >(
                                builder: (context, state) {
                                  return PrimaryButton(
                                    label: "Réessayer",
                                    colorText: Colors.white,
                                    fontSize: 13.sp,
                                    backgroundColor:
                                        context.appColor.primaryBlue,
                                    borderRadius: 14.r,
                                    onPressed: () {
                                      context.read<GetProfileBloc>().add(
                                        const ProfileEvent.fetch(),
                                      );
                                    },
                                  );
                                },
                              ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
