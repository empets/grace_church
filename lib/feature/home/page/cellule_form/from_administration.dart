import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/custome_widget/form_filed.dart';
import 'package:grace_church/core/custome_widget/navigate.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/feature/home/overview.dart';
import 'package:grace_church/feature/home/page/bloc/rapport_cellule.dart/event/rapport_cellule_event.dart';
import 'package:grace_church/feature/home/page/bloc/rapport_cellule.dart/form_administraction_bloc.dart';
import 'package:grace_church/feature/home/page/bloc/rapport_cellule.dart/state/rapport_cellule_state.dart';
import 'package:grace_church/feature/home/page/cellule_form/form_activite.dart';
import 'package:grace_church/feature/home/page/cellule_form/form_statistic.dart';

class EditingCelluleRaport extends StatefulWidget {
  const EditingCelluleRaport({super.key, this.profile});
  final ProfileResponse? profile;

  @override
  State<EditingCelluleRaport> createState() => _EditingCelluleRaportState();
}

class _EditingCelluleRaportState extends State<EditingCelluleRaport> {
  DateTime? selectedDate;
  final TextEditingController textEditingControllerDateNaissance =
      TextEditingController();
  final TextEditingController textEditingControllerNomResponsableCellule =
      TextEditingController();

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
      setState(() {
        selectedDate = picked;
        textEditingControllerDateNaissance.text = selectedDate
            .toString()
            .substring(0, 10);
      });
      context.read<RapportCelluleSectionAdministrationBloc>().add(
        RapportCelluleSectionAdministrationEvent.changeJourCellule(
          selectedDate.toString(),
        ),
      );
    }
  }

  final sectionEffectif = [
    Section(
      title: "Effectif",
      items: [
        ItemSection(name: "Baptisé"),
        ItemSection(name: "Non baptisé"),
      ],
    ),
  ];

  void updateNombre2(SectionForm section, int value) {
    setState(() {
      section.nombre = value;

      section.rows = List.generate(
        value,
        (index) =>
            section.rows.length > index ? section.rows[index] : FormRow(),
      );
    });
  }

  SectionForm section2 = SectionForm(nombre: 1, rows: [FormRow()]);

  @override
  void initState() {
    super.initState();
    textEditingControllerNomResponsableCellule.text =
        widget.profile?.name ?? "";

    context.read<RapportCelluleSectionAdministrationBloc>().add(
      RapportCelluleSectionAdministrationEvent.changeFullNameRespoCellule(
        widget.profile?.name ?? "",
      ),
    );
    context.read<RapportCelluleSectionAdministrationBloc>().add(
      RapportCelluleSectionAdministrationEvent.changeContactRespoCellule(
        widget.profile?.contact ?? "",
      ),
    );
    context.read<RapportCelluleSectionAdministrationBloc>().add(
      RapportCelluleSectionAdministrationEvent.changeCodeCellule(
        widget.profile?.celluleCode ?? "",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<
      RapportCelluleSectionAdministrationBloc,
      RapportCelluleSectionAdministrationState
    >(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: Container(
          margin: EdgeInsets.only(top: 28.h, bottom: 0.06.sh),
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 17.h),
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
                  margin: EdgeInsets.only(top: 15.h),
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
                                        style: context.appTypographie.h2
                                            .copyWith(
                                              fontSize: 12.sp,
                                              color: context
                                                  .appColor
                                                  .primaryWhite
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
                    BlocBuilder<
                      RapportCelluleSectionAdministrationBloc,
                      RapportCelluleSectionAdministrationState
                    >(
                      builder: (context, state) {
                        return ProductionFormCustomer(
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
                        );
                      },
                    ),
                    SizedBox(height: 9.h),
                  ],
                ),

                BlocBuilder<
                  RapportCelluleSectionAdministrationBloc,
                  RapportCelluleSectionAdministrationState
                >(
                  builder: (context, state) {
                    return ProductionFormCustomer(
                      isColorBlue: state.fullNameRespoCellule.isValid
                          ? true
                          : false,
                      readOnly: false,
                      controller: textEditingControllerNomResponsableCellule,
                      // textEditingControllerDateNaissance,
                      inputLabel: "Nom complet de l'ouvrier",
                      textLabel: "Renseigner le nom complet de l'ouvrier",
                      errorText:
                          state.fullNameRespoCellule.isPure ||
                              state.fullNameRespoCellule.isValid
                          ? null
                          : '',
                      msgError: 'Veuillez renseigner ce champ',
                      sufixIcon: Icon(
                        Icons.person,
                        color: context.appColor.primaryBlue,
                      ),
                      onChanged: (value) {},
                    );
                  },
                ),
                SizedBox(height: 5.h),
                BlocBuilder<
                  RapportCelluleSectionAdministrationBloc,
                  RapportCelluleSectionAdministrationState
                >(
                  builder: (context, state) {
                    return ProductionFormCustomer(
                      isColorBlue: state.jourCellule.isValid ? true : false,
                      readOnly: true,
                      controller: textEditingControllerDateNaissance,
                      inputLabel: 'Selctionner une date',
                      textLabel: "Cliquer sur l'icon juste à droite ",
                      errorText:
                          state.jourCellule.isPure || state.jourCellule.isValid
                          ? null
                          : '',
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
                    );
                  },
                ),
                SizedBox(height: 5.h),

                BlocBuilder<
                  RapportCelluleSectionAdministrationBloc,
                  RapportCelluleSectionAdministrationState
                >(
                  builder: (context, state) {
                    return ProductionFormCustomer(
                      textInputType: TextInputType.phone,
                      isColorBlue: state.offrande.isValid ? true : false,
                      readOnly: false,
                      inputLabel: 'Offrande',
                      textLabel: "Cliquer sur l'icon juste à droite ",
                      errorText: state.offrande.isPure || state.offrande.isValid
                          ? null
                          : '',
                      msgError: 'Veuillez renseigner ce champ',
                      sufixIcon: Icon(
                        Icons.monetization_on_outlined,
                        color: context.appColor.primaryBlue,
                      ),
                      onChanged: (value) {
                        context.read<RapportCelluleSectionAdministrationBloc>().add(
                          RapportCelluleSectionAdministrationEvent.changeOffrande(
                            value,
                          ),
                        );
                      },
                    );
                  },
                ),
                SizedBox(height: 16.h),

                Row(
                  children: [
                    Icon(
                      Icons.trending_up_outlined,
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
                BlocBuilder<
                  RapportCelluleSectionAdministrationBloc,
                  RapportCelluleSectionAdministrationState
                >(
                  builder: (context, state) {
                    return Container(
                      height: 0.3.sh,
                      child: Scrollbar(
                        radius: Radius.circular(10.r),
                        child: Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: sectionEffectif.length,
                            itemBuilder: (context, index) {
                              final section = sectionEffectif[index];
                              return Card(
                                color: Colors.white,
                                elevation: 0.5.h,
                                borderOnForeground: true,
                                child: ExpansionTile(
                                  splashColor: Colors.transparent,
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
                                    section.title,
                                    style: GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  children: section.items.map((item) {
                                    if (item.name.contains("Baptisé")) {
                                      log('message ${item.name}${item.count}');
                                      context
                                          .read<
                                            RapportCelluleSectionAdministrationBloc
                                          >()
                                          .add(
                                            RapportCelluleSectionAdministrationEvent.changeNombreBaptiser(
                                              item.count.toString(),
                                            ),
                                          );
                                    } else {
                                      context
                                          .read<
                                            RapportCelluleSectionAdministrationBloc
                                          >()
                                          .add(
                                            RapportCelluleSectionAdministrationEvent.changeNombreNonBaptiser(
                                              item.count.toString(),
                                            ),
                                          );
                                    }
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
                    );
                  },
                ),
                Column(
                  children: [
                    ProductionFormCustomer(
                      textLabel: "Nombre de disciple",
                      msgError: "Veuillez entrer le nombre de disciple",
                      inputLabel: "Nombre de disciple",
                      errorText: "",
                      textInputType: TextInputType.phone,
                      onChanged: (value) {
                        // TODO: Handle the value change
                        final number = int.tryParse(value) ?? 1;
                        updateNombre2(section2, number);
                      },
                    ),
                    BlocBuilder<RapportCelluleSectionAdministrationBloc, RapportCelluleSectionAdministrationState>(
                      builder: (context, state) {
                        return Column(
                          children: List.generate(section2.rows.length, (
                            index,
                          ) {
                            final row = section2.rows[index];
                           
                            

                            return Container(
                              margin: EdgeInsets.only(bottom: 16.h),
                              child: Card(
                                color: Colors.white,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 16.h,
                                  ),
                                  child: Column(
                                    children: [
                                      //  Icon(Icons.file_open_rounded),:
                                      Text(
                                        " Membre visité ${index + 1}",
                                        style: context.appTypographie.body
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),

                                      TextField(
                                        decoration: InputDecoration(
                                          labelText: "Nom",
                                        ),
                                      onChanged: (val) {
                                        final bloc = context.read<RapportCelluleSectionAdministrationBloc>();
                                        final list = List<DiscipleCellule>.from(
                                          bloc.state.discipleCelluleList,
                                        );
                                        // sécurité si liste vide
                                        if (list.length <= index) {
                                          list.addAll(
                                            List.generate(
                                              index - list.length + 1,
                                              (_) => DiscipleCellule(fullName: '', contact: ''),
                                            ),
                                          );
                                        }
                                        list[index] = list[index].copyWith(fullName: val);

                                        bloc.add(
                                          RapportCelluleSectionAdministrationEvent
                                              .changeNombreListDicipleCellule(list),
                                        );
                                      },
                                      ),

                                      TextField(
                                        decoration: InputDecoration(
                                          labelText: "Problème",
                                        ),
                                        onChanged: (val) {
                                          row.probleme = val;
                                          log('Problème: $val');
                                           context.read<RapportCelluleSectionAdministrationBloc>().add(RapportCelluleSectionAdministrationEvent.changeNombreListDicipleCellule(List.generate( section2.rows.length, (index) => DiscipleCellule(fullName: val, contact: ""))));
                                          //  context.read<RapportCelluleSectionAdministrationBloc>().add(RapportCelluleSectionAdministrationEvent.changeNombreListDicipleCellule([DiscipleCellule(fullName: val, contact: '000' )]));

                                        },
                                      ),

                                      TextField(
                                        decoration: InputDecoration(
                                          labelText: "Recommandation",
                                        ),
                                        onChanged: (val) {
                                          row.recommandation = val;
                                          log('Recommandation: $val');
                                        },
                                      ),

                                      SizedBox(height: 16),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  ],
                ),

                SizedBox(height: 9.h),

                FormNextTeps(
                  icons: Icons.trending_up_sharp,
                  title: 'Assistance ',
                  description: 'Personne présente a la cellule',
                  isNextForm: false,
                ),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.h),
                  child: PrimaryButton(
                    label: 'Suivant',
                    colorText: context.appColor.primaryWhite,
                    onPressed: () {
                      Navigator.push(context, fadeRoute(FormStatistic()));
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
