import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/custome_widget/form_filed.dart';
import 'package:grace_church/core/custome_widget/navigate.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/feature/home/overview.dart';
import 'package:grace_church/feature/home/page/cellule_form/form_activite.dart';

class FormStatistic extends StatefulWidget {
  const FormStatistic({super.key});

  @override
  State<FormStatistic> createState() => _FormStatisticState();
}

class _FormStatisticState extends State<FormStatistic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Container(
        margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 50.h),
        child: SingleChildScrollView(
          child: Column(
            children: [

               SizedBox(height: 3.h),
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
                              text: 'Rapport Cellule ',
                              style: context.appTypographie.subtitle.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(width: 0),
                            Container(
                              decoration: BoxDecoration(
                                color: context.appColor.primaryLightBlue,
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                    fadeRoute(OverviewScreen()),
                                    (route) => false,
                                  );
                                },
                                icon: Icon(Icons.home_work_rounded),
                              ),
                            ),
                          ],
                        ),

              
              
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomeText(
                            text: 'Etape 2 sur 4',
                            style: context.appTypographie.small.copyWith(
                              color: context.appColor.primaryBlue,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                            ),
                          ),

                          CustomeText(
                            text: '45% Complété',
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
                        currentValue: 40,
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

                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 9.h),
                          padding: EdgeInsets.all(9.r),
                          decoration: BoxDecoration(
                            color: context.appColor.primaryLightBlue,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Icon(
                            Icons.trending_up,
                            color: context.appColor.primaryBlue,
                          ),
                        ),
                        SizedBox(width: 20.w),
                        
                        CustomeText(
                          text: 'Assistance',
                          style: context.appTypographie.subtitle.copyWith(
                            fontSize: 18.h,
                            color: context.appColor.primaryGrayDark,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    CustomeText(
                      text:
                          'Veuillez renseigner vos informations concernant les données d\'assistance de votre cellule.',
                      style: context.appTypographie.small.copyWith(
                        fontSize: 12.sp,
                        color: context.appColor.primaryGray500,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 0.02.sh),




              Row(
                children: [
                  Icon(
                    Icons.groups,
                    color: context.appColor.primaryDarkBlue,
                  ),
                  SizedBox(width: 8.w),
                  CustomeText(
                    text: "Nombre de baptisé",
                    style: context.appTypographie.body.copyWith(
                      fontSize: 13.sp,
                      color: context.appColor.primaryGrayDark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              ProductionFormCustomer(
                textInputType: TextInputType.number,
                isColorBlue: false,
                // state.dateNaissance.isValid
                //     ? true
                //     : false,
                readOnly: false,
                // controller:
                // textEditingControllerDateNaissance,
                inputLabel: "",
                textLabel: "Renseigner le nombre de baptisé",
                errorText: null,
                // state.dateNaissance.isPure ||
                //     state.dateNaissance.isValid
                // ? null
                // : '',
                msgError: 'Veuillez renseigner ce champ',
                sufixIcon: Icon(
                  Icons.water_drop,
                  color: context.appColor.primaryBlue,
                ),
              ),

              SizedBox(height: 7.h),

              Container(
                height: 0.32.sh,
                child: Scrollbar(
                  radius: Radius.circular(10.r),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: sections.length,
                    itemBuilder: (context, index) {
                      final section = sections[index];
                      return Card(
                        color: Colors.white,
                        elevation: 0.5.h,
                        borderOnForeground: true,
                        child: ExpansionTile(
                          // splashColor: Colors.transparent,
                          tilePadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                            
                          ),
                          iconColor: const Color(0xFF888888),
                          shape: Border.all(color: Colors.transparent),
                          collapsedShape: Border.all(color: Colors.transparent),
                          title: Text(
                            section.title,
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          children: section.items.map((item) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 8.h,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item.name,
                                    style: GoogleFonts.roboto(
                                      color: Color(0xFF888888),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.remove,
                                          color: Color(0xFF888888),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            if (item.count > 0) item.count--;
                                          });
                                        },
                                      ),
                  
                                      Text(item.count.toString()),
                  
                                      IconButton(
                                        icon: Icon(
                                          Icons.add,
                                          color: Color(0xFF888888),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            item.count++;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: 16.h),
              
                Row(
                children: [
                  Icon(
                    Icons.description_outlined,
                    color: context.appColor.primaryDarkBlue,
                  ),
                  SizedBox(width: 8.w),
                  CustomeText(
                    text: "Détails",
                    style: context.appTypographie.body.copyWith(
                      fontSize: 13.sp,
                      color: context.appColor.primaryGrayDark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
            
                Container(
                height: 0.4.sh,
                child: Scrollbar(
                  radius: Radius.circular(10.r),
                  child: Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: sections2.length,
                      itemBuilder: (context, index) {
                        final section = sections2[index];
                        return Card(
                          color: Colors.white,
                          elevation: 0.5.h,
                          borderOnForeground: true,
                          child: ExpansionTile(
                            // splashColor: Colors.transparent,
                            tilePadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                              
                            ),
                            iconColor: const Color(0xFF888888),
                            shape: Border.all(color: Colors.transparent),
                            collapsedShape: Border.all(color: Colors.transparent),
                            title: Text(
                              section.title,
                              style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            children: section.items.map((item) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 8.h,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item.name,
                                      style: GoogleFonts.roboto(
                                        color: Color(0xFF888888),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.remove,
                                            color: Color(0xFF888888),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              if (item.count > 0) item.count--;
                                            });
                                          },
                                        ),
                    
                                        Text(item.count.toString()),
                    
                                        IconButton(
                                          icon: Icon(
                                            Icons.add,
                                            color: Color(0xFF888888),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              item.count++;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 9.h,),
                FormNextTeps(
                          icons: Icons.work_outline,
                          title: 'Activité ',
                          description: 'Activité de la cellule ',
                          isNextForm: false,
                        ),


               Container(
                margin: EdgeInsets.only(top: 20.h, bottom: 30.h),
                child: PrimaryButton(
                  label: 'Suivant',
                  colorText: context.appColor.primaryWhite,
                  onPressed: () {

                      Navigator.push(
                      context,fadeRoute(FormActivite()),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h)
            ],
          ),
        ),
      ),
    );
  }
}

class ItemSection {
  final String name;
  int count;

  ItemSection({required this.name, this.count = 0});
}

class Section {
  final String title;
  final List<ItemSection> items;

  Section({required this.title, required this.items});
}

final sections = [
  Section(
    title: "Non baptisé",
    items: [
      ItemSection(name: "Tout-petits"),
      ItemSection(name: "Juniors"),
      ItemSection(name: "Cadets"),
    ],
  ),
  Section(
    title: "Nouveaux",
    items: [
      ItemSection(name: "Tout-petits"),
      ItemSection(name: "Juniors"),
      ItemSection(name: "Cadets"),
    ],
  ),
  Section(
    title: "Invités",
    items: [
      ItemSection(name: "Tout-petits"),
      ItemSection(name: "Juniors"),
      ItemSection(name: "Cadets"),
    ],
  ),
];

final sections2 = [
  Section(
    title: "Formation ",
    items: [
      // ItemSection(name: "Décisionnaires"),
      ItemSection(name: "Nouv. En Formation DFNC"),
      ItemSection(name: "Nouv. Bapt. En Formation DFD"),
      ItemSection(name: "En formation niveau 2"),
    ],
  ),
  Section(
    title: "Section visite",
    items: [
      ItemSection(name: "Visites faites aux membres"),
      ItemSection(name: "Visites faites aux disciples"),
    ],
  ),

   Section(
    title: "Section Activités",
    items: [
      ItemSection(name: "Nbre de travailleurs"),
      ItemSection(name: "Nbre d’élèves et étudiants"),
    ],
  ),

    Section(
    title: "Section Ouvriers",
    items: [
      ItemSection(name: "Nbre d’ouvrier E.M"),
      ItemSection(name: "Ouv. Autre dépt dirigeant E.M")
    ],
  ),
    Section(
    title: "Autres",
    items: [
      ItemSection(name: "Agenda de l’EM (Oui ou Non)"),
      ItemSection(name: "Décisionnaires"),
    ],
  ),
];
