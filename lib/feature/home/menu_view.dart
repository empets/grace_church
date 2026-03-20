import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_church/core/bloc_state/bloc_state.dart';
import 'package:grace_church/core/custome_widget/navigate.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/core/injection/injection_container.dart';
import 'package:grace_church/feature/authen/domaine/usercase/create_profile_usercase.dart';
import 'package:grace_church/feature/authen/domaine/usercase/create_social_profile_usercase.dart';
import 'package:grace_church/feature/authen/domaine/usercase/create_spiritual_profile.dart';
import 'package:grace_church/feature/authen/page/bloc/create_compte/form_profile_bloc.dart';
import 'package:grace_church/feature/authen/page/bloc/create_compte/form_profile_social_bloc.dart';
import 'package:grace_church/feature/authen/page/form_engagement.dart';
import 'package:grace_church/feature/authen/page/form_holly_living.dart';
import 'package:grace_church/feature/authen/page/form_profile.dart';
import 'package:grace_church/feature/authen/page/form_social_professionnal.dart';
import 'package:grace_church/feature/home/cellule_view.dart';
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/feature/home/notification_view.dart';
import 'package:grace_church/feature/home/page/bloc/get_profile/get_profile_bloc.dart';
import 'package:grace_church/feature/authen/page/bloc/create_compte/form_profile_spirituallife_bloc.dart';
import 'package:grace_church/feature/home/profile_view.dart';


class MenuView extends StatelessWidget {
  MenuView({super.key});

 
  Widget buildForm({required ProfileResponse state}) {
  if (state.submitProfile == false) {
    return FormProfile();
  } else if (state.submitSocial == false) {
    return FormSocialProfessionnal();
  } else if (state.submitSpiritual == false) {
    return FormHollyLiving();
  } else if (state.submitEngagement == false) {
    return FormEngagement();
  } else {
    return ProfileView(profile: state);
  }
}



  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> menuItems = [
    {
      "title": "Mon Profil",
      "icon": Icons.person,
      "visible": true,
      "value": "profile",
    },
    {
      "title": "Ma Cellule de Maison",
      "icon": Icons.groups,
      "visible": true,
      "value": "cellule",
    },
    {
      "title": "Mon Département",
      "icon": Icons.apartment_rounded,
      "visible": false,
      "value": "department",
    },
    {
      "title": "Annonces de l'Église",
      "icon": Icons.campaign,
      "visible": true,
      "value": "announcements",
    },
    // {"title": "Paramètres", "icon": Icons.settings},
  ];
    
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            BlocBuilder<GetProfileBloc, ApiState<ProfileResponse>>(
              builder: (context, profileState) {
                if (profileState is SuccessState<ProfileResponse>) {
                  return Container(
                    margin: EdgeInsets.only(top: 30.h),
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                              loadingBuilder:
                                  (context, child, loadingProgress) {
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
                              profileState.data.profileImage,

                              fit: BoxFit.cover,
                              height: 0.1.sh,
                              width: 0.1.sh,
                            ),
                          ),
                        ),

                        SizedBox(width: 12.w),
                        Text(
                          profileState.data.name,
                          style: context.appTypographie.body.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: context.appColor.primaryGrayDark,
                          ),
                        ),
                        Text(
                          profileState.data.email,
                          style: context.appTypographie.body.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return Container(
                  margin: EdgeInsets.only(top: 30.h),
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: context.appColor.primaryBlue.withValues(
                            alpha: 0.1,
                          ),
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Icon(
                          Icons.person,
                          color: context.appColor.primaryBlue,
                          size: 40.sp,
                        ),
                      ),

                      SizedBox(width: 12.w),
                      Text(
                        'John Do',
                        style: context.appTypographie.body.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: context.appColor.primaryGrayDark,
                        ),
                      ),
                      Text(
                        'Member since 202',
                        style: context.appTypographie.body.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Divider(color: Colors.grey.shade300),

            // Menu items
            BlocBuilder<GetProfileBloc, ApiState<ProfileResponse>>(
              builder: (context, state) {
                if (state is SuccessState<ProfileResponse>) {
                  return Expanded(
                    child: ListView(
                      children: [
                        ...menuItems.map((item) {
                          return ListTile(
                            leading: Icon(
                              item["icon"],
                              color: (item["value"] == "department")
                                  ? context.appColor.primaryBlue.withValues(
                                      alpha: 0.5,
                                    )
                                  : context.appColor.primaryBlue,
                            ),
                            title: Text(
                              item["value"] != "profile" &&
                                      state.data.submitEngagement != true
                                  ? item["title"]
                                  : item["value"] == "profile" &&
                                          state.data.submitEngagement == true
                                  ? item["title"]
                                  : 'Continuer l\'inscription',
                              style: context.appTypographie.body.copyWith(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: (item["value"] == "department")
                                    ? context.appColor.primaryGrayDark
                                          .withValues(alpha: 0.5)
                                    : context.appColor.primaryGrayDark,
                              ),
                            ),
                            trailing: (item["value"] != "department")
                                ? Icon(
                                    Icons.chevron_right,
                                    color: context.appColor.primaryBlue,
                                  )
                                : SizedBox(),
                            onTap: () {
                              log('item: ${item}');
                              if (item["value"] == "profile") {
                                Navigator.of(context).push(
                                  fadeRoute(
                                    MultiBlocProvider(
                                      providers: [
                                        BlocProvider(
                                          create: (context) => FormProfileBloc(
                                            createProfileUsercase:
                                                getIt<CreateProfileUsercase>(),
                                          ),
                                        ),
                                         BlocProvider(
                                          create: (context) => CreateCompteProfileSocialBloc(
                                            createSocialProfileUsercase:
                                                getIt<CreateSocialProfileUsercase>(),
                                          ),
                                        ) ,
                                            BlocProvider(
                                            create: (context) => CreateComteProfileSpiritualLifeBloc(
                                              createSpiritualProfileUsercase:
                                                  getIt<CreateSpiritualProfileUsercase>(),
                                            ),
                                          ),

                                          BlocProvider.value(value: context.read<GetProfileBloc>()),
                                      ],
                                      child: buildForm(state: state.data),
                                    ),
                                  ),
                                );
                              }
                              if (item["value"] == "cellule") {
                                Navigator.of(
                                  context,
                                ).push(fadeRoute(CelluleView()));
                              }
                              if (item["value"] == "announcements") {
                                Navigator.of(
                                  context,
                                ).push(fadeRoute(NotificationView()));
                              }
                            },
                          );
                        }),
                      ],
                    ),
                  );
                }
                return Expanded(
                  child: ListView(
                    children: [
                      ...menuItems.map((item) {
                        return ListTile(
                          leading: Icon(
                            item["icon"],
                            color: (item["value"] == "department")
                                ? context.appColor.primaryBlue.withValues(
                                    alpha: 0.5,
                                  )
                                : context.appColor.primaryBlue,
                          ),
                          title: Text(
                            item["value"] != "profile" 
                                  ? item["title"]
                                  : "Creer un compte",
                            style: context.appTypographie.body.copyWith(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: (item["value"] == "department")
                                  ? context.appColor.primaryGrayDark.withValues(
                                      alpha: 0.5,
                                    )
                                  : context.appColor.primaryGrayDark,
                            ),
                          ),
                          trailing: (item["value"] != "department")
                              ? Icon(
                                  Icons.chevron_right,
                                  color: context.appColor.primaryBlue,
                                )
                              : SizedBox(),
                          onTap: () {
                            log('item: ${item}');
                            if (item["value"] == "profile") {
                              Navigator.of(context).push(
                                fadeRoute(
                                  MultiBlocProvider(
                                    providers: [
                                         BlocProvider(
                                          create: (context) => FormProfileBloc(
                                            createProfileUsercase:
                                                getIt<CreateProfileUsercase>(),
                                          ),
                                        ),
                                         BlocProvider(
                                          create: (context) => CreateCompteProfileSocialBloc(
                                            createSocialProfileUsercase:
                                                getIt<CreateSocialProfileUsercase>(),
                                          ),
                                        ) ,
                                            BlocProvider(
                                            create: (context) => CreateComteProfileSpiritualLifeBloc(
                                              createSpiritualProfileUsercase:
                                                  getIt<CreateSpiritualProfileUsercase>(),
                                            ),
                                          ),
                                    ],
                                    child: FormProfile(),
                                    // ProfileView(),
                                    // FormProfile(),
                                  ),
                                ),
                              );
                            }
                            if (item["value"] == "cellule") {
                              Navigator.of(
                                context,
                              ).push(fadeRoute(CelluleView()));
                            }
                            if (item["value"] == "announcements") {
                              Navigator.of(
                                context,
                              ).push(fadeRoute(NotificationView()));
                            }
                          },
                        );
                      }),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
