import 'dart:developer';

import 'package:firebase_database/firebase_database.dart' as databaseReference;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import 'package:grace_church/core/bloc_state/bloc_state.dart';
import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/custome_widget/form_filed.dart';
import 'package:grace_church/core/data_process/request/request.dart';
import 'package:grace_church/core/data_process/success.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/core/injection/injection_container.dart';
import 'package:grace_church/feature/authen/domaine/entities/request/authen_request.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart';
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/feature/home/domaine/usercase/get_list_notification_usercase.dart';
import 'package:grace_church/feature/home/page/bloc/notification/event/notification_event.dart';
import 'package:grace_church/feature/home/page/bloc/notification/notification_bloc.dart';
import 'package:grace_church/gen/assets.gen.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  Future<FirebaseResult<String>> sendNotifications(
    RequestReponsableCellule params,
  ) async {
    try {
      // 1) Construire l'objet Request
      final request = Request<RequestReponsableCellule>(
        data: params.toJson(),
        user: "",
        serviceLibelle: 'serviceLibelle',
      );
      // 2) Créer une nouvelle entré ou table
      final ref = databaseReference.FirebaseDatabase.instance
          .ref()
          .child('responsablesCellule')
          .push();
      // 3) Sauvegarder dans Firebase (en convertissant en Map)
      await ref.set(request.data);

      // 4) Mettre à jour la clé
      await updateProfileKey(
        RequestAuthenProfileUpdateZone(responsableCelluleId: ref.key.toString()),
      );

      return FirebaseSuccess(ref.key.toString());
    } catch (e) {
      log("🔥 Firebase Notification →→→→→→→→→ $e");
      return FirebaseError(e.toString());
    }
  }

  Future<FirebaseResult<String?>> updateProfileKey(
    RequestAuthenProfileUpdateZone params,
  ) async {
    try {
      final Map<String, dynamic> updates = {...params.toJson()};
      // 2) Créer une nouvelle entrée
      await databaseReference.FirebaseDatabase.instance
          .ref()
          .child('responsablesCellule/${params.responsableCelluleId}')
          .update(updates);
      // 4) Retourner le key généré
      return FirebaseSuccess(params.responsableCelluleId);
    } catch (e) {
      log("🔥 Firebase Notification →→→→→→→→→ $e");
      return FirebaseError(e.toString());
    }
  }

  String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    // String formattedDate = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    String formatted = DateFormat("d MMMM y 'à' H:mm", 'fr').format(dateTime);
    return formatted;
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
    Color _getTagBackgroundColor(String tag) {
      switch (tag.toLowerCase()) {
        case 'urgent':
          return Colors.red.shade50;
        case 'rappel':
          return context.appColor.primaryWarning.withValues(alpha: 0.1);
        case 'info':
          return context.appColor.primaryBlue.withValues(alpha: 0.1);
        default:
          return Colors.grey;
      }
    }

    Color _getTagTextColor(String tag) {
      switch (tag.toLowerCase()) {
        case 'urgent':
          return Colors.red;
        case 'rappel':
          return context.appColor.primaryWarning;
        case 'info':
          return context.appColor.primaryBlue;
        default:
          return Colors.grey;
      }
    }

    return BlocProvider(
      create: (context) => NotificationBloc(
        getListNotificationUsercase: getIt<GetListNotificationUsercase>(),
        getListNotificationByCriteriaUsercase:
            getIt<GetListNotificationByCriteriaUsercase>(),
      )..add(NotificationEvent.fetch()),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(backgroundColor: Colors.grey.shade50),
        body: SafeArea(
          bottom: true,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () async {
                      // TODO: Handle notification tap
                      await sendNotifications(
                         RequestReponsableCellule(
                          celluleId: "",
                          adresse: "12 Avenue Chardy, Abidjan",
                          celluleCode: "CELL003",
                          email: "test@gmail.com",
                          contact: "0123456789",
                          secteurCode: "SECT001",
                          
                          
                        

                        ),
                      );
                      log("Notification sent");
                    },
                    child: Container(child: Text("Notifications")),
                  ),
                  BlocBuilder<
                    NotificationBloc,
                    ApiState<List<NotificationResponse>>
                  >(
                    builder: (context, state) {
                      return ProductionFormCustomer(
                        letSpace: [],
                        textLabel: "Rechercher une annonce",
                        errorText: null,
                        prefixIcon: Icon(
                          Icons.search,
                          color: context.appColor.primaryGray700,
                        ),
                        msgError: "",
                        inputLabel: "",

                        onChanged: (value) {
                          context.read<NotificationBloc>().add(
                            NotificationEvent.fetchByTag(title: value),
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                        child:
                            BlocBuilder<
                              NotificationBloc,
                              ApiState<List<NotificationResponse>>
                            >(
                              builder: (context, state) {
                                return ShareButton(
                                  textToShare: "Tous",
                                  label: "Tous",
                                  colorText: Colors.white,
                                  iconLeading: false,
                                  iconColor: Colors.red,
                                  backgroundColor: context.appColor.primaryBlue,
                                  borderRadius: 20,
                                  fontSize: 12.sp,
                                  onPressed: () {
                                    context.read<NotificationBloc>().add(
                                      NotificationEvent.fetch(),
                                    );
                                  },
                                );
                              },
                            ),
                      ),
                      SizedBox(width: 2.w),
                      Expanded(
                        child:
                            BlocBuilder<
                              NotificationBloc,
                              ApiState<List<NotificationResponse>>
                            >(
                              builder: (context, state) {
                                return ShareButton(
                                  textToShare: "Urgent",
                                  label: "Urgent",
                                  colorText: Colors.red,
                                  leadingIcon: Icons.warning,
                                  iconLeading: true,
                                  iconColor: Colors.red,
                                  borderSideColor: Colors.red,
                                  backgroundColor: Colors.red.shade50,
                                  borderRadius: 20,
                                  fontSize: 12.sp,
                                  onPressed: () {
                                    context.read<NotificationBloc>().add(
                                      NotificationEvent.fetchByTag(
                                        tag: "urgent".toUpperCase(),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                      ),
                      SizedBox(width: 2.w),
                      Expanded(
                        child:
                            BlocBuilder<
                              NotificationBloc,
                              ApiState<List<NotificationResponse>>
                            >(
                              builder: (context, state) {
                                return ShareButton(
                                  textToShare: "Info",
                                  label: "Info",
                                  colorText: context.appColor.primaryBlue,
                                  leadingIcon: Icons.info,
                                  iconLeading: true,
                                  iconColor: context.appColor.primaryBlue,
                                  borderSideColor: context.appColor.primaryBlue,
                                  backgroundColor: context.appColor.primaryBlue
                                      .withValues(alpha: 0.1),
                                  borderRadius: 20,
                                  fontSize: 12.sp,
                                  onPressed: () {
                                    context.read<NotificationBloc>().add(
                                      NotificationEvent.fetchByTag(
                                        tag: "info".toUpperCase(),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                      ),
                      SizedBox(width: 2.w),
                      Expanded(
                        child:
                            BlocBuilder<
                              NotificationBloc,
                              ApiState<List<NotificationResponse>>
                            >(
                              builder: (context, state) {
                                return ShareButton(
                                  textToShare: "Rappel",
                                  label: "Rappel",
                                  colorText: context.appColor.primaryWarning,
                                  leadingIcon:
                                      Icons.access_time_filled_outlined,
                                  iconLeading: true,
                                  iconColor: context.appColor.primaryWarning,
                                  borderSideColor:
                                      context.appColor.primaryWarning,
                                  backgroundColor: context
                                      .appColor
                                      .primaryWarning
                                      .withValues(alpha: 0.1),
                                  borderRadius: 20,
                                  fontSize: 12.sp,
                                  onPressed: () {
                                    context.read<NotificationBloc>().add(
                                      NotificationEvent.fetchByTag(
                                        tag: "rappel".toUpperCase(),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  CustomeText(
                    text: "ANNONCE RECENTES",
                    style: context.appTypographie.button.copyWith(
                      color: context.appColor.primaryGray700,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  BlocBuilder<
                    NotificationBloc,
                    ApiState<List<NotificationResponse>>
                  >(
                    builder: (context, notificationState) {
                      if (notificationState
                          is LoadState<List<NotificationResponse>>) {
                        return Column(
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
                                    SizedBox(height: 0.2.sh),
                                    Center(
                                      child: CircularProgressIndicator.adaptive(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
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
                                      style: context.appTypographie.body
                                          .copyWith(
                                            fontSize: 12.sp,
                                            color: context.appColor.primaryBlue,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      if (notificationState
                          is SuccessState<List<NotificationResponse>>) {
                        return Container(
                          height: 0.6.sh,
                          child: ListView.builder(
                            itemCount: notificationState.data.length,
                            itemBuilder: (context, index) {
                              notificationState.data.sort(
                                (a, b) => b.date.compareTo(a.date),
                              );
                              final itemsNotification =
                                  notificationState.data[index];
                              return Container(
                                margin: EdgeInsets.only(bottom: 8.h),
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.h,
                                  horizontal: 8.w,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.1,
                                      ),
                                      blurRadius: 4.r,
                                      offset: Offset(0, 2.h),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8.w,
                                            vertical: 3.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: _getTagBackgroundColor(
                                              itemsNotification.tag,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              17.r,
                                            ),
                                          ),
                                          child: CustomeText(
                                            text: itemsNotification.tag
                                                .toLowerCase(),
                                            style: context.appTypographie.button
                                                .copyWith(
                                                  color: _getTagTextColor(
                                                    itemsNotification.tag,
                                                  ),
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                          ),
                                        ),
                                        CustomeText(
                                          text: formatTimeDifference(
                                            DateTime.parse(
                                              itemsNotification.date,
                                            ),
                                          ),
                                          style: context.appTypographie.button
                                              .copyWith(
                                                color: context
                                                    .appColor
                                                    .primaryGray500,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8.h),
                                    CustomeText(
                                      text: itemsNotification.title,
                                      style: context.appTypographie.button
                                          .copyWith(
                                            color: context
                                                .appColor
                                                .primaryGrayDark,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                    SizedBox(height: 8.h),
                                    ExpandableText(
                                      text: itemsNotification.description,
                                    ),

                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        vertical: 8.h,
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_today,
                                            size: 16.sp,
                                            color: context.appColor.primaryBlue
                                                .withValues(alpha: 0.7),
                                          ),
                                          SizedBox(width: 8.w),
                                          CustomeText(
                                            text: formatDate(
                                              itemsNotification.date,
                                            ),
                                            style: context.appTypographie.button
                                                .copyWith(
                                                  color: context
                                                      .appColor
                                                      .primaryGray500,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return Column(
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
                                    NotificationBloc,
                                    ApiState<List<NotificationResponse>>
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
                                          context.read<NotificationBloc>().add(
                                            NotificationEvent.fetch(),
                                          );
                                        },
                                      );
                                    },
                                  ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
