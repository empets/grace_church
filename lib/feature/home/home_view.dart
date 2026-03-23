import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart' as tube;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late tube.YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    final videoId = tube.YoutubePlayer.convertUrlToId(
      "https://www.youtube.com/watch?v=AlHpQ-8i3g8",
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
    final List<Map<String, dynamic>> quickActionSectionItem = [
      {
        'icon': Icons.groups_rounded,
        'title': 'Ma cellule de Maison',
        'decription': 'Vie chrétienne',
        'value': 'cellule',
      },

      {
        'icon': Icons.volunteer_activism_rounded,
        'title': 'Mon département',
        'decription': 'Evangelisation',
        'value': 'departement',
      },
    ];
    return SafeArea(
      top: false,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 9.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Cardre
              Container(
                height: 0.23333333.sh,
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 19.h),
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
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
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(quickActionSectionItem.length, (index) {
                  final items = quickActionSectionItem[index];
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (items["value"] == "cellule") {
                          // Navigator.of(context).push(fadeRoute(CelluleView()));
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 6.w),
                        padding: EdgeInsets.symmetric(
                          vertical: 11.h,
                          horizontal: 12.w,
                        ),

                        decoration: BoxDecoration(
                          color: context.appColor.primaryWhite,
                          border: Border.all(
                            color: context.appColor.primaryGray100,
                          ),
                          borderRadius: BorderRadius.circular(9.r),
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
                                fontSize: 13.5.sp,
                                color: Colors.black,
                                letterSpacing: 0.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            CustomeText(
                              text: items['decription'],
                              style: context.appTypographie.small.copyWith(
                                fontSize: 10.5.sp,
                                letterSpacing: 0.sp,
                                color: context.appColor.primaryGray700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 0.03.sh),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomeText(
                        text: 'Programmes à venir',
                        style: context.appTypographie.body.copyWith(
                          letterSpacing: 0.sp,
                          color: context.appColor.primaryGrayDark,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      CustomeText(
                        text: 'Voir tout',
                        style: context.appTypographie.small.copyWith(
                          fontSize: 12.sp,
                          letterSpacing: 0.sp,
                          color: context.appColor.primaryBlue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7.h),

                  SizedBox(
                    height: 0.25.sh,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 14.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.r),
                                    child: Image.network(
                                      "https://cdn.stayhappening.com/events2/banners/f8bfa63a35c18bdd8165b9f4ec448673090b460d55b4560b3aac9f91d312a58b-rimg-w526-h369-gmir.jpg?v=1610794864",
                                      height: 0.17.sh,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 6.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomeText(
                                      text: "Conference de la jeunesse 2024",
                                      style: context.appTypographie.small
                                          .copyWith(
                                            fontSize: 12.sp,
                                            letterSpacing: 0.sp,
                                            color: context
                                                .appColor
                                                .primaryGrayDark,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    CustomeText(
                                      text: "Samedi 12 Octobre a 06:00 PM",
                                      style: context.appTypographie.small
                                          .copyWith(
                                            fontSize: 11.sp,
                                            letterSpacing: 0.sp,
                                            color:
                                                context.appColor.primaryGray500,
                                            fontWeight: FontWeight.w600,
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
                  ),
                ],
              ),

              CustomeText(
                text: 'File de l\'Église',
                style: context.appTypographie.body.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 8.h),
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  color: context.appColor.primaryLightBlue.withValues(
                    alpha: 0.4,
                  ),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.menu_book_rounded,
                          color: context.appColor.primaryBlue,
                          size: 16.sp,
                        ),
                        SizedBox(width: 5.w),
                        CustomeText(
                          text: 'MANNE QUOTIDIENNE',
                          style: context.appTypographie.body.copyWith(
                            fontSize: 12.sp,
                            color: context.appColor.primaryBlue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 15.h),
                    CustomeText(
                      text: 'La force de la grâce divine',
                      style: context.appTypographie.subtitle.copyWith(
                        color: context.appColor.primaryGrayDark,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      child: CustomeText(
                        text:
                            "Ma grâce te suffit, car ma puissance s’accomplit dans la faiblesse."
                            " (reference : 2 Corinthiens 12:9)",
                        style: context.appTypographie.subtitle.copyWith(
                          fontSize: 13.sp,
                          color: context.appColor.primaryGrayDark,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        CustomeText(
                          text: 'Lire la manne quotidienne',
                          style: context.appTypographie.body.copyWith(
                            fontSize: 12.sp,
                            color: context.appColor.primaryBlue,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: context.appColor.primaryBlue,
                          size: 10.sp,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
