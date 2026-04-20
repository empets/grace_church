import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/custome_widget/form_filed.dart';
import 'package:grace_church/core/custome_widget/navigate.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/feature/home/overview.dart';
import 'package:grace_church/feature/home/page/cellule_form/form_ouvrier_spritual_live.dart';

class FormActivite extends StatefulWidget {
  const FormActivite({super.key});

  @override
  State<FormActivite> createState() => _FormActiviteState();
}

class _FormActiviteState extends State<FormActivite> {
  void updateNombre(RequestSectionForm RequestSection, int value) {
    setState(() {
      RequestSection.nombre = value;

      RequestSection.rows = List.generate(
        value,
        (index) =>
            RequestSection.rows.length > index ? RequestSection.rows[index] : FormRow(),
      );
    });
  }

   void updateNombre2(RequestSectionForm RequestSection, int value) {
    setState(() {
      RequestSection.nombre = value;

      RequestSection.rows = List.generate(
        value,
        (index) =>
            RequestSection.rows.length > index ? RequestSection.rows[index] : FormRow(),
      );
    });
  }


  RequestSectionForm RequestSection = RequestSectionForm(nombre: 1, rows: [FormRow()]);

  RequestSectionForm RequestSection2 = RequestSectionForm(nombre: 1, rows: [FormRow()]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Container(
        padding: EdgeInsets.all(16.w),

        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.h),

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
                            text: '60% Complété',
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
                            Icons.work_outline,
                            color: context.appColor.primaryBlue,
                          ),
                        ),
                        SizedBox(width: 20.w),
                        
                        CustomeText(
                          text: 'Activité',
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
                          "Veuillez renseigner les visite faite au membre ainsi qu'aux disciple",
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
                    Icons.search,
                    color: context.appColor.primaryDarkBlue,
                  ),
                  SizedBox(width: 8.w),
                  CustomeText(
                    text: "RequestSection visite",
                    style: context.appTypographie.body.copyWith(
                      fontSize: 13.sp,
                      color: context.appColor.primaryGrayDark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 16.h),
                          
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Nombre de visite faite aux disciples",labelStyle: context.appTypographie.body.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,)),
                    onChanged: (value) {
                      final number = int.tryParse(value) ?? 1;
                      updateNombre(RequestSection, number);
                    },
                  ),
                  Column(
                    children: List.generate(RequestSection.rows.length, (index) {
                      final row = RequestSection.rows[index];
                            
                      return Card(
                        color: Colors.white,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                          child: Column(
                            children: [
                            //  Icon(Icons.file_open_rounded),:
                              Text("Disciple visité ${index + 1}",style: context.appTypographie.body.copyWith(fontWeight: FontWeight.bold,),),
                                    
                              TextField(
                                decoration: InputDecoration(labelText: "Nom"),
                                onChanged: (val) => row.nom = val,
                              ),
                                    
                              TextField(
                                decoration: InputDecoration(labelText: "Problème"),
                                onChanged: (val) => row.probleme = val,
                              ),
                                    
                              TextField(
                                decoration: InputDecoration(
                                  labelText: "Recommandation",
                                ),
                                onChanged: (val) => row.recommandation = val,
                              ),
                                    
                              SizedBox(height: 16),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),

              Column(
                children: [
                  SizedBox(height: 16.h), 
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Nombre de visite faite aux membres",labelStyle: context.appTypographie.body.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    )),
                    onChanged: (value) {
                      final number = int.tryParse(value) ?? 1;
                      updateNombre2(RequestSection2, number);
                    },
                  ),
                  Column(
                    children: List.generate(RequestSection2.rows.length, (index) {
                      final row = RequestSection2.rows[index];
                            
                      return Card(
                        color: Colors.white,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                          child: Column(
                            children: [
                            //  Icon(Icons.file_open_rounded),:
                              Text(" Membre visité ${index + 1}",style: context.appTypographie.body.copyWith(fontWeight: FontWeight.bold,),),
                                    
                              TextField(
                                decoration: InputDecoration(labelText: "Nom"),
                                onChanged: (val) => row.nom = val,
                              ),
                                    
                              TextField(
                                decoration: InputDecoration(labelText: "Problème"),
                                onChanged: (val) => row.probleme = val,
                              ),
                                    
                              TextField(
                                decoration: InputDecoration(
                                  labelText: "Recommandation",
                                ),
                                onChanged: (val) => row.recommandation = val,
                              ),
                                    
                              SizedBox(height: 16),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),

               
                Container(
                  margin: EdgeInsets.only(top: 20.h, bottom: 17.h),
                  child: FormNextTeps(
                            icons: Icons.lightbulb_outline,
                            title: 'Suggestion ',
                            description: 'vos suggestions pour la cellule',
                            isNextForm: false,
                          ),
                ),

              
               Container(
                margin: EdgeInsets.only(top: 20.h, bottom: 30.h),
                child: PrimaryButton(
                  label: 'Suivant',
                  colorText: context.appColor.primaryWhite,
                  onPressed: () {
                    Navigator.push(
                      context,
                      fadeRoute(const FormOuvrierSpritualLive()),
                    
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

class FormRow {
  String nom;
  String probleme;
  String recommandation;

  FormRow({this.nom = '', this.probleme = '', this.recommandation = ''});
}

class RequestSectionForm {
  int nombre;
  List<FormRow> rows;

  RequestSectionForm({this.nombre = 1, required this.rows});
}
