import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart' as tube;

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  late tube.YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    final videoId = tube.YoutubePlayer.convertUrlToId(
      "https://www.youtube.com/watch?v=bxDFCGGhX8E",
    );

    _controller = tube.YoutubePlayerController(
      initialVideoId: videoId ?? '',
      flags: tube.YoutubePlayerFlags(autoPlay: false),
    );
  }

  @override
  void dispose() {
    _controller;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColor.primaryWhite,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 13.w),
        child: Column(
          children: [
            SizedBox(height: 0.06.sh),

            // AppBarCard
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(1.r),
                      decoration: BoxDecoration(
                        border: Border.all(color: context.appColor.primaryBlue),
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.network(
                          "https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_640.png",
                          height: 0.07.sh,
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 14.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomeText(
                            text: 'Welcome back',
                            style: context.appTypographie.small.copyWith(
                              color: context.appColor.primaryGray500,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          CustomeText(
                            text: 'Sara Williams',
                            style: context.appTypographie.subtitle.copyWith(
                              color: context.appColor.primaryGray700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    //sdlf
                    ),
                  ],
                ),

                Container(
                  margin: EdgeInsets.only(top: 6.h),
                  child: Icon(
                    Icons.notification_add_rounded,
                    color: context.appColor.primaryGray500,
                  ),
                ),
              ],
            ),

            //Cardre
            Container(
              color: Colors.amber,
              height: 0.23333333.sh,

              margin: EdgeInsets.symmetric(vertical: 19.h),
              child: Stack(
                children: [
                  SizedBox(
                    width: 0.9.sw,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7.r),
                      child: tube.YoutubePlayerBuilder(
                        player: tube.YoutubePlayer(
                          controller: _controller,
                          liveUIColor: Colors.red,
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: Colors.red,
                        ),
                        builder: (context, player) {
                          return Column(
                            children: [
                              player,
                              const SizedBox(height: 16),
                              const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text("Description de la vidéo ici"),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),

                  Positioned(
                    top: 30,
                    left: 9.w,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: context.appColor.primaryError,
                              size: 10.h,
                            ),
                            SizedBox(width: 9.w),
                            CustomeText(
                              text: "Live Now",
                              style: context.appTypographie.small.copyWith(
                                color: context.appColor.primaryWhite,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    top: 37.h,
                    right: 9.w,
                    left: 9.w,
                    // width: 1.sw,
                    child: Container(
                      margin: EdgeInsets.only(left: 8.w, right: 8.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 13.h),
                          CustomeText(
                            text: "Culte de Dimanche",
                            style: context.appTypographie.body.copyWith(
                              color: context.appColor.primaryWhite,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomeText(
                                text: "Morning Worship Service ",
                                style: context.appTypographie.small.copyWith(
                                  fontSize: 11.sp,
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 3.h,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(width: 3.w),
                              CustomeText(
                                text: "1.2k watching",
                                style: context.appTypographie.small.copyWith(
                                  fontSize: 11.sp,
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),

                          Container(
                            // width: 0.3.sw,
                            margin: EdgeInsets.only(top: 20.h),
                            padding: EdgeInsets.symmetric(
                              vertical: 7.h,
                              horizontal: 5.w,
                            ),
                            decoration: BoxDecoration(
                              color: context.appColor.primaryBlue,
                              borderRadius: BorderRadius.circular(7.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.play_circle_fill_rounded,
                                  color: context.appColor.primaryWhite,
                                ),
                                SizedBox(width: 20.w),
                                CustomeText(
                                  text: "Watch Live",
                                  style: context.appTypographie.body.copyWith(
                                    color: context.appColor.primaryWhite,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.all(15.r),
              decoration: BoxDecoration(
                color: context.appColor.primaryWhite,
                border: Border.all(color: context.appColor.primaryGray100),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      color: context.appColor.primaryLightBlue,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Icon(
                      Icons.people_sharp,
                      color: context.appColor.primaryBlue,
                    ),
                  ),
                  SizedBox(height: 9.h),

                  CustomeText(
                    text: 'My House Cell',
                    style: context.appTypographie.body.copyWith(
                      color: Colors.black,

                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  CustomeText(
                    text: 'My House Cell',
                    style: context.appTypographie.small,
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



                  // Positioned(
                  //   bottom: 10.h,
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       SizedBox(height: 26.h),
                        // CustomeText(
                        //   text: "Culte de Dimanche",
                        //   style: context.appTypographie.body.copyWith(
                        //     color: context.appColor.primaryWarning,
                        //     fontWeight: FontWeight.w600,
                        //   ),
                        // ),
                  //       SizedBox(height: 7.h),

                        // Row(
                        //   children: [
                        //     CustomeText(
                        //       text: "Morning Worship Service ",
                        //       style: context.appTypographie.small.copyWith(
                        //         fontSize: 11.sp,
                        //         color: Colors.grey,
                        //         fontWeight: FontWeight.w700,
                        //       ),
                        //     ),
                        //     Icon(
                        //       Icons.circle,
                        //       color: Colors.white,
                        //       size: 3.h,
                        //       fontWeight: FontWeight.w700,
                        //     ),
                        //     SizedBox(width: 3.w),
                        //     CustomeText(
                        //       text: "1.2k watching",
                        //       style: context.appTypographie.small.copyWith(
                        //         fontSize: 11.sp,
                        //         color: Colors.grey,
                        //         fontWeight: FontWeight.w700,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // PrimaryButton(
                        //   label: "Watch Live",
                        //   colorText: context.appColor.primaryBlue,
                        //   backgroundColor: context.appColor.primaryBlue,
                        //   icon: Icons.play_circle_rounded,
                        // ),
                  //     ],
                  //   ),
                  // ),
                
                