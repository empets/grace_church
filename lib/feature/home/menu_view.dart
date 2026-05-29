import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_church/feature/home/page/cellule/history_rapport_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:grace_church/core/alert/app_alerte.dart';
import 'package:grace_church/core/bloc_state/bloc_state.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/custome_widget/navigate.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/core/injection/injection_container.dart';
import 'package:grace_church/feature/authen/domaine/usercase/create_profile_usercase.dart';
import 'package:grace_church/feature/authen/domaine/usercase/create_social_profile_usercase.dart';
import 'package:grace_church/feature/authen/domaine/usercase/create_spiritual_profile.dart';
import 'package:grace_church/feature/authen/domaine/usercase/update_profile_usercase.dart';
import 'package:grace_church/feature/authen/page/bloc/create_compte/form_profile_bloc.dart';
import 'package:grace_church/feature/authen/page/bloc/create_compte/form_profile_social_bloc.dart';
import 'package:grace_church/feature/authen/page/bloc/create_compte/form_profile_spirituallife_bloc.dart';
import 'package:grace_church/feature/authen/page/form_engagement.dart';
import 'package:grace_church/feature/authen/page/form_holly_living.dart';
import 'package:grace_church/feature/authen/page/form_profile.dart';
import 'package:grace_church/feature/authen/page/form_social_professionnal.dart';
import 'package:grace_church/feature/authen/page/signin_view.dart';
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/feature/home/domaine/usercase/get_cellule_usercase.dart';
import 'package:grace_church/feature/home/domaine/usercase/get_list_responsable_cellule_usercase.dart';
import 'package:grace_church/feature/home/domaine/usercase/get_list_secteur.dart';
import 'package:grace_church/feature/home/domaine/usercase/get_list_zone.dart';
import 'package:grace_church/feature/home/domaine/usercase/get_rapport_cellule_usercase.dart';
import 'package:grace_church/feature/home/domaine/usercase/rapport_cellule_admine_usercase.dart';
import 'package:grace_church/feature/home/page/bloc/departement/eglise_maison/cellule_bloc.dart';
import 'package:grace_church/feature/home/page/bloc/departement/eglise_maison/event/cellule_event.dart';
import 'package:grace_church/feature/home/page/bloc/departement/eglise_maison/get_responsable_cellue_bloc.dart';
import 'package:grace_church/feature/home/page/bloc/departement/eglise_maison/get_responsable_secteur.dart';
import 'package:grace_church/feature/home/page/bloc/departement/eglise_maison/get_responsable_zone.dart';
import 'package:grace_church/feature/home/page/bloc/get_profile/get_profile_bloc.dart';
import 'package:grace_church/feature/home/page/bloc/rapport_cellule.dart/event/rapport_cellule_event.dart';
import 'package:grace_church/feature/home/page/bloc/rapport_cellule.dart/form_administraction_bloc.dart';
import 'package:grace_church/feature/home/page/bloc/rapport_cellule.dart/get_rapport_cellule_bloc.dart';
import 'package:grace_church/feature/home/page/cellule_form/from_administration.dart';
import 'package:grace_church/feature/home/page/notification/notification_view.dart';
import 'package:grace_church/feature/home/profile_view.dart';

// ignore: must_be_immutable
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

  late bool isResponsableCellule = false;

  Future<String> getMenberkey() async {
    final shared = await SharedPreferences.getInstance();
    final menberkey = await shared.getString('menberkey');
    return menberkey ?? '';
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
    ];
    final List<Map<String, dynamic>> menuItemsForResponsable = [
      {
        "title": "Mon Profil",
        "icon": Icons.person,
        "visible": true,
        "value": "profile",
      },
      {
        "title": "Notification",
        "icon": Icons.notifications,
        "visible": true,
        "value": "notification",
      },
       {
        "title": "History rapport",
        "icon": Icons.history_rounded,
        "visible": true,
        "value": "history_rapport",
      },
    ];

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetResponsableCelluleBloc(
            getListResponsableCelluleUsercase:
                getIt<GetListResponsableCelluleUsercase>(),
          )..add(CelluleEvent.fetch()),
        ),
        BlocProvider(
          create: (context) =>
              CelluleBloc(getCelluleUsercase: getIt<GetCelluleUsercase>())
                ..add(CelluleEvent.fetch()),
        ),
        BlocProvider(
          create: (context) => GetRapportCelluleBloc(
            getRapportCelluleUsercase: getIt<GetRapportCelluleUsercase>(),
          ),
        ),
      ],
      child: SafeArea(
        top: false,
        bottom: true,
        child: Drawer(
          
          child: Container(
            color: Colors.grey.shade50,
            width: 0.5.sw,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<GetProfileBloc, ApiState<ProfileResponse>>(
                  builder: (context, profileState) {
                    if (profileState is SuccessState<ProfileResponse>) {
                      if (profileState.data.menberId.isNotEmpty) {
                        context.read<GetRapportCelluleBloc>().add(
                          FecthDataEvent.fetchDataById(
                            responsableCelluleId: profileState.data.menberId,
                          ),
                        );
                      }
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
                            ),
                            BlocBuilder<
                              GetRapportCelluleBloc,
                              ApiState<List<RapportCelluleResponse>>
                            >(
                              builder: (context, listRapportCelluleState) {
                                return Column(
                                  children: [
                                    SizedBox(height: 13.h),
                                    Divider(color: Colors.grey.shade300),
                                    BlocBuilder<
                                      CelluleBloc,
                                      ApiState<List<CelluleResponse>>
                                    >(
                                      builder: (context, listCelluleState) {
                                        if (listCelluleState
                                            is SuccessState<
                                              List<CelluleResponse>
                                            >) {
                                          isResponsableCellule =
                                              listCelluleState.data.any((
                                                element,
                                              ) {
                                                return element
                                                    .responsableCelluleId
                                                    .trim()
                                                    .toLowerCase()
                                                    .contains(
                                                      profileState.data.menberId
                                                          .trim()
                                                          .toLowerCase(),
                                                    );
                                              });
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
                                                      item["value"] ==
                                                                  "profile" &&
                                                              profileState
                                                                      .data
                                                                      .submitEngagement ==
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
                                                                        alpha:
                                                                            0.5,
                                                                      )
                                                                : context
                                                                      .appColor
                                                                      .primaryGrayDark,
                                                          ),
                                                    ),
                                                    trailing:
                                                        ((item["value"] !=
                                                            "department"))
                                                        ? Icon(
                                                            Icons.chevron_right,
                                                            color: context
                                                                .appColor
                                                                .primaryBlue,
                                                          )
                                                        : SizedBox(),
                                                    onTap: () {
                                                      log('item: ');
                                                      if (item["value"] ==
                                                          "profile") {
                                                        Navigator.of(
                                                          context,
                                                        ).push(
                                                          fadeRoute(
                                                            MultiBlocProvider(
                                                              providers: [
                                                                BlocProvider(
                                                                  create: (context) => FormProfileBloc(
                                                                    createProfileUsercase:
                                                                        getIt<
                                                                          CreateProfileUsercase
                                                                        >(),
                                                                    updateProfileUsercase:
                                                                        getIt<
                                                                          UpdateProfileUsercase
                                                                        >(),
                                                                  ),
                                                                ),
                                                                BlocProvider(
                                                                  create:
                                                                      (
                                                                        context,
                                                                      ) => CreateCompteProfileSocialBloc(
                                                                        createSocialProfileUsercase:
                                                                            getIt<
                                                                              CreateSocialProfileUsercase
                                                                            >(),
                                                                      ),
                                                                ),
                                                                BlocProvider(
                                                                  create:
                                                                      (
                                                                        context,
                                                                      ) => CreateComteProfileSpiritualLifeBloc(
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
                                                                state:
                                                                    profileState
                                                                        .data,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      if (item["value"] ==
                                                          "cellule_space") {
                                                        if (profileState
                                                            .data
                                                            .submitSpiritual) {
                                                                 Navigator.of(
                                                            context,
                                                          ).push(
                                                            fadeRoute(
                                                              MultiBlocProvider(
                                                                providers: [
                                                                  BlocProvider(
                                                                    create: (context) => RapportCelluleRequestSectionAdministrationBloc(
                                                                      sendRapportCelluleStepAdministrationUsercase:
                                                                          getIt<
                                                                            SendRapportCelluleStepAdministrationUsercase
                                                                          >(),
                                                                    ),
                                                                  ),
                                                                  BlocProvider(
                                                                    create: (context) =>
                                                                        GetSecteurBloc(
                                                                          getListSecteurUsercase:
                                                                              getIt<
                                                                                GetListSecteurUsercase
                                                                              >(),
                                                                        )..add(
                                                                          CelluleEvent.fetch(),
                                                                        ),
                                                                  ),
                                                                  BlocProvider(
                                                                    create: (context) =>
                                                                        GetZoneBloc(
                                                                          getListZoneUsercase:
                                                                              getIt<
                                                                                GetListZoneUsercase
                                                                              >(),
                                                                        )..add(
                                                                          CelluleEvent.fetch(),
                                                                        ),
                                                                  ),
                                                                ],
                                                                child: EditingCelluleRaport(
                                                                  profile:
                                                                      profileState
                                                                          .data,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        
                                                         else {
                                                          Navigator.of(
                                                            context,
                                                          ).push(
                                                            fadeRoute(
                                                              MultiBlocProvider(
                                                                providers: [
                                                                  BlocProvider(
                                                                    create: (context) => RapportCelluleRequestSectionAdministrationBloc(
                                                                      sendRapportCelluleStepAdministrationUsercase:
                                                                          getIt<
                                                                            SendRapportCelluleStepAdministrationUsercase
                                                                          >(),
                                                                    ),
                                                                  ),
                                                                  BlocProvider(
                                                                    create: (context) =>
                                                                        GetSecteurBloc(
                                                                          getListSecteurUsercase:
                                                                              getIt<
                                                                                GetListSecteurUsercase
                                                                              >(),
                                                                        )..add(
                                                                          CelluleEvent.fetch(),
                                                                        ),
                                                                  ),
                                                                  BlocProvider(
                                                                    create: (context) =>
                                                                        GetZoneBloc(
                                                                          getListZoneUsercase:
                                                                              getIt<
                                                                                GetListZoneUsercase
                                                                              >(),
                                                                        )..add(
                                                                          CelluleEvent.fetch(),
                                                                        ),
                                                                  ),
                                                                ],
                                                                child: EditingCelluleRaport(
                                                                  profile:
                                                                      profileState
                                                                          .data,
                                                                ),
                                                              ),
                                                            ),
                                                          );

                                                          AppAlert.showInfo(
                                                            context,
                                                            "Veuillez finaliser votre création de compte",
                                                          );
                                                        }
                                                      }
                                                      if (item["value"] ==
                                                          "cellule") {
                                                        if (profileState
                                                            .data
                                                            .submitSpiritual) {
                                                          // Navigator.of(
                                                          //   context,
                                                          // ).push(
                                                          //   fadeRoute(
                                                          //     CelluleView(
                                                          //       cellueId:
                                                          //           profileState
                                                          //               .data
                                                          //               .celluleId,
                                                          //     ),
                                                          //   ),
                                                          // );
                                                        } 
                                                        else {
                                                          AppAlert.showInfo(
                                                            context,
                                                            "Veuillez finaliser votre création de compte",
                                                          );
                                                        }
                                                      }
                                                      if (item["value"] ==
                                                          "notification") {
                                                        Navigator.of(
                                                          context,
                                                        ).push(
                                                          fadeRoute(
                                                            NotificationView(profileId: profileState.data.menberId),
                                                          ),
                                                        );
                                                      }
                                                      if (item['value'] == 'history_rapport') {
                                                         Navigator.of(
                                                          context,
                                                        ).push(
                                                          fadeRoute(
                                                            HistoryRapportView(profileId: profileState.data.menberId),
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
                                                      item["value"] ==
                                                                  "profile" &&
                                                              profileState
                                                                      .data
                                                                      .submitEngagement !=
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
                                                                        alpha:
                                                                            0.5,
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
                                                      log('item: ');
                                                      if (item["value"] ==
                                                          "profile") {
                                                        Navigator.of(
                                                          context,
                                                        ).push(
                                                          fadeRoute(
                                                            MultiBlocProvider(
                                                              providers: [
                                                                BlocProvider(
                                                                  create: (context) => FormProfileBloc(
                                                                    createProfileUsercase:
                                                                        getIt<
                                                                          CreateProfileUsercase
                                                                        >(),
                                                                    updateProfileUsercase:
                                                                        getIt<
                                                                          UpdateProfileUsercase
                                                                        >(),
                                                                  ),
                                                                ),
                                                                BlocProvider(
                                                                  create:
                                                                      (
                                                                        context,
                                                                      ) => CreateCompteProfileSocialBloc(
                                                                        createSocialProfileUsercase:
                                                                            getIt<
                                                                              CreateSocialProfileUsercase
                                                                            >(),
                                                                      ),
                                                                ),
                                                                BlocProvider(
                                                                  create:
                                                                      (
                                                                        context,
                                                                      ) => CreateComteProfileSpiritualLifeBloc(
                                                                        createSpiritualProfileUsercase:
                                                                            getIt<
                                                                              CreateSpiritualProfileUsercase
                                                                            >(),
                                                                      ),
                                                                ),

                                                                // BlocProvider(
                                                                //   create: (context) =>
                                                                //       RapportCelluleRequestSectionAdministrationBloc(),
                                                                // ),
                                                                BlocProvider.value(
                                                                  value: context
                                                                      .read<
                                                                        GetProfileBloc
                                                                      >(),
                                                                ),
                                                              ],
                                                              child: buildForm(
                                                                state:
                                                                    profileState
                                                                        .data,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      if (item["value"] ==
                                                          "announcements") {
                                                        Navigator.of(
                                                          context,
                                                        ).push(
                                                          fadeRoute(
                                                            NotificationView(profileId: "",),
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
                                );
                              },
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
                                    '',

                                    fit: BoxFit.cover,
                                    height: 0.1.sh,
                                    width: 0.1.sh,
                                  ),
                                ),
                              ),

                              SizedBox(width: 12.w),
                              Text(
                                "Hello",
                                style: context.appTypographie.body.copyWith(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: context.appColor.primaryGrayDark,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Text(
                                  "",
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
                                      log('item: ');
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
                                                        updateProfileUsercase:
                                                            getIt<
                                                              UpdateProfileUsercase
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
            final menberkey = await shared.getString('menberkey');
            log("disconnect now $menberkey");
            if (menberkey != null && menberkey.isNotEmpty) {
              await shared.remove('menberkey');
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
