import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grace_church/core/alert/app_alerte.dart';
import 'package:grace_church/core/bloc_state/bloc_state.dart';
import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/custome_widget/form_filed.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/core/extension/extention.dart';
import 'package:grace_church/core/injection/injection_container.dart';
import 'package:grace_church/core/navigator_widget/custome_app_bar.dart';
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/feature/home/domaine/usercase/get_rapport_cellule_usercase.dart';
import 'package:grace_church/feature/home/page/bloc/rapport_cellule.dart/event/rapport_cellule_event.dart';
import 'package:grace_church/feature/home/page/bloc/rapport_cellule.dart/get_rapport_cellule_bloc.dart';
import 'package:grace_church/feature/home/page/cellule/rapport_cellule_pdf_view.dart';
import 'package:grace_church/gen/assets.gen.dart';

class HistoryRapportView extends StatefulWidget {
  HistoryRapportView({super.key, required this.profileId});
  final String profileId;

  @override
  State<HistoryRapportView> createState() => _HistoryRapportViewState();
}

class _HistoryRapportViewState extends State<HistoryRapportView> {


   void sortRapports(List<RapportCelluleResponse> rapportList) {
    if(rapportList.last.formAdministrationIsSubmit.toLowerCase() ==
        'true'){
   return   rapportList.sort((a, b) => b.formAdministrationSubmitDate.compareTo(a.formAdministrationSubmitDate));
    }
    else if(rapportList.last.formAssistanceIsSubmit.toLowerCase() ==
        'true'){
    return  rapportList.sort((a, b) => b.formAssistanceSubmitDate.compareTo(a.formAssistanceSubmitDate));
    }
    else if(rapportList.last.formActivityIsSubmit.toLowerCase() ==
        'true'){
   return   rapportList.sort((a, b) => b.formActivitySubmitDate.compareTo(a.formActivitySubmitDate));
    }
  }










  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetRapportCelluleBloc(
            getRapportCelluleUsercase: getIt<GetRapportCelluleUsercase>(),
          )..add(
            FecthDataEvent.fetchDataById(
              responsableCelluleId: widget.profileId,
            ),
          ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          leading: IconButton(
            icon: SvgPicture.asset(assets.images.arrowBack.path),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: CustomeHeaderTitle(title: "Historique des rapports"),
        ),
        body: BlocBuilder<GetRapportCelluleBloc, ApiState<List<RapportCelluleResponse>>>(
          builder: (context, rapportListState) {
            if (rapportListState is LoadState<List<RapportCelluleResponse>>) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: CircularProgressIndicator.adaptive(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          context.appColor.primaryBlue,
                        ),
                        backgroundColor: context.appColor.primaryGray500
                            .withValues(alpha: 0.3),
                      ),
                    ),
                    SizedBox(height: 19.h),
                    Text(
                      "Recupération des données en cours...",
                      style: context.appTypographie.body.copyWith(
                        fontSize: 12.sp,
                        color: context.appColor.primaryBlue,
                        // color: Colors.grey.shade200
                      ),
                    ),
                  ],
                ),
              );
            } else if (rapportListState
                is SuccessState<List<RapportCelluleResponse>>) {
              if (rapportListState.data.isEmpty) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        assets.images.rapportEmpty.path,
                        height: 0.2.sh,
                      ),
                      SizedBox(height: 16.h),
                      Center(
                        child: Text(
                          "Vous n'avez aucun rapport ",
                          style: context.appTypographie.body.copyWith(
                            fontSize: 12.sp,
                            color: context.appColor.primaryBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }

              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductionFormCustomer(
                        letSpace: [],
                        textLabel: "Rechercher un rapport",
                        errorText: null,
                        prefixIcon: Icon(
                          Icons.search,
                          color: context.appColor.primaryGray700,
                        ),
                        msgError: "",
                        inputLabel: "",
                        onChanged: (value) {},
                      ),
                      SizedBox(height: 16.h),
               

                      ...List.generate(rapportListState.data.length, (index) {
                        final rapport = rapportListState.data[index];
                        sortRapports(rapportListState.data);
                        
                         
                        return Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // click if rapport.formSuggestionIsSubmit contains "success" then navigate to rapport detail
                                if (rapport.formSuggestionIsSubmit.contains(
                                  "true",
                                )) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          RapportCellulePDFView(
                                            rapportCellule: rapport,
                                          ),
                                    ),
                                  );
                                }
                                if (!rapport.formSuggestionIsSubmit.contains(
                                  "true",
                                )) {
                                  AppAlert.showError(
                                    context,
                                    "Impossible de voir le détail du rapport veuillez le finaliser",
                                    showOnTop: true,
                                  );
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 12.h,
                                  horizontal: 16.w,
                                ),
                                margin: EdgeInsets.only(bottom: 8.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.r),
                                  border: Border.all(
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "•",
                                              style: context.appTypographie.body
                                                  .copyWith(
                                                    fontSize: 14.sp,
                                                    color:
                                                        AppGeneretedColors.randomColor(),
                                                  ),
                                            ),
                                            Text(
                                              rapport.formSuggestionIsSubmit
                                                      .contains("true")
                                                  ? "• ${formatDate(rapport.formSuggestionSubmitDate)}"
                                                  : "• En cours",
                                              style: context.appTypographie.body
                                                  .copyWith(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: context
                                                        .appColor
                                                        .primaryGray700,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 4.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Rapport ${rapport.formSuggestionIsSubmit.contains("true") ? "terminé voir les détails" : "en cours"}",
                                              style: context.appTypographie.body
                                                  .copyWith(
                                                    fontSize: 12.sp,
                                                    color: context
                                                        .appColor
                                                        .primaryGray700,
                                                  ),
                                            ),
                                            SizedBox(width: 8.w),
                                            if (rapport.formSuggestionIsSubmit
                                                .contains("true")) ...[
                                              Column(
                                                children: [
                                                  SizedBox(height: 4.h),
                                                  Icon(
                                                    Icons.remove_red_eye,
                                                    size: 12.h,
                                                    color: context
                                                        .appColor
                                                        .primaryGray700,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(8.w),
                                decoration: BoxDecoration(
                                  color: context.appColor.primaryGray700,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child:
                                    rapport.formSuggestionIsSubmit.contains(
                                      "true",
                                    )
                                    ? Icon(
                                        Icons.lock_open,
                                        size: 12,
                                        color: Colors.white,
                                      )
                                    : const Icon(
                                        Icons.lock,
                                        size: 12,
                                        color: Colors.white,
                                      ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              );
            }

            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: SvgPicture.asset(assets.images.problemeRequest.path),
                  ),
                  SizedBox(height: 28.h),

                  Text(
                    "Une erreur est survenue !",
                    style: context.appTypographie.body.copyWith(
                      color: context.appColor.primaryBlue,
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 0.17.sw),
                    child: PrimaryButton(
                      label: "Réessayer",
                      colorText: Colors.white,
                      fontSize: 13.sp,
                      backgroundColor: context.appColor.primaryBlue,
                      borderRadius: 14.r,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
