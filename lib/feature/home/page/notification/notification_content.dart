import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grace_church/core/bloc_state/bloc_state.dart';
import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/feature/home/page/bloc/notification/event/notification_event.dart';
import 'package:grace_church/feature/home/page/bloc/notification/notification_bloc.dart' show NotificationBloc;
import 'package:grace_church/feature/home/page/bloc/notification/readnotification_bloc.dart';
import 'package:grace_church/gen/assets.gen.dart';
import 'package:intl/intl.dart';

class NotificationContent extends StatefulWidget {
  const NotificationContent({super.key, required this.profileId});
  final String profileId;

  @override
  State<NotificationContent> createState() => _NotificationContentState();
}

class _NotificationContentState extends State<NotificationContent> {

    late bool isRead = false;
      String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    // String formattedDate = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    String formatted = DateFormat("d MMMM y 'à' H:mm", 'fr').format(dateTime);
    return formatted;
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

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 1.h),
      height: 0.9.sh,
      width: double.infinity,
      child: Column(
        children: [
          // Text(
          //   'Notification ',
          //   style: context.appTypographie.body.copyWith(fontSize: 16.h),
          // ),

          
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
                              height: 0.8.sh,
                              child: ListView.builder(
                                itemCount: notificationState.data.length,
                                itemBuilder: (context, index) {
                                  notificationState.data.sort(
                                    (a, b) => b.date.compareTo(a.date),
                                  );
                                  final itemsNotification =
                                      notificationState.data[index];

                                   isRead = itemsNotification.clicks.any((element) => element.menberId == widget.profileId);

                                         final readElement = itemsNotification.clicks.where((element) => element.menberId == widget.profileId).map((element) => element).firstOrNull;

                                    if (readElement != null) {
                                          return GestureDetector(
                                    onTap: () {
                                      context.read<ReadNotificationBloc>().add(
                                        NotificationReadEvent.fetch(
                                          menberId: widget.profileId.trim(),
                                          notificationId: itemsNotification.notificationId.trim()
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 8.h),
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10.h,
                                        horizontal: 8.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: !isRead?  Colors.white : Colors.grey.shade200,
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
                                    ),
                                  );
                               
                                         }  
                                   


                                  








                                  return SizedBox(); },
                              ),
                            );
                          } else {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 0.17.sh,),
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
    );
  }
}
