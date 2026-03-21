import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import 'package:grace_church/feature/home/data/model/home_model.dart';
import 'package:grace_church/feature/home/data/service/steam_remote_service.dart';
import 'package:grace_church/feature/home/notification_view.dart';
import 'package:grace_church/feature/home/page/bloc/get_profile/get_profile_bloc.dart';
import 'package:grace_church/feature/authen/page/bloc/create_compte/form_profile_spirituallife_bloc.dart';
import 'package:grace_church/feature/home/profile_view.dart';

class MenuView extends StatelessWidget {
  MenuView({super.key});

  Widget buildForm({required ProfileResponseModel? state}) {
    if (state?.submitProfile == false) {
      return FormProfile();
    } else if (state?.submitSocial == false) {
      return FormSocialProfessionnal();
    } else if (state?.submitSpiritual == false) {
      return FormHollyLiving();
    } else if (state?.submitEngagement == false) {
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
            StreamBuilder(
              stream: getIt<ImpleSteamRemoteService>().getProfileStream(),
              builder: (context, profileStream) {
                if (profileStream.hasData && profileStream.data != null) {
                  return Container(
                    margin: EdgeInsets.only(top: 40.h),
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 19.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                    profileStream.data?.profileImage ?? "",

                                    fit: BoxFit.cover,
                                    height: 0.1.sh,
                                    width: 0.1.sh,
                                  ),
                                ),
                              ),

                              SizedBox(width: 12.w),
                              Text(
                                profileStream.data?.name ?? "",
                                style: context.appTypographie.body.copyWith(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: context.appColor.primaryGrayDark,
                                ),
                              ),
                              Text(
                                profileStream.data?.email ?? "",
                                style: context.appTypographie.body.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(height: 13.h),
                            Divider(color: Colors.grey.shade300),
                            Container(
                              height: 0.4.sh,
                              child: ListView(
                                children: [
                                  ...menuItems.map((item) {
                                    return ListTile(
                                      leading: Icon(
                                        item["icon"],
                                        color: (item["value"] == "department")
                                            ? context.appColor.primaryBlue
                                                  .withValues(alpha: 0.5)
                                            : context.appColor.primaryBlue,
                                      ),
                                      title: Text(
                                        item["value"] != "profile" &&
                                                profileStream
                                                        .data
                                                        ?.submitEngagement !=
                                                    true
                                            ? item["title"]
                                            : item["value"] == "profile" &&
                                                  profileStream
                                                          .data
                                                          ?.submitEngagement ==
                                                      true
                                            ? 'Mon profile'
                                            : item["title"],
                                        style: context.appTypographie.body
                                            .copyWith(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  (item["value"] ==
                                                      "department")
                                                  ? context
                                                        .appColor
                                                        .primaryGrayDark
                                                        .withValues(alpha: 0.5)
                                                  : context
                                                        .appColor
                                                        .primaryGrayDark,
                                            ),
                                      ),
                                      trailing: (item["value"] != "department")
                                          ? Icon(
                                              Icons.chevron_right,
                                              color:
                                                  context.appColor.primaryBlue,
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
                                                    create: (context) =>
                                                        FormProfileBloc(
                                                          createProfileUsercase:
                                                              getIt<
                                                                CreateProfileUsercase
                                                              >(),
                                                        ),
                                                  ),
                                                  BlocProvider(
                                                    create: (context) =>
                                                        CreateCompteProfileSocialBloc(
                                                          createSocialProfileUsercase:
                                                              getIt<
                                                                CreateSocialProfileUsercase
                                                              >(),
                                                        ),
                                                  ),
                                                  BlocProvider(
                                                    create: (context) =>
                                                        CreateComteProfileSpiritualLifeBloc(
                                                          createSpiritualProfileUsercase:
                                                              getIt<
                                                                CreateSpiritualProfileUsercase
                                                              >(),
                                                        ),
                                                  ),

                                                  BlocProvider.value(
                                                    value: context
                                                        .read<GetProfileBloc>(),
                                                  ),
                                                ],
                                                child: buildForm(
                                                  state: profileStream.data,
                                                ),
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }

                return Container(
                  margin: EdgeInsets.only(top: 40.h),
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
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
                                profileStream.data?.profileImage ?? "",

                                fit: BoxFit.cover,
                                height: 0.1.sh,
                                width: 0.1.sh,
                              ),
                            ),
                          ),

                          SizedBox(width: 12.w),
                          Text(
                            profileStream.data?.name ?? "Hello",
                            style: context.appTypographie.body.copyWith(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: context.appColor.primaryGrayDark,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              profileStream.data?.email ??
                                  "vous n'avez pas d'email",
                              style: context.appTypographie.body.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 13.h),
                      Divider(color: Colors.grey.shade300),
                      Container(
                        height: 0.5.sh,
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
                                              create: (context) =>
                                                  FormProfileBloc(
                                                    createProfileUsercase:
                                                        getIt<
                                                          CreateProfileUsercase
                                                        >(),
                                                  ),
                                            ),
                                            BlocProvider(
                                              create: (context) =>
                                                  CreateCompteProfileSocialBloc(
                                                    createSocialProfileUsercase:
                                                        getIt<
                                                          CreateSocialProfileUsercase
                                                        >(),
                                                  ),
                                            ),
                                            BlocProvider(
                                              create: (context) =>
                                                  CreateComteProfileSpiritualLifeBloc(
                                                    createSpiritualProfileUsercase:
                                                        getIt<
                                                          CreateSpiritualProfileUsercase
                                                        >(),
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
                      ),
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
