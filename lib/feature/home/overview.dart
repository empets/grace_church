import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_church/core/constante/const.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/custome_widget/navigate.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/core/injection/injection_container.dart';
import 'package:grace_church/feature/authen/domaine/usercase/create_profile_usercase.dart';
import 'package:grace_church/feature/authen/page/bloc/create_compte/form_profile_bloc.dart';
import 'package:grace_church/feature/home/cellule_view.dart';
import 'package:grace_church/feature/home/menu_view.dart';
import 'package:grace_church/feature/home/notification_view.dart';
import 'package:grace_church/feature/home/profile_view.dart';
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

  // final List<Map<String, dynamic>> menuItems = [
  //   {"title": "Paramètres", "icon": Icons.home_filled, "route": "/home"},

  //   {"title": "Cellule", "icon": Icons.groups, "route": "/cellule"},
  //   {"title": "Annonces", "icon": Icons.campaign, "route": "/notifications"},
  //   {"title": "Profil", "icon": Icons.person, "route": "/profile"},
  //   {
  //     "title": "Département",
  //     "icon": Icons.apartment_rounded,
  //     "route": "/department",
  //   },
  // ];
  late int currentRouteIndex = 0;

  List<Widget> _getScreens() {
    return [
      HomeView(
        controller: _controller,
        quickActionSectionItem: quickActionSectionItem,
      ),
      CelluleView(),
      NotificationView(),
      ProfileView(),
      // DepartmentView(),
    ];
  }

  final List<MenuItem> menuItems = [
    MenuItem(icon: Icons.home, title: "Home", route: "/home"),
    MenuItem(
      icon: Icons.person,
      title: "Profile",
      route: "/profile",
      page: ProfileView(),
    ),
    MenuItem(
      icon: Icons.groups,
      title: "Cellule",
      route: "/cellule",
      page: CelluleView(),
    ),
    MenuItem(
      icon: Icons.campaign,
      title: "Notif",
      route: "/notifications",
      page: NotificationView(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      // appBar: AppBar(backgroundColor: Colors.grey.shade50),

      // drawer: MenuView(),
      body: IndexedStack(index: currentRouteIndex, children: _getScreens()),
      bottomNavigationBar: Container(
        height: 100.h,
        decoration: BoxDecoration(
          color: context.appColor.primaryWhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(menuItems.length, (index) {
              final item = menuItems[index];
              final isSelected = currentRouteIndex == index;

              return InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  final item = menuItems[index];

                  /// ✅ CAS 1 : Navigation externe (push)
                  if (item.route == "/profile") {
                    Navigator.of(context).push(
                      fadeRoute(
                        BlocProvider(
                          create: (_) => FormProfileBloc(
                            createProfileUsercase:
                                getIt<CreateProfileUsercase>(),
                          ),
                          child: item.page!,
                        ),
                      ),
                    );
                    return;
                  }

                  if (item.route == "/cellule") {
                    Navigator.of(context).push(fadeRoute(item.page!));
                    return;
                  }

                  if (item.route == "/notifications") {
                    Navigator.of(context).push(fadeRoute(item.page!));
                    return;
                  }

                  /// ✅ CAS 2 : Navigation tab (locale)
                  setState(() {
                    currentRouteIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? context.appColor.primaryBlue.withValues(alpha: 0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item.icon,
                        size: 24.sp,
                        color: isSelected
                            ? context.appColor.primaryBlue
                            : context.appColor.primaryGray500,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        item.title,
                        style: context.appTypographie.body.copyWith(
                          color: currentRouteIndex == index
                              ? context.appColor.primaryBlue
                              : context.appColor.primaryGray500,
                          fontSize: 11.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required tube.YoutubePlayerController controller,
    required this.quickActionSectionItem,
  }) : _controller = controller;

  final tube.YoutubePlayerController _controller;
  final List<Map<String, dynamic>> quickActionSectionItem;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 9.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Cardre
              Container(
                height: 0.23333333.sh,
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
                        text: 'Upcoming Programs',
                        style: context.appTypographie.body.copyWith(
                          letterSpacing: 0.sp,
                          color: context.appColor.primaryGrayDark,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      CustomeText(
                        text: 'View All',
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
                                  Positioned(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 4.w,
                                        vertical: 5.h,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        vertical: 4.w,
                                        horizontal: 7.w,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          6.r,
                                        ),
                                        color: context.appColor.primaryWhite,
                                      ),
                                      child: Column(
                                        children: [
                                          CustomeText(
                                            text: 'Jul',
                                            style: context.appTypographie.small
                                                .copyWith(
                                                  fontSize: 12.sp,
                                                  letterSpacing: 0.sp,
                                                  color: context
                                                      .appColor
                                                      .primaryBlue,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          CustomeText(
                                            text: '15',
                                            style: context.appTypographie.small
                                                .copyWith(
                                                  color: context
                                                      .appColor
                                                      .primaryGrayDark,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
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
                                      text: "Youth Conference 2024",
                                      style: context.appTypographie.small
                                          .copyWith(
                                            letterSpacing: 0.sp,
                                            color: context
                                                .appColor
                                                .primaryGrayDark,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    CustomeText(
                                      text: "Main Auditorium • 06:00 PM",
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
                text: 'Church Feed',
                style: context.appTypographie.body.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 8.h),
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  color: context.appColor.primaryLightBlue,
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
                          fontWeight: FontWeight.w900,
                        ),
                        SizedBox(width: 5.w),
                        CustomeText(
                          text: 'Church Feed',
                          style: context.appTypographie.body.copyWith(
                            fontSize: 14.sp,
                            color: context.appColor.primaryBlue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 15.h),
                    CustomeText(
                      text: 'Strength in Weakness',
                      style: context.appTypographie.subtitle.copyWith(
                        color: context.appColor.primaryGrayDark,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      child: CustomeText(
                        text:
                            "But he said to me, 'My grace is sufficient for you, for"
                            "my power is made perfect in weakness."
                            "- 2 Corinthians 12:9",
                        style: context.appTypographie.subtitle.copyWith(
                          fontSize: 13.sp,
                          color: context.appColor.primaryGrayDark,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
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
