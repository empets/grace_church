import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_church/core/custome_widget/navigate.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/core/injection/injection_container.dart';
import 'package:grace_church/feature/authen/domaine/usercase/create_profile_usercase.dart';
import 'package:grace_church/feature/authen/page/bloc/create_compte/form_profile_bloc.dart';
import 'package:grace_church/feature/authen/page/form_profile.dart';
import 'package:grace_church/feature/authen/page/form_social_professionnal.dart';
import 'package:grace_church/feature/home/cellule_view.dart';
import 'package:grace_church/feature/home/notification_view.dart';
import 'package:grace_church/feature/home/profile_view.dart';

class MenuView extends StatelessWidget {
  MenuView({super.key});

  final List<Map<String, dynamic>> menuItems = [
    {"title": "Mon Profil", "icon": Icons.person},
    {"title": "Ma Cellule de Maison", "icon": Icons.groups},
    {"title": "Mon Département", "icon": Icons.apartment_rounded},
    {"title": "Annonces de l'Église", "icon": Icons.campaign},
    {"title": "Paramètres", "icon": Icons.settings},
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
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
                    'John Doe',
                    style: context.appTypographie.body.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: context.appColor.primaryGrayDark,
                    ),
                  ),
                  Text(
                    'Member since 2023',
                    style: context.appTypographie.body.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey.shade300),

            // Menu items
            Expanded(
              child: ListView(
                children: [
                  ...menuItems.map((item) {
                    return ListTile(
                      leading: Icon(
                        item["icon"],
                        color: context.appColor.primaryBlue,
                      ),
                      title: Text(item["title"]),
                      onTap: () {
                        log('item: ${item}');
                        if (item["title"] == "Mon Profil") {
                          Navigator.of(context).push(
                            fadeRoute(
                              BlocProvider(
                                create: (context) => FormProfileBloc(
                                  createProfileUsercase:
                                      getIt<CreateProfileUsercase>(),
                                ),
                                child: ProfileView()
                                // FormProfile(),
                              ),
                            ),
                          );
                        }
                        if (item["title"] == "Ma Cellule de Maison") {
                          Navigator.of(context).push(fadeRoute(CelluleView()));
                        }
                        if (item["title"] == "Annonces de l'Église") {
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
      ),
    );
  }
}
