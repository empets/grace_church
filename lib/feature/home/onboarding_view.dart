import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/custome_widget/navigate.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/feature/home/overview.dart';
import 'package:grace_church/gen/assets.gen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();
  late int currentIndex = 0;
  late bool isSignUp = false;
  final FocusNode _focusNode = FocusNode();

  List<Map<String, dynamic>> onboardingItem = [
    {
      'image': assets.images.o1.path,
      'title': 'Bienvenue dans la Famille Grace',
      'description':
          'Restez connecté avec votre communauté, rejoignez des groupes de maison et grandissez ensemble dans votre marche de foi.',
    },
    {
      'image': assets.images.o2.path,
      'title': 'Grandissez dans votre foi',
      'description':
          'Accédez à des enseignements bibliques, suivez votre parcours de baptême et restez fortifié chaque jour.',
    },
    {
      'image': assets.images.a03.path,
      'title': 'Engagez-vous dans la communauté',
      'description':
          'Rejoignez une cellule de maison, servez dans un département et vivez la communion fraternelle.',
    },
  ];

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColor.primaryWhite,
      body: ListView.builder(
        itemCount: onboardingItem.length,
        controller: controller,
        scrollDirection: Axis.horizontal, // 🔥 horizontal
        physics: const PageScrollPhysics(), // 🔥 effet page
        itemBuilder: (context, index) {
          return SizedBox(
            width: MediaQuery.of(context).size.width, // 🔥 largeur écran
            height: 0.4.sh,

            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      onboardingItem[index]['image'],
                      fit: BoxFit.cover,
                      height: 0.6.sh,
                      filterQuality: FilterQuality.high,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                  child: CustomeText(
                    text: onboardingItem[index]['title'],
                    style: context.appTypographie.h2.copyWith(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),

                SizedBox(height: 15.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: CustomeText(
                    text: onboardingItem[index]['description'],
                    style: context.appTypographie.h2.copyWith(
                      color: context.appColor.primaryGray500,
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp,
                      letterSpacing: 0.2.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 0.16.sh,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: SmoothPageIndicator(
                controller: controller,
                count: onboardingItem.length,
                effect: ColorTransitionEffect(
                  dotColor: context.appColor.primaryBlue,
                  activeDotColor: context.appColor.primaryLightBlue,
                  dotHeight: 4.h,
                ),
              ),
            ),
            SizedBox(height: 26.h),
            PrimaryButton(
              label: "Commencer",
              backgroundColor: context.appColor.primaryBlue,
              colorText: context.appColor.primaryWhite,
              icon: Icons.arrow_forward,
              onPressed: () async{
                final shared = await SharedPreferences.getInstance();
            await shared.setString('isAppLauncher', 'isAppLauncher');
                Navigator.of(context).push(fadeRoute(const OverviewScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
