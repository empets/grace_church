import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/custome_widget/form_filed.dart';
import 'package:grace_church/core/custome_widget/navigate.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/feature/home/home_view.dart';
import 'package:grace_church/feature/home/overview.dart';

class FormOuvrierSpritualLive extends StatefulWidget {
  const FormOuvrierSpritualLive({super.key});

  @override
  State<FormOuvrierSpritualLive> createState() => _FormOuvrierSpritualLiveDataState();
}

class _FormOuvrierSpritualLiveDataState extends State<FormOuvrierSpritualLive> {
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
                            text: 'Etape 4 sur 4',
                            style: context.appTypographie.small.copyWith(
                              color: context.appColor.primaryBlue,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                            ),
                          ),

                          CustomeText(
                            text: '100% Complété',
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
                        currentValue: 100,
                        displayTextStyle: context.appTypographie.small.copyWith(
                          fontSize: 0.h,
                        ),
                        displayText: '%',
                        progressColor: context.appColor.primaryBlue,
                        backgroundColor: context.appColor.primaryLightBlue,
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
                            Icons.lightbulb_outline,
                            color: context.appColor.primaryBlue,
                          ),
                        ),
                        SizedBox(width: 20.w),
                        
                        CustomeText(
                          text: 'Suggestion',
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
                          "Veuillez renseigner vos suggestions pour le bon deroulement de la cellule.",
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
                    Icons.person,
                    color: context.appColor.primaryDarkBlue,
                  ),
                  SizedBox(width: 8.w),
                  CustomeText(
                    text: "RequestSection Ouvrier ",
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
                  SizedBox(height: 10.h), 
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Entrer le nombre de visite faite aux membres",labelStyle: context.appTypographie.body.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,)),
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
                              Text("Suggestion ${index + 1}",style: context.appTypographie.body.copyWith(fontWeight: FontWeight.bold,),),
                                    
                              TextField(
                                maxLines: 3,
                                decoration: InputDecoration(labelText: "Témoignages-Evènements-Dons-Aides"),
                                onChanged: (val) => row.nom = val,
                              ),
                                    
                              TextField(
                                maxLines: 3,
                                decoration: InputDecoration(labelText: "Suggestions"),
                                onChanged: (val) => row.probleme = val,
                              ),
                                    
                              TextField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                  labelText: "Problème personnel del’ouvrier",
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
              SizedBox(height: 16.h),
              
               ProductionFormCustomer(
                textInputType: TextInputType.number,
                isColorBlue: false,
                // state.dateNaissance.isValid
                //     ? true
                //     : false,
                readOnly: false,
                // controller:
                // textEditingControllerDateNaissance,
                inputLabel: "Projet et Autre faits a signaler",
                textLabel: "Renseigner les projets et autres faits",
                errorText: null,
                // state.dateNaissance.isPure ||
                //     state.dateNaissance.isValid
                // ? null
                // : '',
                msgError: 'Veuillez renseigner ce champ',
                prefixIcon: Icon(
                  Icons.edit,
                  color: context.appColor.primaryBlue,
                ),
                maxLines: 3,
                minLines: 2,
              ),


                   SizedBox(height: 16.h),
              
               ProductionFormCustomer(
                textInputType: TextInputType.number,
                isColorBlue: false,
                // state.dateNaissance.isValid
                //     ? true
                //     : false,
                readOnly: false,
                // controller:
                // textEditingControllerDateNaissance,
                inputLabel: "Etat spirituel de l'eglise de maison",
                textLabel: "Renseigner l'état spirituel",
                errorText: null,
                // state.dateNaissance.isPure ||
                //     state.dateNaissance.isValid
                // ? null
                // : '',
                msgError: 'Veuillez renseigner ce champ',
                prefixIcon: Icon(
                  Icons.auto_awesome_rounded,
                  color: context.appColor.primaryBlue,
                ),
                maxLines: 3,
                minLines: 2,
              ),


               Container(
                margin: EdgeInsets.symmetric(vertical: 20.h),
                child: PrimaryButton(
                  label: 'Suivant',
                  colorText: context.appColor.primaryWhite,
                  onPressed: () {
                      Navigator.push(
                      context,
                      fadeRoute(const OverviewScreen()),
                    
                    );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => HomeView(),
                    //   ),
                    // );
                  },
                ),
              ),

                   SizedBox(height: 30.h),

           
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
