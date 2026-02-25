import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/feature/authen/page/personne_information.dart';
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

  final List<Map<String, dynamic>> quickActionSectionItem = [
    {
      'icon': Icons.groups_rounded,
      'title': 'My House Cell',
      'decription': 'The Grace Center',
    },

    {
      'icon': Icons.volunteer_activism_rounded,
      'title': 'My Department',
      'decription': 'Worship Team',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PersonneInformationScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(1.r),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: context.appColor.primaryBlue,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Image.network(
                            "https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_640.png",
                            height: 0.07.sh,
                          ),
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(quickActionSectionItem.length, (index) {
                final items = quickActionSectionItem[index];
                return Container(
                  padding: EdgeInsets.all(15.r),

                  decoration: BoxDecoration(
                    color: context.appColor.primaryWhite,
                    border: Border.all(color: context.appColor.primaryGray100),
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        offset: Offset(0, 1),
                        blurRadius: 0.2,
                      ),
                    ],
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
                          items['icon'],
                          color: context.appColor.primaryBlue,
                        ),
                      ),
                      SizedBox(height: 9.h),

                      CustomeText(
                        text: items['title'],
                        style: context.appTypographie.body.copyWith(
                          color: Colors.black,

                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      CustomeText(
                        text: items['decription'],
                        style: context.appTypographie.small.copyWith(
                          color: context.appColor.primaryGray500,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),

            Column(
              children: [
                SizedBox(height: 0.03.sh),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomeText(
                      text: 'Upcoming Programs',
                      style: context.appTypographie.subtitle.copyWith(
                        color: context.appColor.primaryGrayDark,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomeText(
                      text: 'View All',
                      style: context.appTypographie.small.copyWith(
                        color: context.appColor.primaryBlue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.r),
                  child: Image.network(
                    "https://media.istockphoto.com/id/2094337676/photo/diverse-team-working-together-in-modern-co-working-space.jpg?s=612x612&w=is&k=20&c=8Yn-zi9320e0INMImBvZgTlv-hKzSRLl5RD9N_E45Jw=",
                    height: 0.2.sh,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
