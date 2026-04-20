import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/custome_widget/form_filed.dart';
import 'package:grace_church/core/custome_widget/navigate.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/core/injection/injection_container.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart';
import 'package:grace_church/feature/home/domaine/usercase/rapport_cellule_stat_usercase.dart';
import 'package:grace_church/feature/home/overview.dart';
import 'package:grace_church/feature/home/page/bloc/rapport_cellule.dart/event/rapport_cellule_event.dart';
import 'package:grace_church/feature/home/page/bloc/rapport_cellule.dart/form_sassistance_bloc.dart';
import 'package:grace_church/feature/home/page/bloc/rapport_cellule.dart/state/rapport_cellule_state.dart';
enum SectionType { nonBaptise, nouveaux, inviter }

class FormStatistic extends StatefulWidget {
  final String id;
  const FormStatistic({super.key, required this.id});

  @override
  State<FormStatistic> createState() => _FormStatisticState();
}

class _FormStatisticState extends State<FormStatistic> {
  // void _updateItem1({
  //   required BuildContext context,
  //   required int index,
  //   required RequestHumaneSectionAssistance state,
  //   String? title,
  //   String? name,
  //   int? count,
  //   required RapportCelluleRequestSectionAssistanceEvent Function(
  //     List<RequestHumaneSectionAssistance>,
  //   )
  //   event, // ✅ event en paramètre
  // }) {
  //   final bloc = context.read<RapportCelluleSectionAssistanceBloc>();

  //   final list = List<RequestHumaneSectionAssistance>.from([]);

  //   // Étend la liste si nécessaire
  //   if (list.length <= index) {
  //     list.addAll(
  //       List.generate(
  //         index - list.length + 1,
  //         (_) => RequestHumaneSectionAssistance(title: '', name: '', cout: 0),
  //       ),
  //     );
  //   }

  //   list[index] = list[index].copyWith(
  //     title: title ?? list[index].title,
  //     name: name ?? list[index].name,
  //     cout: count ?? list[index].cout,
  //   );

  //   bloc.add(event(list)); // ✅ appel du callback avec la liste mise à jour
  // }

  void _updateItem1({
    required BuildContext context,
    required String sectionTitle,
    required int index,
    required RapportCelluleRequestSectionAssistanceState state,
    required RequestHumaneSectionAssistance data,
    required RapportCelluleRequestSectionAssistanceEvent
    event, // ✅ event en paramètre
  }) {
    context.read<RapportCelluleSectionAssistanceBloc>().add(event);
  }

  List<RequestHumaneSectionAssistance> _getSectionList(
  RapportCelluleRequestSectionAssistanceState state,
  String section,
) {
  switch (section) {
    case "Non baptisé":
      return state.nomBaptiserStatic;

    case "Nouveaux":
      return state.nouveauBaptiser;

    case "Invités":
      return state.inviter;

    case "Formation":
      return state.formation;

    case "Visite":
      return state.sectionVisite;

    case "Activité":
      return state.sectionActivite;

    case "Ouvrier":
      return state.sectionOuvrier;

    default:
      return state.autres;
  }
}


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RapportCelluleSectionAssistanceBloc(
        sendRapportCelluleStepStatUsercase:
            getIt<SendRapportCelluleStepStatUsercase>(),
      ),

      child: Scaffold(
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
                    Icon(Icons.groups, color: context.appColor.primaryDarkBlue),
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

                BlocBuilder<
                  RapportCelluleSectionAssistanceBloc,
                  RapportCelluleRequestSectionAssistanceState
                >(
                  builder: (context, state) {
                    return ProductionFormCustomer(
                      textInputType: TextInputType.phone,
                      isColorBlue: state.nombreBaptiser.isValid ? true : false,
                      readOnly: false,
                      inputLabel: '',
                      textLabel: "Renseigner le nombre de baptisé ",
                      errorText:
                          state.nombreBaptiser.isPure ||
                              state.nombreBaptiser.isValid
                          ? null
                          : '',
                      msgError: 'Veuillez renseigner ce champ',
                      sufixIcon: Icon(
                        Icons.monetization_on_outlined,
                        color: context.appColor.primaryBlue,
                      ),
                      onChanged: (value) {
                        context.read<RapportCelluleSectionAssistanceBloc>().add(
                          RapportCelluleRequestSectionAssistanceEvent.changeNombreBaptiser(
                            value,
                          ),
                        );
                      },
                    );
                  },
                ),

                SizedBox(height: 7.h),

                BlocBuilder<
                  RapportCelluleSectionAssistanceBloc,
                  RapportCelluleRequestSectionAssistanceState
                >(
                  builder: (context, state) {
                    return Container(
                      height: 0.32.sh,
                      child: Scrollbar(
                        radius: Radius.circular(10.r),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: RequestSections.length,
                          itemBuilder: (context, index) {
                            final RequestSection = RequestSections[index];
                            return Card(
                              color: Colors.white,
                              elevation: 0.5.h,
                              borderOnForeground: true,
                              child: ExpansionTile(
                                tilePadding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 8.h,
                                ),
                                iconColor: const Color(0xFF888888),
                                shape: Border.all(color: Colors.transparent),
                                collapsedShape: Border.all(
                                  color: Colors.transparent,
                                ),
                                title: Text(
                                  RequestSection.title,
                                  style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                children: RequestSection.items.map((item) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.w,
                                      vertical: 8.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                            BlocBuilder<
                                              RapportCelluleSectionAssistanceBloc,
                                              RapportCelluleRequestSectionAssistanceState
                                            >(
                                              builder: (context, state) {
                                                return IconButton(
                                                  icon: Icon(
                                                    Icons.remove,
                                                    color: Color(0xFF888888),
                                                  ),
                                                  onPressed: () {
                                                    WidgetsBinding.instance.addPostFrameCallback((
                                                      _,
                                                    ) {
                                                      setState(() {
                                                        if (item.count > 0)
                                                          item.count--;
                                                      });

                                                      if (RequestSection
                                                              .title ==
                                                          "Non baptisé") {
                                                        _updateItem1(
                                                          context: context,
                                                          sectionTitle:
                                                              RequestSection
                                                                  .title,
                                                          index: index,
                                                          state: state,
                                                          data: RequestHumaneSectionAssistance(
                                                            title:
                                                                RequestSection
                                                                    .title,
                                                            name: item.name,
                                                            cout: item.count,
                                                          ),
                                                          event: RapportCelluleRequestSectionAssistanceEvent.changeNomBaptiserStatic([
                                                            RequestHumaneSectionAssistance(
                                                              title:
                                                                  RequestSection
                                                                      .title,
                                                              name: item.name,
                                                              cout: item.count,
                                                            ),
                                                          ]),
                                                        );

                                                        //  context
                                                        //   .read<
                                                        //     RapportCelluleSectionAssistanceBloc
                                                        //   >()
                                                        //   .add(
                                                        //     RapportCelluleRequestSectionAssistanceEvent.changeNomBaptiserStatic(
                                                        // RequestHumaneSectionAssistance(
                                                        //   title: RequestSection.title,
                                                        //   name: item.name,
                                                        //   cout: item.count,
                                                        // ),
                                                        //     ),
                                                        //   );
                                                      }
                                                      if (RequestSection
                                                              .title ==
                                                          "Non baptisé") {
                                                        _updateItem1(
                                                          context: context,
                                                          sectionTitle:
                                                              RequestSection
                                                                  .title,
                                                          index: index,
                                                          state: state,
                                                          data: RequestHumaneSectionAssistance(
                                                            title:
                                                                RequestSection
                                                                    .title,
                                                            name: item.name,
                                                            cout: item.count,
                                                          ),
                                                          event: RapportCelluleRequestSectionAssistanceEvent.changeNomBaptiserStatic([
                                                            RequestHumaneSectionAssistance(
                                                              title:
                                                                  RequestSection
                                                                      .title,
                                                              name: item.name,
                                                              cout: item.count,
                                                            ),
                                                          ]),
                                                        );
                                                        // _updateItem1(
                                                        //   context: context,
                                                        //   title: RequestSection
                                                        //       .title,
                                                        //   index: index,
                                                        //   state:
                                                        //       RequestHumaneSectionAssistance(
                                                        //         title:
                                                        //             RequestSection
                                                        //                 .title,
                                                        //         name: item.name,
                                                        //         cout: item.count,
                                                        //       ),
                                                        //   event: RapportCelluleRequestSectionAssistanceEvent
                                                        //       .changeNomBaptiserStatic,
                                                        // );

                                                        //  context
                                                        //   .read<
                                                        //     RapportCelluleSectionAssistanceBloc
                                                        //   >()
                                                        //   .add(
                                                        //     RapportCelluleRequestSectionAssistanceEvent.changeNomBaptiserStatic(
                                                        //       RequestHumaneSectionAssistance(
                                                        //         title: RequestSection.title,
                                                        //         name: item.name,
                                                        //         cout: item.count,
                                                        //       ),
                                                        //     ),
                                                        //   );
                                                      } else if (RequestSection
                                                              .title ==
                                                          "Nouveaux") {
                                                        _updateItem1(
                                                          context: context,
                                                          sectionTitle:
                                                              RequestSection
                                                                  .title,
                                                          index: index,
                                                          state: state,
                                                          data: RequestHumaneSectionAssistance(
                                                            title:
                                                                RequestSection
                                                                    .title,
                                                            name: item.name,
                                                            cout: item.count,
                                                          ),
                                                          event: RapportCelluleRequestSectionAssistanceEvent.changeNomBaptiserStatic([
                                                            RequestHumaneSectionAssistance(
                                                              title:
                                                                  RequestSection
                                                                      .title,
                                                              name: item.name,
                                                              cout: item.count,
                                                            ),
                                                          ]),
                                                        );
                                                        // _updateItem1(
                                                        //   context: context,
                                                        //   title: RequestSection
                                                        //       .title,
                                                        //   index: index,
                                                        //   state:
                                                        //       RequestHumaneSectionAssistance(
                                                        //         title:
                                                        //             RequestSection
                                                        //                 .title,
                                                        //         name: item.name,
                                                        //         cout: item.count,
                                                        //       ),
                                                        //   event: RapportCelluleRequestSectionAssistanceEvent
                                                        //       .changeNoveauBaptiser,
                                                        // );

                                                        // context
                                                        //   .read<
                                                        //     RapportCelluleSectionAssistanceBloc
                                                        //   >()
                                                        //   .add(
                                                        //     RapportCelluleRequestSectionAssistanceEvent.changeNoveauBaptiser(
                                                        //       RequestHumaneSectionAssistance(
                                                        //         title: RequestSection.title,
                                                        //         name: item.name,
                                                        //         cout: item.count,
                                                        //       ),
                                                        //     ),
                                                        //   );
                                                      } else {
                                                        _updateItem1(
                                                          context: context,
                                                          sectionTitle:
                                                              RequestSection
                                                                  .title,
                                                          index: index,
                                                          state: state,
                                                          data: RequestHumaneSectionAssistance(
                                                            title:
                                                                RequestSection
                                                                    .title,
                                                            name: item.name,
                                                            cout: item.count,
                                                          ),
                                                          event: RapportCelluleRequestSectionAssistanceEvent.changeNomBaptiserStatic([
                                                            RequestHumaneSectionAssistance(
                                                              title:
                                                                  RequestSection
                                                                      .title,
                                                              name: item.name,
                                                              cout: item.count,
                                                            ),
                                                          ]),
                                                        );
                                                        // _updateItem1(
                                                        //   context: context,
                                                        //   title: RequestSection
                                                        //       .title,
                                                        //   index: index,
                                                        //   state:
                                                        //       RequestHumaneSectionAssistance(
                                                        //         title:
                                                        //             RequestSection
                                                        //                 .title,
                                                        //         name: item.name,
                                                        //         cout: item.count,
                                                        //       ),
                                                        //   event:
                                                        //       RapportCelluleRequestSectionAssistanceEvent
                                                        //           .changeInviter,
                                                        // );

                                                        //   context
                                                        // .read<
                                                        //   RapportCelluleSectionAssistanceBloc
                                                        // >()
                                                        // .add(
                                                        //   RapportCelluleRequestSectionAssistanceEvent.changeInviter(
                                                        //     RequestHumaneSectionAssistance(
                                                        //       title: RequestSection.title,
                                                        //       name: item.name,
                                                        //       cout: item.count,
                                                        //     ),
                                                        //   ),
                                                        // );
                                                      }
                                                    });
                                                  },
                                                );
                                              },
                                            ),

                                            Text(item.count.toString()),

                                            BlocBuilder<
                                              RapportCelluleSectionAssistanceBloc,
                                              RapportCelluleRequestSectionAssistanceState
                                            >(
                                              builder: (context, state) {
                                                return IconButton(
                                                  icon: Icon(
                                                    Icons.add,
                                                    color: Color(0xFF888888),
                                                  ),
                                                  onPressed: () {
                                                    WidgetsBinding.instance.addPostFrameCallback((
                                                      _,
                                                    ) {
                                                      setState(() {
                                                        if (item.count > 0)
                                                          item.count++;
                                                      });

                                                      
                                                      if (RequestSection
                                                              .title ==
                                                          "Non baptisé") {
                                                        _updateItem1(
                                                          context: context,
                                                          sectionTitle:
                                                              RequestSection
                                                                  .title,
                                                          index: index,
                                                          state: state,
                                                          data: RequestHumaneSectionAssistance(
                                                            title:
                                                                RequestSection
                                                                    .title,
                                                            name: item.name,
                                                            cout: item.count,
                                                          ),
                                                          event: RapportCelluleRequestSectionAssistanceEvent.changeNomBaptiserStatic([
                                                            RequestHumaneSectionAssistance(
                                                              title:
                                                                  RequestSection
                                                                      .title,
                                                              name: item.name,
                                                              cout: item.count,
                                                            ),
                                                          ]),
                                                        );

                                                        //  context
                                                        //   .read<
                                                        //     RapportCelluleSectionAssistanceBloc
                                                        //   >()
                                                        //   .add(
                                                        //     RapportCelluleRequestSectionAssistanceEvent.changeNomBaptiserStatic(
                                                        // RequestHumaneSectionAssistance(
                                                        //   title: RequestSection.title,
                                                        //   name: item.name,
                                                        //   cout: item.count,
                                                        // ),
                                                        //     ),
                                                        //   );
                                                      }
                                                      if (RequestSection
                                                              .title ==
                                                          "Non baptisé") {
                                                        _updateItem1(
                                                          context: context,
                                                          sectionTitle:
                                                              RequestSection
                                                                  .title,
                                                          index: index,
                                                          state: state,
                                                          data: RequestHumaneSectionAssistance(
                                                            title:
                                                                RequestSection
                                                                    .title,
                                                            name: item.name,
                                                            cout: item.count,
                                                          ),
                                                          event: RapportCelluleRequestSectionAssistanceEvent.changeNomBaptiserStatic([
                                                            RequestHumaneSectionAssistance(
                                                              title:
                                                                  RequestSection
                                                                      .title,
                                                              name: item.name,
                                                              cout: item.count,
                                                            ),
                                                          ]),
                                                        );
                                                        // _updateItem1(
                                                        //   context: context,
                                                        //   title: RequestSection
                                                        //       .title,
                                                        //   index: index,
                                                        //   state:
                                                        //       RequestHumaneSectionAssistance(
                                                        //         title:
                                                        //             RequestSection
                                                        //                 .title,
                                                        //         name: item.name,
                                                        //         cout: item.count,
                                                        //       ),
                                                        //   event: RapportCelluleRequestSectionAssistanceEvent
                                                        //       .changeNomBaptiserStatic,
                                                        // );

                                                        //  context
                                                        //   .read<
                                                        //     RapportCelluleSectionAssistanceBloc
                                                        //   >()
                                                        //   .add(
                                                        //     RapportCelluleRequestSectionAssistanceEvent.changeNomBaptiserStatic(
                                                        //       RequestHumaneSectionAssistance(
                                                        //         title: RequestSection.title,
                                                        //         name: item.name,
                                                        //         cout: item.count,
                                                        //       ),
                                                        //     ),
                                                        //   );
                                                      } else if (RequestSection
                                                              .title ==
                                                          "Nouveaux") {
                                                        _updateItem1(
                                                          context: context,
                                                          sectionTitle:
                                                              RequestSection
                                                                  .title,
                                                          index: index,
                                                          state: state,
                                                          data: RequestHumaneSectionAssistance(
                                                            title:
                                                                RequestSection
                                                                    .title,
                                                            name: item.name,
                                                            cout: item.count,
                                                          ),
                                                          event: RapportCelluleRequestSectionAssistanceEvent.changeNomBaptiserStatic([
                                                            RequestHumaneSectionAssistance(
                                                              title:
                                                                  RequestSection
                                                                      .title,
                                                              name: item.name,
                                                              cout: item.count,
                                                            ),
                                                          ]),
                                                        );
                                                        // _updateItem1(
                                                        //   context: context,
                                                        //   title: RequestSection
                                                        //       .title,
                                                        //   index: index,
                                                        //   state:
                                                        //       RequestHumaneSectionAssistance(
                                                        //         title:
                                                        //             RequestSection
                                                        //                 .title,
                                                        //         name: item.name,
                                                        //         cout: item.count,
                                                        //       ),
                                                        //   event: RapportCelluleRequestSectionAssistanceEvent
                                                        //       .changeNoveauBaptiser,
                                                        // );

                                                        // context
                                                        //   .read<
                                                        //     RapportCelluleSectionAssistanceBloc
                                                        //   >()
                                                        //   .add(
                                                        //     RapportCelluleRequestSectionAssistanceEvent.changeNoveauBaptiser(
                                                        //       RequestHumaneSectionAssistance(
                                                        //         title: RequestSection.title,
                                                        //         name: item.name,
                                                        //         cout: item.count,
                                                        //       ),
                                                        //     ),
                                                        //   );
                                                      } else {
                                                        _updateItem1(
                                                          context: context,
                                                          sectionTitle:
                                                              RequestSection
                                                                  .title,
                                                          index: index,
                                                          state: state,
                                                          data: RequestHumaneSectionAssistance(
                                                            title:
                                                                RequestSection
                                                                    .title,
                                                            name: item.name,
                                                            cout: item.count,
                                                          ),
                                                          event: RapportCelluleRequestSectionAssistanceEvent.changeNomBaptiserStatic([
                                                            RequestHumaneSectionAssistance(
                                                              title:
                                                                  RequestSection
                                                                      .title,
                                                              name: item.name,
                                                              cout: item.count,
                                                            ),
                                                          ]),
                                                        );
                                                        // _updateItem1(
                                                        //   context: context,
                                                        //   title: RequestSection
                                                        //       .title,
                                                        //   index: index,
                                                        //   state:
                                                        //       RequestHumaneSectionAssistance(
                                                        //         title:
                                                        //             RequestSection
                                                        //                 .title,
                                                        //         name: item.name,
                                                        //         cout: item.count,
                                                        //       ),
                                                        //   event:
                                                        //       RapportCelluleRequestSectionAssistanceEvent
                                                        //           .changeInviter,
                                                        // );

                                                        //   context
                                                        // .read<
                                                        //   RapportCelluleSectionAssistanceBloc
                                                        // >()
                                                        // .add(
                                                        //   RapportCelluleRequestSectionAssistanceEvent.changeInviter(
                                                        //     RequestHumaneSectionAssistance(
                                                        //       title: RequestSection.title,
                                                        //       name: item.name,
                                                        //       cout: item.count,
                                                        //     ),
                                                        //   ),
                                                        // );
                                                      }
                                                    });
                                                  },
                                                );
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
                    );
                  },
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

                BlocBuilder<
                  RapportCelluleSectionAssistanceBloc,
                  RapportCelluleRequestSectionAssistanceState
                >(
                  builder: (context, state) {
                    return Container(
                      height: 0.4.sh,
                      child: Scrollbar(
                        radius: Radius.circular(10.r),
                        child: Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: RequestSections2.length,
                            itemBuilder: (context, index) {
                              final RequestSection = RequestSections2[index];
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
                                  collapsedShape: Border.all(
                                    color: Colors.transparent,
                                  ),
                                  title: Text(
                                    RequestSection.title,
                                    style: GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  children: RequestSection.items.map((item) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16.w,
                                        vertical: 8.h,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                    if (item.count > 0)
                                                      item.count--;
                                                  });
                                                  // if (RequestSection.title == "Formation") {
                                                  //     context
                                                  //   .read<
                                                  //     RapportCelluleSectionAssistanceBloc
                                                  //   >()
                                                  //   .add(
                                                  //     RapportCelluleRequestSectionAssistanceEvent.changeFormation(
                                                  //       RequestHumaneSectionAssistance(
                                                  //         title: RequestSection.title,
                                                  //         name: item.name,
                                                  //         cout: item.count,
                                                  //       ),
                                                  //     ),
                                                  //   );
                                                  // }

                                                  //   if (RequestSection.title == "Section visite") {
                                                  //     context
                                                  //   .read<
                                                  //     RapportCelluleSectionAssistanceBloc
                                                  //   >()
                                                  //   .add(
                                                  //     RapportCelluleRequestSectionAssistanceEvent.changeSectionVisite(
                                                  //       RequestHumaneSectionAssistance(
                                                  //         title: RequestSection.title,
                                                  //         name: item.name,
                                                  //         cout: item.count,
                                                  //       ),
                                                  //     ),
                                                  //   );
                                                  // }

                                                  //   if (RequestSection.title == "Section Activités") {
                                                  //     context
                                                  //   .read<
                                                  //     RapportCelluleSectionAssistanceBloc
                                                  //   >()
                                                  //   .add(
                                                  //     RapportCelluleRequestSectionAssistanceEvent.changeSectionActivite(
                                                  //       RequestHumaneSectionAssistance(
                                                  //         title: RequestSection.title,
                                                  //         name: item.name,
                                                  //         cout: item.count,
                                                  //       ),
                                                  //     ),
                                                  //   );
                                                  // }

                                                  // if (RequestSection.title == "Section Ouvriers") {
                                                  //   context
                                                  //     .read<
                                                  //       RapportCelluleSectionAssistanceBloc
                                                  //     >()
                                                  //     .add(
                                                  //       RapportCelluleRequestSectionAssistanceEvent.changeSectionOuvrier(
                                                  //         RequestHumaneSectionAssistance(
                                                  //           title: RequestSection.title,
                                                  //           name: item.name,
                                                  //           cout: item.count,
                                                  //         ),
                                                  //       ),
                                                  //     );
                                                  // }
                                                  // if (RequestSection.title == "Autres") {
                                                  //   context
                                                  //     .read<
                                                  //       RapportCelluleSectionAssistanceBloc
                                                  //     >()
                                                  //     .add(
                                                  //       RapportCelluleRequestSectionAssistanceEvent.changeAutres(
                                                  //         RequestHumaneSectionAssistance(
                                                  //           title: RequestSection.title,
                                                  //           name: item.name,
                                                  //           cout: item.count,
                                                  //         ),
                                                  //       ),
                                                  //     );
                                                  // }
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

                                                  //  if (RequestSection.title == "Formation") {
                                                  //     context
                                                  //   .read<
                                                  //     RapportCelluleSectionAssistanceBloc
                                                  //   >()
                                                  //   .add(
                                                  //     RapportCelluleRequestSectionAssistanceEvent.changeFormation(
                                                  //       RequestHumaneSectionAssistance(
                                                  //         title: RequestSection.title,
                                                  //         name: item.name,
                                                  //         cout: item.count,
                                                  //       ),
                                                  //     ),
                                                  //   );
                                                  // }

                                                  //   if (RequestSection.title == "Section visite") {
                                                  //     context
                                                  //   .read<
                                                  //     RapportCelluleSectionAssistanceBloc
                                                  //   >()
                                                  //   .add(
                                                  //     RapportCelluleRequestSectionAssistanceEvent.changeSectionVisite(
                                                  //       RequestHumaneSectionAssistance(
                                                  //         title: RequestSection.title,
                                                  //         name: item.name,
                                                  //         cout: item.count,
                                                  //       ),
                                                  //     ),
                                                  //   );
                                                  // }

                                                  //   if (RequestSection.title == "Section Activités") {
                                                  //     context
                                                  //   .read<
                                                  //     RapportCelluleSectionAssistanceBloc
                                                  //   >()
                                                  //   .add(
                                                  //     RapportCelluleRequestSectionAssistanceEvent.changeSectionActivite(
                                                  //       RequestHumaneSectionAssistance(
                                                  //         title: RequestSection.title,
                                                  //         name: item.name,
                                                  //         cout: item.count,
                                                  //       ),
                                                  //     ),
                                                  //   );
                                                  // }

                                                  // if (RequestSection.title == "Section Ouvriers") {
                                                  //   context
                                                  //     .read<
                                                  //       RapportCelluleSectionAssistanceBloc
                                                  //     >()
                                                  //     .add(
                                                  //       RapportCelluleRequestSectionAssistanceEvent.changeSectionOuvrier(
                                                  //         RequestHumaneSectionAssistance(
                                                  //           title: RequestSection.title,
                                                  //           name: item.name,
                                                  //           cout: item.count,
                                                  //         ),
                                                  //       ),
                                                  //     );
                                                  // }
                                                  // if (RequestSection.title == "Autres") {
                                                  //   context
                                                  //     .read<
                                                  //       RapportCelluleSectionAssistanceBloc
                                                  //     >()
                                                  //     .add(
                                                  //       RapportCelluleRequestSectionAssistanceEvent.changeAutres(
                                                  //         RequestHumaneSectionAssistance(
                                                  //           title: RequestSection.title,
                                                  //           name: item.name,
                                                  //           cout: item.count,
                                                  //         ),
                                                  //       ),
                                                  //     );
                                                  // }
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
                    );
                  },
                ),
                SizedBox(height: 9.h),
                FormNextTeps(
                  icons: Icons.work_outline,
                  title: 'Activité ',
                  description: 'Activité de la cellule ',
                  isNextForm: false,
                ),

                BlocBuilder<
                  RapportCelluleSectionAssistanceBloc,
                  RapportCelluleRequestSectionAssistanceState
                >(
                  builder: (context, state) {
                    return Container(
                      margin: EdgeInsets.only(top: 20.h, bottom: 30.h),
                      child: PrimaryButton(
                        label: 'Suivant',
                        colorText: context.appColor.primaryWhite,
                        onPressed: () {
                          context.read<RapportCelluleSectionAssistanceBloc>().add(
                            RapportCelluleRequestSectionAssistanceEvent.updateSectionId(
                              widget.id,
                            ),
                          );

                          context.read<RapportCelluleSectionAssistanceBloc>().add(
                            RapportCelluleRequestSectionAssistanceEvent.submit(),
                          );
                          // Navigator.push(context, fadeRoute(FormActivite()));
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 20.h),
             
             
             
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RequestItemRequestSection {
  final String name;
  int count;

  RequestItemRequestSection({required this.name, this.count = 0});
}

class RequestSection {
  final String title;
  final List<RequestItemRequestSection> items;

  RequestSection({required this.title, required this.items});
}

final RequestSections = [
  RequestSection(
    title: "Non baptisé",
    items: [
      RequestItemRequestSection(name: "Tout-petits"),
      RequestItemRequestSection(name: "Juniors"),
      RequestItemRequestSection(name: "Cadets"),
    ],
  ),
  RequestSection(
    title: "Nouveaux",
    items: [
      RequestItemRequestSection(name: "Tout-petits"),
      RequestItemRequestSection(name: "Juniors"),
      RequestItemRequestSection(name: "Cadets"),
    ],
  ),
  RequestSection(
    title: "Invités",
    items: [
      RequestItemRequestSection(name: "Tout-petits"),
      RequestItemRequestSection(name: "Juniors"),
      RequestItemRequestSection(name: "Cadets"),
    ],
  ),
];

final RequestSections2 = [
  RequestSection(
    title: "Formation ",
    items: [
      // RequestItemRequestSection(name: "Décisionnaires"),
      RequestItemRequestSection(name: "Nouv. En Formation DFNC"),
      RequestItemRequestSection(name: "Nouv. Bapt. En Formation DFD"),
      RequestItemRequestSection(name: "En formation niveau 2"),
    ],
  ),
  RequestSection(
    title: "Section visite",
    items: [
      RequestItemRequestSection(name: "Visites faites aux membres"),
      RequestItemRequestSection(name: "Visites faites aux disciples"),
    ],
  ),

  RequestSection(
    title: "Section Activités",
    items: [
      RequestItemRequestSection(name: "Nbre de travailleurs"),
      RequestItemRequestSection(name: "Nbre d’élèves et étudiants"),
    ],
  ),

  RequestSection(
    title: "Section Ouvriers",
    items: [
      RequestItemRequestSection(name: "Nbre d’ouvrier E.M"),
      RequestItemRequestSection(name: "Ouv. Autre dépt dirigeant E.M"),
    ],
  ),
  RequestSection(
    title: "Autres",
    items: [
      RequestItemRequestSection(name: "Agenda de l’EM (Oui ou Non)"),
      RequestItemRequestSection(name: "Décisionnaires"),
    ],
  ),
];
