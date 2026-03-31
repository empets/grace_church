import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/custome_widget/form_filed.dart';
import 'package:grace_church/core/extension/custome_extension.dart';

class EditingCelluleRaport extends StatefulWidget {
  const EditingCelluleRaport({super.key});

  @override
  State<EditingCelluleRaport> createState() => _EditingCelluleRaportState();
}

class _EditingCelluleRaportState extends State<EditingCelluleRaport> {
  Future<void> _openCalendar() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      //  initialDate: DateTime(2012),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(), // pas de futur
      selectableDayPredicate: (day) {
        final now = DateTime.now();

        // 🔥 âge minimum 14 ans
        final maxDate = DateTime(now.year - 14, now.month, now.day);

        if (day.isBefore(maxDate)) {
          return false;
        }

        return true;
      },

      /// 🎨 Custom Theme
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue, // 🔵 header + selected date
              onPrimary: Colors.white, // texte sur header
              onSurface: Colors.black, // texte normal
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue, // boutons OK / CANCEL
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      // setState(() {
      //   selectedDate = picked;
      //   textEditingControllerDateNaissance.text = selectedDate
      //       .toString()
      //       .substring(0, 10);
      // });
      // context.read<FormProfileBloc>().add(
      //   EventCreateCompteProfile.changeDateNaissance(selectedDate.toString()),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Container(
        margin: EdgeInsets.only(top: 28.h, bottom: 0.06.sh),
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20.h),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            vertical: 9.h,
                            horizontal: 16.w,
                          ),
                          decoration: BoxDecoration(
                            color: context.appColor.primaryBlue,
                            borderRadius: BorderRadius.circular(7.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomeText(
                                text: "SESSION EN COURS",
                                style: context.appTypographie.h2.copyWith(
                                  fontSize: 15.sp,
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w300,
                                  height: 1.6.h,
                                ),
                              ),
                              CustomeText(
                                text: "Rapport Hebdomadaire Ouvrier",
                                style: context.appTypographie.h2.copyWith(
                                  fontSize: 16.sp,
                                  color: context.appColor.primaryWhite,
                                  height: 1.2.h,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Container(
                                width: 0.6.sw,
                                margin: EdgeInsets.symmetric(vertical: 5.h),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 4.w,
                                  vertical: 2.h,
                                ),
                                decoration: BoxDecoration(
                                  color: context.appColor.primaryWhite
                                      .withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month,
                                      color: context.appColor.primaryWhite,
                                    ),
                                    SizedBox(width: 8.w),
                                    CustomeText(
                                      text: "Semaine du: 12 - 18 Mai 2024",
                                      style: context.appTypographie.h2.copyWith(
                                        fontSize: 12.sp,
                                        color: context.appColor.primaryWhite
                                            .withValues(alpha: 0.9),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: -19.h,
                          right: -26.w,
                          child: Transform.rotate(
                            angle: 0.3,
                            child: Icon(
                              Icons.assignment,
                              color: context.appColor.primaryWhite.withValues(
                                alpha: 0.2,
                              ),
                              size: 100.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),

              Row(
                children: [
                  Icon(
                    Icons.account_balance,
                    color: context.appColor.primaryDarkBlue,
                  ),
                  SizedBox(width: 8.w),
                  CustomeText(
                    text: "Administration",
                    style: context.appTypographie.body.copyWith(
                      fontSize: 13.sp,
                      color: context.appColor.primaryGrayDark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Zone",
                        style: context.appTypographie.small.copyWith(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 3.w),
                    ],
                  ),
                  ProductionFormCustomer(
                    readOnly: true,
                    inputLabelSize: 0.sp,
                    isColorBlue: false,

                    inputLabel: '',
                    textLabel: "Cliquer sur l'icon juste à droite ",
                    errorText: null,
                    msgError: 'Veuillez renseigner ce champ',
                    sufixIcon: Container(
                      margin: EdgeInsets.only(right: 3.w),
                      decoration: BoxDecoration(
                        color: context.appColor.primaryLightBlue,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: IconButton(
                        onPressed:
                            // state.status.isInProgress ||
                            //     state.statusSpirituel.value
                            //             .toLowerCase() !=
                            //         "baptiser"
                            // ? null
                            // :
                            () {
                              // if (state.statusSpirituel.value
                              //         .toLowerCase() ==
                              //     "baptiser") {
                              //   _openCalendar();
                              // }
                            },
                        icon: Icon(
                          Icons.arrow_drop_down,
                          // state.statusSpirituel.value.toLowerCase() ==
                          //         "baptiser"
                          //     ? Icons.calendar_month_sharp
                          //     : Icons.lock,
                          color: context.appColor.primaryBlue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 9.h),
                ],
              ),

              // SizedBox(height: 12.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Secteur",
                        style: context.appTypographie.small.copyWith(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 3.w),
                    ],
                  ),
                  ProductionFormCustomer(
                    readOnly: true,
                    inputLabelSize: 0.sp,
                    isColorBlue: false,

                    inputLabel: '',
                    textLabel: "Cliquer sur l'icon juste à droite ",
                    errorText: null,
                    msgError: 'Veuillez renseigner ce champ',
                    sufixIcon: Container(
                      margin: EdgeInsets.only(right: 3.w),
                      decoration: BoxDecoration(
                        color: context.appColor.primaryLightBlue,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: IconButton(
                        onPressed:
                            // state.status.isInProgress ||
                            //     state.statusSpirituel.value
                            //             .toLowerCase() !=
                            //         "baptiser"
                            // ? null
                            // :
                            () {
                              // if (state.statusSpirituel.value
                              //         .toLowerCase() ==
                              //     "baptiser") {
                              //   _openCalendar();
                              // }
                            },
                        icon: Icon(
                          Icons.arrow_drop_down,
                          // state.statusSpirituel.value.toLowerCase() ==
                          //         "baptiser"
                          //     ? Icons.calendar_month_sharp
                          //     : Icons.lock,
                          color: context.appColor.primaryBlue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 9.h),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Eglise de maison",
                        style: context.appTypographie.small.copyWith(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 3.w),
                    ],
                  ),
                  ProductionFormCustomer(
                    readOnly: true,
                    inputLabelSize: 0.sp,
                    isColorBlue: false,

                    inputLabel: '',
                    textLabel: "Cliquer sur l'icon juste à droite ",
                    errorText: null,
                    msgError: 'Veuillez renseigner ce champ',
                    sufixIcon: Container(
                      margin: EdgeInsets.only(right: 3.w),
                      decoration: BoxDecoration(
                        color: context.appColor.primaryLightBlue,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: IconButton(
                        onPressed:
                            // state.status.isInProgress ||
                            //     state.statusSpirituel.value
                            //             .toLowerCase() !=
                            //         "baptiser"
                            // ? null
                            // :
                            () {
                              // if (state.statusSpirituel.value
                              //         .toLowerCase() ==
                              //     "baptiser") {
                              //   _openCalendar();
                              // }
                            },
                        icon: Icon(
                          Icons.arrow_drop_down,
                          // state.statusSpirituel.value.toLowerCase() ==
                          //         "baptiser"
                          //     ? Icons.calendar_month_sharp
                          //     : Icons.lock,
                          color: context.appColor.primaryBlue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 9.h),
                ],
              ),

              ProductionFormCustomer(
                isColorBlue: false,
                // state.dateNaissance.isValid
                //     ? true
                //     : false,
                readOnly: true,
                // controller:
                // textEditingControllerDateNaissance,
                inputLabel: 'Selctionner une date',
                textLabel: "Cliquer sur l'icon juste à droite ",
                errorText: null,
                // state.dateNaissance.isPure ||
                //     state.dateNaissance.isValid
                // ? null
                // : '',
                msgError: 'Veuillez renseigner ce champ',
                sufixIcon: Container(
                  margin: EdgeInsets.only(right: 3.w),
                  decoration: BoxDecoration(
                    color: context.appColor.primaryLightBlue,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: IconButton(
                    onPressed: _openCalendar,
                    icon: Icon(
                      Icons.calendar_month_sharp,
                      color: context.appColor.primaryBlue,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.h),

              ProductionFormCustomer(
                isColorBlue: false,
                // state.dateNaissance.isValid
                //     ? true
                //     : false,
                readOnly: false,
                // controller:
                // textEditingControllerDateNaissance,
                inputLabel: 'Offrande',
                textLabel: "Cliquer sur l'icon juste à droite ",
                errorText: null,
                // state.dateNaissance.isPure ||
                //     state.dateNaissance.isValid
                // ? null
                // : '',
                msgError: 'Veuillez renseigner ce champ',
                sufixIcon: Icon(
                  Icons.monetization_on_outlined,
                  color: context.appColor.primaryBlue,
                ),
              ),
              SizedBox(height: 16.h),

              Row(
                children: [
                  Icon(
                    Icons.insert_chart_outlined_outlined,
                    color: context.appColor.primaryDarkBlue,
                  ),
                  SizedBox(width: 8.w),
                  CustomeText(
                    text: "Assistance et Statistiques",
                    style: context.appTypographie.body.copyWith(
                      fontSize: 13.sp,
                      color: context.appColor.primaryGrayDark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              CustomeText(
                text: "Section Effectif",
                style: context.appTypographie.body.copyWith(
                  fontSize: 11.sp,
                  color: context.appColor.primaryGrayDark,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),

              AddcelluleMenber(
                title: "Nombre de personne baptisée",
                subtitle: "Baptisés par immersion",
                icon: Icons.water_drop_outlined,
                backgroundColorFeft: context.appColor.primaryBlue,
              ),

              SizedBox(height: 16.h),

              AddcelluleMenber(
                title: "Nombre de personne non baptisée",
                subtitle: "Ayant pas passer sous les eaux du baptême",
                icon: Icons.sentiment_satisfied_alt_sharp,
                backgroundColorFeft: Colors.red.shade100,
              ),

               SizedBox(height: 16.h),

              AddcelluleMenber(
                title: "Nombre de nouvelle personne a la cellule",
                subtitle: "Ayant rejoindre la cellule",
                icon: Icons.group_add,
                backgroundColorFeft: context.appColor.primarySuccess,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddcelluleMenber extends StatelessWidget {
  const AddcelluleMenber({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.backgroundColorFeft,
  });
  final String title;
  final String subtitle;
  final IconData icon;
  final Color backgroundColorFeft;
  


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: backgroundColorFeft,
            width: 4.w,
          ),
        ),
        color: context.appColor.primaryWhite,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomeText(
                    text: title,
                    style: context.appTypographie.body.copyWith(
                      fontSize: 13.sp,
                      color: context.appColor.primaryGrayDark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CustomeText(    
                    text: subtitle,
                    style: context.appTypographie.body.copyWith(
                      fontSize: 11.sp,
                      color: context.appColor.primaryGrayDark,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              Icon(
                icon,
                color: context.appColor.primaryDarkBlue,
              ),
            ],
          ),
    
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(17.w),
                  decoration: BoxDecoration(
                    color: context.appColor.primaryGray500.withValues(alpha: 0.7),
                    shape: BoxShape.circle,
                  ),
                  child: CustomeText(
                    text: "-",
                    style: context.appTypographie.body.copyWith(
                      fontSize: 16.sp,
                      color: context.appColor.primaryWhite,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(width: 15.w),
                CustomeText(
                    text: "0",
                    style: context.appTypographie.body.copyWith(
                      fontSize: 29.sp,
                      color: context.appColor.primaryGrayDark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                SizedBox(width: 15.w),
    
                   Container(
                  padding: EdgeInsets.all(17.w),
                  decoration: BoxDecoration(
                    color: backgroundColorFeft,
                    shape: BoxShape.circle,
                  ),
                  child: CustomeText(
                    text: "+",
                    style: context.appTypographie.body.copyWith(
                      fontSize: 16.sp,
                      color: context.appColor.primaryWhite,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
