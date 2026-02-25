import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/custome_widget/form_filed.dart';
import 'package:grace_church/core/custome_widget/navigate.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/feature/authen/page/form_engagement.dart';

class FormHollyLiving extends StatefulWidget {
  const FormHollyLiving({super.key});

  @override
  State<FormHollyLiving> createState() => _FormHollyLivingState();
}

class _FormHollyLivingState extends State<FormHollyLiving> {
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
                        text: 'Etape 3 sur 4',
                        style: context.appTypographie.small.copyWith(
                          color: context.appColor.primaryBlue,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ),

                      CustomeText(
                        text: '75% Complété',
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
                  margin: EdgeInsets.only(top: 4.h, bottom: 18.h),
                  child: FAProgressBar(
                    size: 6.h,
                    currentValue: 70,
                    displayTextStyle: context.appTypographie.small.copyWith(
                      fontSize: 0.h,
                    ),
                    displayText: '%',
                    progressColor: context.appColor.primaryBlue,
                    backgroundColor: context.appColor.primaryLightBlue,
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 19.h),
                  child: Divider(
                    height: 2.h,
                    color: context.appColor.primaryLightBlue,
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 9.h),
                  padding: EdgeInsets.all(9.r),
                  decoration: BoxDecoration(
                    color: context.appColor.primaryLightBlue,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.auto_awesome,
                    color: context.appColor.primaryBlue,
                  ),
                ),

                CustomeText(
                  text: 'Vie Spirituelle',
                  style: context.appTypographie.subtitle.copyWith(
                    fontSize: 18.h,
                    color: context.appColor.primaryGrayDark,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                CustomeText(
                  text:
                      'Veuillez renseigner vos informations spirituelles pour finaliser votre profil de membre.',
                  style: context.appTypographie.small.copyWith(
                    fontSize: 12.sp,
                    color: context.appColor.primaryGray500,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 0.04.sh),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Statut Spirituel",
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
                            "Choisir un statut",
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
                    Row(
                      children: [
                        Text(
                          "Date de Baptême",
                          style: context.appTypographie.small.copyWith(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          "(Si applicable)",
                          style: context.appTypographie.small.copyWith(
                            fontSize: 11.sp,
                            color: context.appColor.primaryGray500.withValues(
                              alpha: 0.3,
                            ),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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
                          icon: const Icon(Icons.calendar_month_rounded),
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
                      "Cellule de Maison assignée",
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
                            "Sélectionnze unz cellule",
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
                    Text(
                      "Cellule de Maison de mainson est votre groupe de proximité hebdomadaire",
                      style: context.appTypographie.small.copyWith(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 11.sp,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                ProductionFormCustomer(
                  inputLabel: 'Mentor Spirituel / Pasteur',
                  textLabel: 'Nom de votre mentor ou pasteur',
                  errorText: null,
                  msgError: '',
                  isColorBlue: true,
                  prefixIcon: Icon(
                    Icons.person,
                    color: context.appColor.primaryGray500.withValues(
                      alpha: 0.6,
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 25.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    border: BoxBorder.all(
                      color: context.appColor.primaryBlue.withValues(
                        alpha: 0.1,
                      ),
                    ),
                    color: context.appColor.primaryLightBlue,
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: context.appColor.primaryBlue,
                      ),
                      SizedBox(width: 8.w),
                      Flexible(
                        child: Text(
                          "Ces informations nous aident à mieux vous "
                          "accompagner dans votre croissance spirituelle"
                          "et à vous intégrer dans la vie de l'église.",
                          style: context.appTypographie.small.copyWith(
                            fontSize: 11.sp,
                            color: context.appColor.primaryGray500.withValues(
                              alpha: 0.8,
                            ),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 11.h),
                  child: PrimaryButton(
                    label: 'Continuer',
                    icon: Icons.arrow_forward_rounded,
                    backgroundColor: context.appColor.primaryBlue,
                    colorText: context.appColor.primaryWhite,
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).push(fadeRoute(const FormEngagement()));
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
