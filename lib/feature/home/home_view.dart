import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_church/feature/home/page/notification/widget/programme.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart' as tube;
import 'package:grace_church/core/bloc_state/bloc_state.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/custome_widget/navigate.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/feature/home/depatelement_view.dart';
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/feature/home/page/bloc/departement/eglise_maison/cellule_bloc.dart';
import 'package:grace_church/feature/home/page/bloc/get_profile/get_profile_bloc.dart';
import 'package:grace_church/feature/home/page/cellule/cellule_view.dart';

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
  
  final String qrCodeData = 'https://docs.google.com/forms/d/e/1FAIpQLSefCnQAipz_PngsajC0IXdsWNKf9_nkQQ8aNjI_BrcDkKCahg/viewform?pli=1&pli=1';





  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> quickActionRequestSectionItem = [
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
              // ------------------------------------
              // TV Programme
              // ------------------------------------
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

              // ------------------------------------
              // Actions rapides Menu
              // ------------------------------------
              BlocBuilder<GetProfileBloc, ApiState<ProfileResponse>>(
                builder: (context, profileState) {
                  return BlocBuilder<
                    CelluleBloc,
                    ApiState<List<CelluleResponse>>
                  >(
                    builder: (context, listCelluleState) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          quickActionRequestSectionItem.length,
                          (index) {
                            final items = quickActionRequestSectionItem[index];
                            return (items["value"] == "cellule" &&
                                        (profileState
                                            is SuccessState<
                                              ProfileResponse
                                            >)) ||
                                    (items["value"] == "departement" &&
                                        (profileState
                                            is SuccessState<ProfileResponse>))
                                ? Expanded(
                                    child: GestureDetector(
                                      onTap:
                                          listCelluleState
                                              is SuccessState<
                                                List<CelluleResponse>
                                              >
                                          ? () {
                                              final iscellule = listCelluleState
                                                  .data
                                                  .any((element) {
                                                    log(
                                                      "celluleId: ${element.celluleId}",
                                                    );
                                                    return element.celluleId
                                                        .trim()
                                                        .toLowerCase()
                                                        .contains(
                                                          profileState
                                                              .data
                                                              .celluleId
                                                              .trim()
                                                              .toLowerCase(),
                                                        );
                                                  });

                                              if (iscellule) {
                                                if (items["value"] ==
                                                    "cellule") {
                                                  Navigator.of(context).push(
                                                    fadeRoute(
                                                      CelluleView(
                                                        cellueId: (profileState)
                                                            .data
                                                            .celluleId,
                                                        profileState:
                                                            profileState,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                if (items["value"] ==
                                                    "departement") {
                                                  Navigator.of(context).push(
                                                    fadeRoute(
                                                      DepatelementView(),
                                                    ),
                                                  );
                                                }
                                              }
                                            }
                                          : null,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 6.w),
                                        padding: EdgeInsets.symmetric(
                                          vertical: 11.h,
                                          horizontal: 12.w,
                                        ),
                                        decoration: BoxDecoration(
                                          color: context.appColor.primaryWhite,
                                          border: Border.all(
                                            color:
                                                context.appColor.primaryGray100,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            9.r,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withValues(
                                                alpha: 0.1,
                                              ),
                                              offset: Offset(0, 1),
                                              blurRadius: 0.2,
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(12.r),
                                              decoration: BoxDecoration(
                                                color: context
                                                    .appColor
                                                    .primaryLightBlue,
                                                borderRadius:
                                                    BorderRadius.circular(6.r),
                                              ),
                                              child: Icon(
                                                items['icon'],
                                                color: context
                                                    .appColor
                                                    .primaryBlue,
                                              ),
                                            ),
                                            SizedBox(height: 9.h),
                                            CustomeText(
                                              text: items['title'],
                                              style: context.appTypographie.body
                                                  .copyWith(
                                                    fontSize: 13.5.sp,
                                                    color: Colors.black,
                                                    letterSpacing: 0.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            CustomeText(
                                              text: items['decription'],
                                              style: context
                                                  .appTypographie
                                                  .small
                                                  .copyWith(
                                                    fontSize: 10.5.sp,
                                                    letterSpacing: 0.sp,
                                                    color: context
                                                        .appColor
                                                        .primaryGray700,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        margin: EdgeInsets.only(right: 6.w),
                                        padding: EdgeInsets.symmetric(
                                          vertical: 11.h,
                                          horizontal: 12.w,
                                        ),
                                        decoration: BoxDecoration(
                                          color: context.appColor.primaryWhite,
                                          border: Border.all(
                                            color:
                                                context.appColor.primaryGray100,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            9.r,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withValues(
                                                alpha: 0.1,
                                              ),
                                              offset: Offset(0, 1),
                                              blurRadius: 0.2,
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(12.r),
                                              decoration: BoxDecoration(
                                                color: context
                                                    .appColor
                                                    .primaryLightBlue,
                                                borderRadius:
                                                    BorderRadius.circular(6.r),
                                              ),
                                              child: Icon(
                                                items['icon'],
                                                color: context
                                                    .appColor
                                                    .primaryBlue
                                                    .withValues(alpha: 0.2),
                                              ),
                                            ),
                                            SizedBox(height: 9.h),
                                            CustomeText(
                                              text: items['title'],
                                              style: context.appTypographie.body
                                                  .copyWith(
                                                    fontSize: 13.5.sp,
                                                    color: Colors.black
                                                        .withValues(alpha: 0.2),
                                                    letterSpacing: 0.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            CustomeText(
                                              text: items['decription'],
                                              style: context
                                                  .appTypographie
                                                  .small
                                                  .copyWith(
                                                    fontSize: 10.5.sp,
                                                    letterSpacing: 0.sp,
                                                    color: context
                                                        .appColor
                                                        .primaryGray700
                                                        .withValues(alpha: 0.2),
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                          },
                        ),
                      );
                    },
                  );
                },
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 0.03.sh),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: CustomeText(
                          text: 'Programmes à venir',
                          style: context.appTypographie.body.copyWith(
                            letterSpacing: 0.sp,
                            color: context.appColor.primaryGrayDark,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7.h),
                ],
              ),
              
              // ------------------------------------
              // Programmes à venir: Carousel Slider
              // -----------------------------------
              Container(
               padding: EdgeInsets.symmetric(vertical: 9.w),
                child: BannerSlider(),
              ),

                
              // ---------------------------
              // Meditation quotidienne
              // ---------------------------
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
                          Icons.water_drop_rounded,
                          color: context.appColor.primaryBlue,
                          size: 16.sp,
                        ),
                        SizedBox(width: 5.w),
                        CustomeText(
                          text: 'MANNE QUOTIDIENNE',
                          style: context.appTypographie.body.copyWith(
                            fontSize: 12.sp,
                            color: context.appColor.primaryBlue,
                            fontWeight: FontWeight.w800,
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
                          color: context.appColor.primaryGray500,
                          fontWeight: FontWeight.w600,
                          // fontStyle: FontStyle.italic,
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
                            // fontStyle: FontStyle.italic,
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
              SizedBox(height: 10.h),

              // ------------------------------------
              // Rejoindre notre communauté via QR Code
              // ------------------------------------
              Row(
                children: [
                  Flexible(
                    child: CustomeText(
                      text:
                          'Scannez le QR Code pour rejoindre notre communauté',
                      style: context.appTypographie.body.copyWith(
                        fontSize: 14.sp,
                        color: context.appColor.primaryGray500,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4.h),
                    padding: EdgeInsets.all(9.r),
                    decoration: BoxDecoration(
                      color:  context.appColor.primaryLightBlue.withValues(
                    alpha: 0.4,
                  ),
                      borderRadius: BorderRadius.circular(9.r),
                    ),
                    child: QrImageView(
                      data: qrCodeData,
                      version: QrVersions.auto,
                      size: 100.h,
                      eyeStyle: const QrEyeStyle(
                        eyeShape: QrEyeShape.square,
                        color: Color(0xFFFF7900),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



