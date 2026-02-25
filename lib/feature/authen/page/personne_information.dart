import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/custome_widget/form_filed.dart';
import 'package:grace_church/core/extension/custome_extension.dart';

class PersonneInformationScreen extends StatefulWidget {
  const PersonneInformationScreen({super.key});

  @override
  State<PersonneInformationScreen> createState() =>
      _PersonneInformationScreenState();
}

class _PersonneInformationScreenState extends State<PersonneInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            child: Column(
              children: [
                // SizedBox(height: .h),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.all(5.r),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: context.appColor.primaryLightBlue,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Image.network(
                            loadingBuilder: (context, child, loadingProgress) {
                              return child;
                            },
                            errorBuilder: (_, __, ___) => ClipOval(
                              child: Image.asset(
                                "yAssets.icons.profileAvatarPlaceholderLarge .path",
                                fit: BoxFit.contain,
                                height: 0.08.sh,
                                width: 0.08.sh,
                              ),
                            ),
                            "https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_640.png",

                            fit: BoxFit.cover,
                            height: 0.1.sh,
                            width: 0.1.sh,
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      right: 0.32.sw,
                      bottom: 5.w,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(top: 4.h),
                          padding: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            color: context.appColor.primaryLightBlue,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.edit, size: 10,),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 15.h),

                    CustomeText(
                      text: 'Mettre a jour vos information ',
                      style: context.appTypographie.body.copyWith(
                        color: context.appColor.primaryGray500,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomeText(
                      text: 'Etape 1: Identité personnel',
                      style: context.appTypographie.small.copyWith(
                        color: context.appColor.primaryBlue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 19.h),
                  ],
                ),

                ProductionFormCustomer(
                  inputLabel: 'Nom Comple',
                  textLabel: 'Ex: jean-Baptise Koffi',
                  errorText: null,
                  msgError: '',
                  prefixIcon: Icon(
                    Icons.person,
                    color: context.appColor.primaryGray500.withValues(
                      alpha: 0.6,
                    ),
                  ),
                ),

                SizedBox(height: 8.h),

                ProductionFormCustomer(
                  inputLabel: 'Date de naissace',
                  textLabel: 'JJ/MM/AAAA',
                  errorText: null,
                  msgError: '',
                  sufixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.date_range_rounded,
                      color: context.appColor.primaryBlue,
                    ),
                  ),
                ),

                SizedBox(height: 8.h),
                ProductionFormCustomer(
                  inputLabel: 'Quartier/District',
                  textLabel: 'Choisir votre zone',
                  errorText: null,
                  msgError: '',
                  sufixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.location_on_rounded,
                      color: context.appColor.primaryGray500.withValues(
                        alpha: 0.6,
                      ),
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 0.03.sh),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: CustomeText(
                          text: 'Prochaine étape',
                          style: context.appTypographie.subtitle.copyWith(
                            color: context.appColor.primaryGray500,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                FormNextTeps(
                  icons: Icons.badge_rounded,
                  title: 'Profile Socio-Professionnel ',
                  description: 'Statut, Emploi ou Etudes',
                  isNextForm: false,
                ),
                SizedBox(height: 9.h),
                FormNextTeps(
                  icons: Icons.badge_rounded,
                  title: 'Vie Spirituelle',
                  description: 'Baptême, Cellule de maison',
                  isNextForm: false,
                ),

                Container(
                  margin: EdgeInsets.only(top: 18.h),
                  child: PrimaryButton(
                    label: 'Continuer',
                    icon: Icons.arrow_forward_rounded,
                    backgroundColor: context.appColor.primaryBlue,
                    colorText: context.appColor.primaryWhite,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FormNextTeps extends StatelessWidget {
  const FormNextTeps({
    super.key,
    required this.icons,
    required this.title,
    required this.description,
    required this.isNextForm,
  });

  final IconData icons;
  final String title;
  final String description;
  final bool isNextForm;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 10.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: context.appColor.primaryGray500.withValues(alpha: 0.2),
        ),
        color: context.appColor.primaryWhite,
        borderRadius: BorderRadius.circular(7.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  color: context.appColor.primaryGray100,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icons,
                  color: isNextForm
                      ? context.appColor.primaryGray700.withValues(alpha: 0.5)
                      : context.appColor.primaryGray700.withValues(alpha: 0.1),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 14.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomeText(
                      text: title,
                      style: context.appTypographie.body.copyWith(
                        fontSize: 14.sp,
                        color: isNextForm
                            ? Colors.grey.shade700
                            : Colors.grey.shade200,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    CustomeText(
                      text: description,
                      style: context.appTypographie.small.copyWith(
                        fontSize: 12.sp,
                        color: isNextForm
                            ? Colors.grey.shade500
                            : Colors.grey.shade200,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Container(
            margin: EdgeInsets.only(top: 6.h),
            child: Icon(
              Icons.lock,
              color: isNextForm
                  ? context.appColor.primaryGray500.withValues(alpha: 0.5)
                  : context.appColor.primaryGray500.withValues(alpha: 0.1),
            ),
          ),
        ],
      ),
    );
  }
}
