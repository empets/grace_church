import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/core/extension/extention.dart';
import 'package:grace_church/core/navigator_widget/custome_app_bar.dart';
import 'package:grace_church/feature/notification/domaine/entities/response/notification_response.dart';
import 'package:grace_church/gen/assets.gen.dart';

class MessageView extends StatefulWidget {
  const MessageView({super.key, required this.notification, this.onDataChanged});
  final NotificationResponse notification;
   final VoidCallback? onDataChanged;

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {

 @override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    widget.onDataChanged?.call();
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        leading: IconButton(
          icon: SvgPicture.asset(assets.images.arrowBack.path),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: CustomeHeaderTitle(title: "Message "),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 19.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    color: getTagBackgroundColor(
                      context: context,
                      tag: widget.notification.tag,
                    ),
                    borderRadius: BorderRadius.circular(17.r),
                  ),
                  child: CustomeText(
                    text: widget.notification.tag.toLowerCase(),
                    style: context.appTypographie.button.copyWith(
                      color: getTagTextColor(
                        context: context,
                        tag: widget.notification.tag,
                      ),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 19.h),
            CustomeText(
              text: widget.notification.title,
              style: context.appTypographie.button.copyWith(
                color: context.appColor.primaryGrayDark,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.h),
            CustomeText(
              text: widget.notification.description,
              style: context.appTypographie.button.copyWith(
                color: context.appColor.primaryGrayDark,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 16.sp,
                    color: context.appColor.primaryBlue.withValues(alpha: 0.7),
                  ),
                  SizedBox(width: 8.w),
                  CustomeText(
                    text: formatDate(widget.notification.date),
                    style: context.appTypographie.button.copyWith(
                      color: context.appColor.primaryGray500,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
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
}
