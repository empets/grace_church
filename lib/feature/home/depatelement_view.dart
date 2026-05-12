import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/gen/assets.gen.dart';

class DepatelementView extends StatefulWidget {
  const DepatelementView({super.key});

  @override
  State<DepatelementView> createState() => _DepatelementViewState();
}

class _DepatelementViewState extends State<DepatelementView> {
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
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: SvgPicture.asset(assets.images.problemeRequest.path),
            ),
            SizedBox(height: 28.h),

            Text(
              "En cours de développement",
              style: context.appTypographie.body.copyWith(
                color: context.appColor.primaryBlue,
              ),
            ),
            SizedBox(height: 14.h),
          
          ],
        ),
      ),
    );
  }
}
