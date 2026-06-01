import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grace_church/core/custome_widget/navigate.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/gen/assets.gen.dart';

class NotificationPopeView extends StatelessWidget {
  const NotificationPopeView({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: InteractiveViewer(
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
                height: 0.3.sh,
                errorBuilder:
                    (context, error, stackTrace) {
                  return Container(
                    height: 300,
                    color: Colors.white,
                    child: const Center(
                      child: Icon(Icons.broken_image),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
    
        /// CLOSE BUTTON
        Positioned(
          top: -3,
          right: 2,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
    
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child:  Icon(
                Icons.close,
                size: 12.h,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class SHowProgrammeAnnonce extends StatelessWidget {
  const SHowProgrammeAnnonce({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: SvgPicture.asset(
            assets.images.arrowBack.path,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'event_',
            child: Center(child: Image.network(imageUrl, height: 0.3.sh)),
          ),
        ],
      ),
    );
  }
}

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  int _currentIndex = 0;

  final List<String> images = [
    "https://cdn.stayhappening.com/events2/banners/f8bfa63a35c18bdd8165b9f4ec448673090b460d55b4560b3aac9f91d312a58b-rimg-w526-h369-gmir.jpg?v=1610794864",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbza2uAxjP92B2ehlPU1I9ILQesquQZh4hHRLXqXa-8MyDNY5vexvHo9to&s=10",
    "https://i.ytimg.com/vi/GZPveWRXNF8/maxresdefault.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg_1fHVQkEzzBU60S1y4QC9zn1jWckQPvXIiragkBFzg1n2lJQf8xeMTY&s=10"
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        /// ───────────── CAROUSEL ─────────────
        CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder: (context, index, realIndex) {
            final image = images[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  fadeRoute(
                    SHowProgrammeAnnonce(
                      imageUrl: image,
                    ),
                  ),
                );
              },
              child: Hero(
                tag: "event_",
                child: Container(
                  // margin: EdgeInsets.symmetric(horizontal: 8.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.network(
                      image,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          },

          options: CarouselOptions(
            height: 170.h,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayAnimationDuration:
                const Duration(milliseconds: 800),
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),

        /// ───────────── INDICATOR ─────────────
        Positioned(
          bottom: 10.h,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 6.h,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.25),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              children: List.generate(
                images.length,
                (index) {
                  final isActive = index == _currentIndex;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    height: 3.h,
                    width: isActive ? 22.w : 8.w,
                    decoration: BoxDecoration(
                      color:
                          isActive ? context.appColor.primaryLightBlue : Colors.white54,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        
      ],
    );
  }
}
   