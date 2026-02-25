import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/custome_widget/form_filed.dart';
import 'package:grace_church/core/extension/custome_extension.dart';

class FormEngagement extends StatefulWidget {
  const FormEngagement({super.key});

  @override
  State<FormEngagement> createState() => _FormEngagementState();
}

class _FormEngagementState extends State<FormEngagement> {
  late bool isSignUp = false;
  late bool isChecked = false;

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
                          text: 'Engagement ',
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
                        text: 'Etape 4 sur 4',
                        style: context.appTypographie.small.copyWith(
                          color: context.appColor.primaryBlue,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      CustomeText(
                        text: '100% Complété',
                        style: context.appTypographie.small.copyWith(
                          fontSize: 12.sp,
                          color: context.appColor.primaryGray500,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 4.h, bottom: 18.h),
                  child: FAProgressBar(
                    size: 6.h,
                    currentValue: 100,
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

                CustomeText(
                  text: 'Rejoindre un département',
                  style: context.appTypographie.subtitle.copyWith(
                    fontSize: 18.h,
                    color: context.appColor.primaryGrayDark,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                CustomeText(
                  text:
                      "Aidez-nous à mieux vous connaître pour vous intégrer dans la vide de l'église",
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
                    Container(
                      margin: EdgeInsets.only(bottom: 8.h),
                      child: Row(
                        children: [
                          Icon(
                            Icons.groups_outlined,
                            color: context.appColor.primaryBlue,
                          ),
                          SizedBox(width: 10.w),
                          Flexible(
                            child: CustomeText(
                              text:
                                  "Dans quel département souhaiteriez-vous servir ?",
                              style: context.appTypographie.small.copyWith(
                                fontSize: 14.sp,
                                color: context.appColor.primaryGray700,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 1.h),
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
                            "Choisir un département",
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

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 19.h),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.auto_awesome_outlined,
                            color: context.appColor.primaryBlue,
                          ),
                          SizedBox(width: 10.w),
                          Flexible(
                            child: CustomeText(
                              text: "Talents et compétences spécifiques",
                              style: context.appTypographie.small.copyWith(
                                fontSize: 14.sp,
                                color: context.appColor.primaryGray700,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ProductionFormCustomer(
                      inputLabel: '',
                      inputLabelSize: 4.sp,
                      isColorBlue: true,
                      textLabel: 'Ex: Graphisme, Télécomunication, Cuisine...',
                      errorText: null,
                      msgError: '',
                      maxLines: 3,
                      minLines: 2,
                    ),
                  ],
                ),

                Container(
                  margin: EdgeInsets.only(top: 20.h, bottom: 8.h),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        color: context.appColor.primaryBlue,
                      ),
                      SizedBox(width: 6.w),
                      CustomeText(
                        text: "Vos disponibilités",
                        style: context.appTypographie.small.copyWith(
                          fontSize: 14.sp,
                          color: context.appColor.primaryGray700,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSelectableTile(
                      title: "Dimanche matin (Culte)",
                      isChecked: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value;
                        });
                      },
                    ),

                    CustomSelectableTile(
                      title: "Samedi (Activités/Répétitions)",
                      isChecked: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value;
                        });
                      },
                    ),

                    CustomSelectableTile(
                      title: "Soirées en semaine",
                      isChecked: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value;
                        });
                      },
                    ),
                  ],
                ),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.h),
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
                          "En cliquant sur Terminer, vous confirmez vouloir vous"
                          "engager dans la vie de la communauté. Un responsable de"
                          "département vous contactera prochainement.",
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

                PrimaryButton(
                  label: 'Terminer',
                  backgroundColor: context.appColor.primaryBlue,
                  colorText: context.appColor.primaryWhite,
                  onPressed: () {},
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
