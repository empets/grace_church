import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_church/core/custome_widget/navigate.dart';
import 'package:grace_church/feature/home/domaine/usercase/read_notification_usercase.dart';
import 'package:grace_church/feature/home/page/bloc/notification/readnotification_bloc.dart';
import 'package:grace_church/feature/home/page/notification/notification_content.dart';
import 'package:grace_church/core/alert/app_alerte.dart';
import 'package:grace_church/core/bloc_state/bloc_state.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/core/extension/extention.dart';
import 'package:grace_church/core/injection/injection_container.dart';
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/feature/home/domaine/usercase/connexion_implicite_usercase.dart';
import 'package:grace_church/feature/home/domaine/usercase/get_cellule_usercase.dart';
import 'package:grace_church/feature/home/domaine/usercase/get_list_notification_usercase.dart';
import 'package:grace_church/feature/home/domaine/usercase/get_profile_usercase.dart';
import 'package:grace_church/feature/home/home_view.dart';
import 'package:grace_church/feature/home/menu_view.dart';
import 'package:grace_church/feature/home/page/bloc/app_launcher/app_launcher_bloc.dart';
import 'package:grace_church/feature/home/page/bloc/departement/eglise_maison/cellule_bloc.dart';
import 'package:grace_church/feature/home/page/bloc/departement/eglise_maison/event/cellule_event.dart';
import 'package:grace_church/feature/home/page/bloc/get_profile/event/profile_event.dart';
import 'package:grace_church/feature/home/page/bloc/get_profile/get_profile_bloc.dart';
import 'package:grace_church/feature/home/page/bloc/notification/event/notification_event.dart';
import 'package:grace_church/feature/home/page/bloc/notification/notification_bloc.dart';
import 'package:grace_church/feature/home/page/notification/notification_view.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({
    super.key,
    this.menberId = '',
    this.isFormImpliciteConnexion = false,
  });
  final String menberId;
  final bool isFormImpliciteConnexion;

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        if (widget.isFormImpliciteConnexion) ...[
          BlocProvider(
            create: (context) =>
                GetProfileBloc(getProfileUsercase: getIt<GetProfileUsercase>())
                  ..add(ProfileEvent.fetchProfileNumberId(widget.menberId)),
          ),
          BlocProvider.value(
            value: ConnexionImpliciteBloc(
              getConnexionImpliciteUsercase:
                  getIt<GetConnexionImpliciteUsercase>(),
            ),
          ),

          BlocProvider(
            create: (context) =>
                CelluleBloc(getCelluleUsercase: getIt<GetCelluleUsercase>())
                  ..add(CelluleEvent.fetch()),
          ),
        ],
        if (!widget.isFormImpliciteConnexion) ...[
          BlocProvider(
            create: (context) =>
                GetProfileBloc(getProfileUsercase: getIt<GetProfileUsercase>())
                  ..add(ProfileEvent.fetchProfileNumberId(widget.menberId)),
          ),
          BlocProvider.value(
            value: ConnexionImpliciteBloc(
              getConnexionImpliciteUsercase:
                  getIt<GetConnexionImpliciteUsercase>(),
            ),
          ),
          BlocProvider(
            create: (context) =>
                CelluleBloc(getCelluleUsercase: getIt<GetCelluleUsercase>())
                  ..add(CelluleEvent.fetch()),
          ),
        ],

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
            listener: (context, profileState) async {
              if (profileState is FailedState<ProfileResponse>) {
                AppAlert.showInfo(context, profileState.message.getOrEmpty());
              }
            },
          ),
          BlocListener<NotificationBloc, ApiState<List<NotificationResponse>>>(
            listener: (context, notificationState) async {
              if (notificationState
                  is FailedState<List<NotificationResponse>>) {
                AppAlert.showInfo(
                  context,
                  notificationState.message.getOrEmpty(),
                );
              }
            },
          ),
        ],
        child: BlocBuilder<ConnexionImpliciteBloc, ApiState<ProfileResponse>>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.grey.shade50,
              appBar: AppBar(backgroundColor: Colors.grey.shade50),
              drawer: MenuView(),
              body: HomeView(),
              floatingActionButton: BlocBuilder<GetProfileBloc, ApiState<ProfileResponse>>(
                builder: (context, stateProfile) {
                  if (stateProfile is SuccessState<ProfileResponse>) {
                    return BlocBuilder<
                      NotificationBloc,
                      ApiState<List<NotificationResponse>>
                    >(
                      builder: (context, notificationState) {
                        if (notificationState
                            is SuccessState<List<NotificationResponse>>) {
                          final filteredNotifications = notificationState.data
                              .where((notification) {
                                return notification.clicks.every(
                                  (click) =>
                                      click.menberId !=
                                      stateProfile.data.menberId,
                                );
                              })
                              .toList();

                          return filteredNotifications.length >0? Container(
                            margin: EdgeInsets.only(bottom: 10.h),
                            child: FloatingActionButton(
                              backgroundColor: context.appColor.primaryBlue
                                  .withValues(alpha: 0.8),
                              onPressed: () async {
                                final result = await Navigator.of(context).push(
                                  fadeRoute(
                                    BlocProvider(
                                      create: (context) => ReadNotificationBloc(
                                        readNotificationUsercase: getIt<ReadNotificationUsercase>(),
                                      ),
                                      child: NotificationView(
                                        profileId: stateProfile.data.menberId,
                                      ),
                                    ),
                                  ),
                                );
                                // Refresh notifications after returning from notification view
                                if (result == true) {
                                  context.read<NotificationBloc>().add(
                                    NotificationEvent.fetch(),
                                  );
                                }

                                // final result = await AppBottomSheet()
                                //     .showBottomSheetScrollable(
                                //       context,
                                //       MediaQuery.of(context),
                                //       (size) => MultiBlocProvider(
                                //         providers: [
                                //              BlocProvider(
                                //               create: (context) => NotificationBloc(
                                //                 getListNotificationUsercase: getIt<GetListNotificationUsercase>(),
                                //                 getListNotificationByCriteriaUsercase:
                                //                     getIt<GetListNotificationByCriteriaUsercase>(),
                                //               )..add(NotificationEvent.fetch()),

                                //             ),
                                //                 BlocProvider(
                                //                     create: (context) => ReadNotificationBloc(
                                //                       readNotificationUsercase: getIt<ReadNotificationUsercase>(),
                                //                     ),
                                //                 ),
                                //         ],
                                //         child: Container(
                                //           child: NotificationContent(
                                //             profileId:
                                //                 stateProfile.data.menberId,
                                //           ),
                                //         ),
                                //       ),
                                //     );

                                // if (result == true) {
                                //   context.read<NotificationBloc>().add(
                                //     NotificationEvent.fetch(),
                                //   );
                                // }
                              },
                              child:  Badge(
                                child: Icon(
                                  Icons.notifications_active,
                                  color: Colors.white,
                                ),
                                backgroundColor:
                                    filteredNotifications.length > 0
                                    ? Colors.red
                                    : Colors.transparent,
                                label: Text(
                                  filteredNotifications.length > 0
                                      ? filteredNotifications.length.toString()
                                      : '',
                                  style: context.appTypographie.body.copyWith(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ),
                          ): SizedBox();
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                  return Container();
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
