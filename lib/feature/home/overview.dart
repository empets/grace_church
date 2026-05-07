import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:grace_church/core/alert/app_alerte.dart';
import 'package:grace_church/core/bloc_state/bloc_state.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/custome_widget/navigate.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/core/extension/extention.dart';
import 'package:grace_church/core/injection/injection_container.dart';
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/feature/home/domaine/usercase/get_list_notification_usercase.dart';
import 'package:grace_church/feature/home/domaine/usercase/get_profile_usercase.dart';
import 'package:grace_church/feature/home/home_view.dart';
import 'package:grace_church/feature/home/menu_view.dart';
import 'package:grace_church/feature/home/notification_view.dart';
import 'package:grace_church/feature/home/page/bloc/app_launcher/app_launcher_bloc.dart';
import 'package:grace_church/feature/home/page/bloc/get_profile/event/profile_event.dart';
import 'package:grace_church/feature/home/page/bloc/get_profile/get_profile_bloc.dart';
import 'package:grace_church/feature/home/page/bloc/notification/event/notification_event.dart';
import 'package:grace_church/feature/home/page/bloc/notification/notification_bloc.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  
  Color getNotificationColor(List<NotificationResponse> notifications) {
  final now = DateTime.now();

  final countToday = notifications.where((notification) {
    final date = notification.date;
    return date == now.toString().split(' ')[0];
  }).length;

  switch (countToday > 0) {
    case true:
      return Colors.amber.shade400;

    case false:
      return Colors.transparent;
  }
}

   int countTodayNotifications(List<NotificationResponse> notifications) {
  final now = DateTime.now();

  final countToday = notifications.where((notification) {
    final date = notification.date;
    return date == now.toString().split(' ')[0];
  }).length;

  switch (countToday > 0) {
    case true:
      return countToday;

    case false:
      return 0;
  }
}


    String formatTimeDifference(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inSeconds < 60) {
      return "À l'instant";
    }
    if (diff.inMinutes < 60) {
      return "Il y a ${diff.inMinutes} min";
    }
    if (diff.inHours < 24) {
      return "Il y a ${diff.inHours} h";
    }
    if (diff.inDays < 7) {
      return "Il y a ${diff.inDays} jours";
    }

    return "Le ${date.day}/${date.month}/${date.year}";
  }


  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetProfileBloc(getProfileUsercase: getIt<GetProfileUsercase>())
                ..add(ProfileEvent.fetch()),
        ),
        BlocProvider(create: (context) => AppLauncherBloc()),
        BlocProvider(
          create: (context) => NotificationBloc(
            getListNotificationUsercase: getIt<GetListNotificationUsercase>(),
            getListNotificationByCriteriaUsercase:
                getIt<GetListNotificationByCriteriaUsercase>(),
          )..add(NotificationEvent.fetch()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<GetProfileBloc, ApiState<ProfileResponse>>(
            listener: (context, profileState) {
              if (profileState is SuccessState<ProfileResponse>) {}
              if (profileState is FailedState<ProfileResponse>) {
                AppAlert.showError(
                  context,
                  profileState.message.getOrEmpty(),
                  showOnTop: true,
                );
              }
            },
          ),
        ],
        child: BlocBuilder<AppLauncherBloc, ApiState<bool>>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.grey.shade50,
              appBar: AppBar(backgroundColor: Colors.grey.shade50),
              drawer: MenuView(),
              body: HomeView(),
              floatingActionButton: BlocBuilder<NotificationBloc,   ApiState<List<NotificationResponse>>>(
                builder: (context, notificationState) {
                  if(notificationState is SuccessState<List<NotificationResponse>>){
                      final count = notificationState.data.length;
                      final showBadge =  notificationState.data.sort(
                                (a, b) => b.date.compareTo(a.date),
                              );
                              // showBadge
                    return Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: FloatingActionButton(
                      backgroundColor: context.appColor.primaryBlue.withValues(
                        alpha: 0.8,
                      ),
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).push(fadeRoute(const NotificationView()));
                      },
                      child:  
                      Badge(
                        child: Icon(
                          Icons.notifications_active,
                          color: Colors.white,
                        ),
                        backgroundColor: getNotificationColor(notificationState.data),
                        label:  Text(
                         '',
                          style: context.appTypographie.body.copyWith(
                            color: Colors.white,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ),
                    ),
                  );
                  }
                  else{
                    return Container();
                  }
                 
                },
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
            );
          },
        ),
      ),
    );
  }
}
