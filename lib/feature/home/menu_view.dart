import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_church/core/extension/custome_extension.dart';

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
                        Navigator.pop(context);
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
