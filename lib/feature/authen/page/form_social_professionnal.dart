import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/custome_widget/navigate.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/feature/authen/page/form_holly_living.dart';

class FormSocialProfessionnal extends StatefulWidget {
  const FormSocialProfessionnal({super.key});

  @override
  State<FormSocialProfessionnal> createState() =>
      _FormSocialProfessionnalState();
}

class _FormSocialProfessionnalState extends State<FormSocialProfessionnal> {
  late bool isSignUp = false;

  late String selectedOptions = "";
  String? selectedOption;

  final List<Map<String, dynamic>> items = [
    {
      'title': 'Actif Service de restauration',
      'subtitle': 'Service haut débit avec installation rapide',
      'value': 'oui',
    },
    {
      'title': 'Service de restauration non actif',
      'subtitle': 'Support disponible 24h/24 et 7j/7',
      'value': 'non',
    },
  ];

  late String selectedOptionss = "";
  String? selectedOptionsss;

  final List<Map<String, dynamic>> itemss = [
    {
      'title': 'Résidence neblé',
      'subtitle': 'Service haut débit avec installation rapide',
      'value': 'Hôtel',
    },
    {
      'title': 'Hôtel',
      'subtitle': 'Support disponible 24h/24 et 7j/7',
      'value': 'Résidence',
    },
  ];

  String? selectedValue;

  final List<Map<String, String>> options = List.generate(
    500, // 500 valeurs
    (index) {
      final int value = (index + 1) * 1000;
      return {
        "id": value.toString(),
        "label":
            "${value.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]} ')} FCFA",
      };
    },
  );

  String? selectedValues;

  final List<Map<String, String>> optionss = List.generate(
    500, // 500 valeurs
    (index) {
      final int value = (index + 1) * 1000;
      return {
        "id": value.toString(),
        "label":
            "${value.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]} ')} FCFA",
      };
    },
  );

  late bool isSelectedHotel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: .h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 4.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                              right: 10.w,
                              top: 4.h,
                              bottom: 5.h,
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              color: context.appColor.primaryGrayDark,
                            ),
                          ),
                        ),
                        CustomeText(
                          text: 'Inscription Member ',
                          style: context.appTypographie.subtitle.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(width: 0),
                      ],
                    ),

                    SizedBox(height: 30.h),
                  ],
                ),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomeText(
                        text: 'Profile Socio-professionnel',
                        style: context.appTypographie.body.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      CustomeText(
                        text: 'Etape 2 sur 4',
                        style: context.appTypographie.small.copyWith(
                          color: context.appColor.primaryGray500,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 8.h, bottom: 26.h),
                  child: FAProgressBar(
                    size: 6.h,
                    currentValue: 45,
                    displayTextStyle: context.appTypographie.small.copyWith(
                      fontSize: 0.h,
                    ),
                    displayText: '%',
                    progressColor: context.appColor.primaryBlue,
                    backgroundColor: context.appColor.primaryLightBlue,
                  ),
                ),

                CustomeText(
                  text: 'Information professionnelles',
                  style: context.appTypographie.subtitle.copyWith(
                    fontSize: 18.h,
                    color: context.appColor.primaryGrayDark,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                CustomeText(
                  text:
                      'Aidez-nous à mieux vous connaître pour mieux vous accompagner',
                  style: context.appTypographie.small.copyWith(
                    fontSize: 12.sp,
                    color: context.appColor.primaryGray500,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 0.01.sh),
                Container(
                  margin: EdgeInsets.only(top: 14.h),
                  child: CustomeText(
                    text: 'Statut actuel',
                    style: context.appTypographie.small.copyWith(
                      color: context.appColor.primaryGray500,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 7.h),
                  padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
                  decoration: BoxDecoration(
                    color: context.appColor.primaryLightBlue,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isSignUp = false;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                vertical: 11.h,
                                horizontal: 9.w,
                              ),
                              decoration: BoxDecoration(
                                color: !isSignUp
                                    ? context.appColor.primaryBlue
                                    : context.appColor.primaryWhite,
                                borderRadius: BorderRadius.circular(7.r),
                              ),
                              child: Text(
                                "Etudiant(e)",
                                style: context.appTypographie.small.copyWith(
                                  color: !isSignUp
                                      ? context.appColor.primaryWhite
                                      : context.appColor.primaryGrayDark,
                                  fontSize: 12.4.sp,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: isSignUp
                                ? [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 15,
                                      spreadRadius: 2,
                                      offset: const Offset(0, 8),
                                    ),
                                  ]
                                : null,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isSignUp = true;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                vertical: 11.h,
                                horizontal: 9.w,
                              ),
                              decoration: BoxDecoration(
                                color: isSignUp
                                    ? context.appColor.primaryBlue
                                    : context.appColor.primaryWhite,
                                borderRadius: BorderRadius.circular(7.r),
                              ),
                              child: Text(
                                "Travailleur",
                                style: context.appTypographie.small.copyWith(
                                  color: isSignUp
                                      ? context.appColor.primaryWhite
                                      : context.appColor.primaryGrayDark,
                                  fontSize: 12.4.sp,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 0.03.sh),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Profession / Domaine d'activité",
                      style: context.appTypographie.small.copyWith(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 4.h),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: context.appColor.primaryLightBlue,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          dropdownColor: context.appColor.primaryWhite,
                          hint: Text(
                            "Sélectionnez un domaine",
                            style: GoogleFonts.roboto(
                              color: Colors.grey,
                              fontSize: 14.sp,
                            ),
                          ),
                          value: selectedValues,
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 14.sp,
                          ),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: optionss
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item["id"],
                                  child: Text(item["label"]!),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedValues = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 9.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Niveau d'études",
                      style: context.appTypographie.small.copyWith(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 4.h),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: context.appColor.primaryLightBlue,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          dropdownColor: context.appColor.primaryWhite,
                          hint: Text(
                            "Votre niveau actuel",
                            style: GoogleFonts.roboto(
                              color: Colors.grey,
                              fontSize: 14.sp,
                            ),
                          ),
                          value: selectedValues,
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 14.sp,
                          ),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: optionss
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item["id"],
                                  child: Text(item["label"]!),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedValues = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  margin: EdgeInsets.only(top: 30.h),
                  child: PrimaryButton(
                    label: 'Continuer',
                    icon: Icons.arrow_forward_rounded,
                    backgroundColor: context.appColor.primaryBlue,
                    colorText: context.appColor.primaryWhite,
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).push(fadeRoute(const FormHollyLiving()));
                    },
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
