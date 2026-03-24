import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_church/core/bloc_state/bloc_state.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
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
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/feature/home/domaine/usercase/get_list_responsable_cellule_usercase.dart';
import 'package:grace_church/feature/home/notification_view.dart';
import 'package:grace_church/feature/home/page/bloc/cellule/event/cellule_event.dart';
import 'package:grace_church/feature/home/page/bloc/cellule/get_responsable_cellue_bloc.dart';
import 'package:grace_church/feature/home/page/bloc/get_profile/get_profile_bloc.dart';
import 'package:grace_church/feature/authen/page/bloc/create_compte/form_profile_spirituallife_bloc.dart';
import 'package:grace_church/feature/authen/page/signin_view.dart';
import 'package:grace_church/feature/home/profile_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  late bool isResponsableCellule = false;

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
    final List<Map<String, dynamic>> menuItemsForResponsable = [
      {
        "title": "Mon Profil",
        "icon": Icons.person,
        "visible": true,
        "value": "profile",
      },
      {
        "title": "Espace Cellule",
        "icon": Icons.import_contacts_rounded,
        "visible": true,
        "value": "cellule_space",
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

    return BlocProvider(
      create: (context) => GetResponsableCelluleBloc(
        getListResponsableCelluleUsercase:
            getIt<GetListResponsableCelluleUsercase>(),
      )..add(CelluleEvent.fetch()),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Drawer(
          child: Container(
            color: Colors.grey.shade50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        color:
                                            context.appColor.primaryLightBlue,
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
                                BlocBuilder<
                                  GetResponsableCelluleBloc,
                                  ApiState<List<ReponsableCelluleResponse>>
                                >(
                                  builder: (context, listResponsableState) {
                                    if (listResponsableState
                                        is SuccessState<
                                          List<ReponsableCelluleResponse>
                                        >) {
                                      isResponsableCellule =
                                          listResponsableState.data.any(
                                            (element) => element.responsable
                                                .trim()
                                                .toLowerCase()
                                                .contains(
                                                  profileStream.data?.name
                                                          ?.trim()
                                                          .toLowerCase() ??
                                                      "",
                                                ),
                                          );
                                      log(
                                        'isResponsableCellule: $isResponsableCellule',
                                      );
                                    }

                                    return Container(
                                      height: 0.4.sh,
                                      child: ListView(
                                        children: [
                                          if (isResponsableCellule) ...[
                                            ...menuItemsForResponsable.map((
                                              item,
                                            ) {
                                              return ListTile(
                                                leading: Icon(
                                                  item["icon"],
                                                  color:
                                                      (item["value"] ==
                                                          "department")
                                                      ? context
                                                            .appColor
                                                            .primaryBlue
                                                            .withValues(
                                                              alpha: 0.5,
                                                            )
                                                      : context
                                                            .appColor
                                                            .primaryBlue,
                                                ),
                                                title: Text(
                                                  item["value"] == "profile" &&
                                                          profileStream
                                                                  .data
                                                                  ?.submitEngagement ==
                                                              true
                                                      ? 'Mon profile'
                                                      : item["title"],

                                                  style: context
                                                      .appTypographie
                                                      .body
                                                      .copyWith(
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            (item["value"] ==
                                                                "department")
                                                            ? context
                                                                  .appColor
                                                                  .primaryGrayDark
                                                                  .withValues(
                                                                    alpha: 0.5,
                                                                  )
                                                            : context
                                                                  .appColor
                                                                  .primaryGrayDark,
                                                      ),
                                                ),
                                                trailing:
                                                    (item["value"] !=
                                                        "department")
                                                    ? Icon(
                                                        Icons.chevron_right,
                                                        color: context
                                                            .appColor
                                                            .primaryBlue,
                                                      )
                                                    : SizedBox(),
                                                onTap: () {
                                                  log('item: ${item}');
                                                  if (item["value"] ==
                                                      "profile") {
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
                                                                  .read<
                                                                    GetProfileBloc
                                                                  >(),
                                                            ),
                                                          ],
                                                          child: buildForm(
                                                            state: profileStream
                                                                .data,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  if (item["value"] ==
                                                      "cellule") {
                                                    Navigator.of(context).push(
                                                      fadeRoute(
                                                        CelluleView(
                                                          cellueId:
                                                              profileStream
                                                                  .data
                                                                  ?.celluleId ??
                                                              "",
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  if (item["value"] ==
                                                      "announcements") {
                                                    Navigator.of(context).push(
                                                      fadeRoute(
                                                        NotificationView(),
                                                      ),
                                                    );
                                                  }
                                                },
                                              );
                                            }),
                                          ] else ...[
                                            ...menuItems.map((item) {
                                              return ListTile(
                                                leading: Icon(
                                                  item["icon"],
                                                  color:
                                                      (item["value"] ==
                                                          "department")
                                                      ? context
                                                            .appColor
                                                            .primaryBlue
                                                            .withValues(
                                                              alpha: 0.5,
                                                            )
                                                      : context
                                                            .appColor
                                                            .primaryBlue,
                                                ),
                                                title: Text(
                                                  item["value"] == "profile" &&
                                                          profileStream
                                                                  .data
                                                                  ?.submitEngagement !=
                                                              true
                                                      ? 'Mon profile'
                                                      : item["title"],
                                                  style: context
                                                      .appTypographie
                                                      .body
                                                      .copyWith(
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            (item["value"] ==
                                                                "department")
                                                            ? context
                                                                  .appColor
                                                                  .primaryGrayDark
                                                                  .withValues(
                                                                    alpha: 0.5,
                                                                  )
                                                            : context
                                                                  .appColor
                                                                  .primaryGrayDark,
                                                      ),
                                                ),
                                                trailing:
                                                    (item["value"] !=
                                                        "department")
                                                    ? Icon(
                                                        Icons.chevron_right,
                                                        color: context
                                                            .appColor
                                                            .primaryBlue,
                                                      )
                                                    : SizedBox(),
                                                onTap: () {
                                                  log('item: ${item}');
                                                  if (item["value"] ==
                                                      "profile") {
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
                                                                  .read<
                                                                    GetProfileBloc
                                                                  >(),
                                                            ),
                                                          ],
                                                          child: buildForm(
                                                            state: profileStream
                                                                .data,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  if (item["value"] ==
                                                      "cellule") {
                                                    Navigator.of(context).push(
                                                      fadeRoute(
                                                        CelluleView(
                                                          cellueId:
                                                              profileStream
                                                                  .data
                                                                  ?.celluleId ??
                                                              "",
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  if (item["value"] ==
                                                      "announcements") {
                                                    Navigator.of(context).push(
                                                      fadeRoute(
                                                        NotificationView(),
                                                      ),
                                                    );
                                                  }
                                                },
                                              );
                                            }),
                                          ],
                                        ],
                                      ),
                                    );
                                  },
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
                                      color: (item["value"] == "profile")
                                          ? context.appColor.primaryBlue
                                          : context.appColor.primaryBlue
                                                .withValues(alpha: 0.5),
                                    ),
                                    title: Text(
                                      item["value"] != "profile"
                                          ? item["title"]
                                          : "Creer un compte",
                                      style: context.appTypographie.body
                                          .copyWith(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w600,
                                            color: (item["value"] != "profile")
                                                ? context
                                                      .appColor
                                                      .primaryGrayDark
                                                      .withValues(alpha: 0.5)
                                                : context
                                                      .appColor
                                                      .primaryGrayDark,
                                          ),
                                    ),
                                    trailing: (item["value"] != "profile")
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

                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 19.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey.shade300, width: 1),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => LogOutPope(),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.logout),
                            SizedBox(width: 8.w),
                            CustomeText(
                              text: "Déconnexion",
                              style: context.appTypographie.body.copyWith(
                                color: context.appColor.primaryGray700,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5.sp,
                              ),
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
      ),
    );
  }
}

class LogOutPope extends StatelessWidget {
  const LogOutPope({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade50,
      title: Text(
        'Déconnexion',
        style: context.appTypographie.body.copyWith(
          color: context.appColor.primaryBlue,
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5.sp,
        ),
      ),
      content: Text(
        'Êtes-vous sûr de vouloir vous déconnecter?',
        style: context.appTypographie.body.copyWith(
          color: context.appColor.primaryGray700,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5.sp,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Non',
            style: context.appTypographie.body.copyWith(
              color: context.appColor.primaryBlue,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5.sp,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            final shared = await SharedPreferences.getInstance();
            final isLaunchApp = await shared.getString('isAppLauncher');
            final menberkey = await shared.getString('menberkey');
            if (isLaunchApp != null && isLaunchApp.contains('isAppLauncher')) {
              await shared.remove('isAppLauncher');
              if (menberkey != null && menberkey.isNotEmpty) {
                await shared.remove('menberkey');
              }
              Navigator.of(context).pushAndRemoveUntil(
                fadeRoute(const SigninView()),
                (route) => false,
              );
            }
          },
          child: Text(
            'Oui',
            style: context.appTypographie.body.copyWith(
              color: context.appColor.primaryGray700,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5.sp,
            ),
          ),
        ),
      ],
    );
  }
}
