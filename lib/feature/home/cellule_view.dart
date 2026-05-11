import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

import 'package:grace_church/core/alert/app_alerte.dart';
import 'package:grace_church/core/bloc_state/bloc_state.dart';
import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/custome_widget/navigate.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/core/extension/extention.dart';
import 'package:grace_church/core/injection/injection_container.dart';
import 'package:grace_church/feature/authen/page/form_geographie.dart';
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/feature/home/domaine/usercase/get_cellule_usercase.dart';
import 'package:grace_church/feature/home/domaine/usercase/get_list_secteur.dart';
import 'package:grace_church/feature/home/domaine/usercase/get_list_zone.dart';
import 'package:grace_church/feature/home/domaine/usercase/get_rapport_cellule_usercase.dart';
import 'package:grace_church/feature/home/domaine/usercase/rapport_cellule_admine_usercase.dart';
import 'package:grace_church/feature/home/page/bloc/departement/eglise_maison/cellule_bloc.dart';
import 'package:grace_church/feature/home/page/bloc/departement/eglise_maison/event/cellule_event.dart';
import 'package:grace_church/feature/home/page/bloc/departement/eglise_maison/get_responsable_secteur.dart';
import 'package:grace_church/feature/home/page/bloc/departement/eglise_maison/get_responsable_zone.dart';
import 'package:grace_church/feature/home/page/bloc/rapport_cellule.dart/event/rapport_cellule_event.dart';
import 'package:grace_church/feature/home/page/bloc/rapport_cellule.dart/form_administraction_bloc.dart';
import 'package:grace_church/feature/home/page/bloc/rapport_cellule.dart/get_rapport_cellule_bloc.dart';
import 'package:grace_church/feature/home/page/cellule_form/from_administration.dart';
import 'package:grace_church/gen/assets.gen.dart';

class CelluleView extends StatefulWidget {
  const CelluleView({
    super.key,
    required this.cellueId,
    required this.profileState,
  });
  final String cellueId;
  final ApiState<ProfileResponse> profileState;

  @override
  State<CelluleView> createState() => _CelluleViewState();
}

late bool isResponsableCellule = false;

class _CelluleViewState extends State<CelluleView> {
  Future<void> callSupport({required String number}) async {
    final status = await Permission.phone.request();

    if (status.isGranted) {
      await FlutterPhoneDirectCaller.callNumber(number);
    }
  }

  Future<void> shareCelluleLatLong({
    required double lat,
    required double long,
  }) async {
    await SharePlus.instance.share(
      ShareParams(
        text:
            'https://www.google.com/maps/@$lat,${long}z?entry=ttu&g_ep=EgoyMDI2MDUwNi4wIKXMDSoASAFQAw%3D%3D',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CelluleBloc(getCelluleUsercase: getIt<GetCelluleUsercase>())
                ..add(CelluleEvent.fetchByCriteria(celluleId: widget.cellueId)),
        ),

        BlocProvider(
          create: (context) => GetRapportCelluleBloc(
            getRapportCelluleUsercase: getIt<GetRapportCelluleUsercase>(),
          ),
        ),
      ],
      child: BlocListener<CelluleBloc, ApiState<List<CelluleResponse>>>(
        listener: (context, state) {
          if (state is FailedState<List<CelluleResponse>>) {
            AppAlert.showError(
              context,
              state.message.getOrEmpty(),
              showOnTop: true,
            );
          }
        },
        child: Scaffold(
          backgroundColor: Colors.grey.shade50,
          appBar: AppBar(backgroundColor: Colors.grey.shade50),
          body: BlocBuilder<CelluleBloc, ApiState<List<CelluleResponse>>>(
            builder: (context, state) {
              if (state is LoadState<List<CelluleResponse>>) {
                return Column(
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
                      ),
                    ),
                  ],
                );
              }

              if (state is SuccessState<List<CelluleResponse>>) {
                return SafeArea(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            if (widget.profileState
                                is SuccessState<ProfileResponse>) ...[
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  padding: EdgeInsets.all(5.r),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: context.appColor.primaryLightBlue,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipOval(
                                    child: Image.network(
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                            return child;
                                          },
                                      errorBuilder: (_, __, ___) => ClipOval(
                                        child: Image.network(
                                          "yAssets.icons.profileAvatarPlaceholderLarge .path",
                                          fit: BoxFit.contain,
                                          height: 0.08.sh,
                                          width: 0.08.sh,
                                        ),
                                      ),
                                      (widget.profileState
                                              as SuccessState<ProfileResponse>)
                                          .data
                                          .profileImage,
                                      fit: BoxFit.cover,
                                      height: 0.1.sh,
                                      width: 0.1.sh,
                                    ),
                                  ),
                                ),
                              ),
                            ] else ...[
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  padding: EdgeInsets.all(5.r),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: context.appColor.primaryLightBlue,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipOval(
                                    child: Image.network(
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                            return child;
                                          },
                                      errorBuilder: (_, __, ___) => ClipOval(
                                        child: Image.network(
                                          "yAssets.icons.profileAvatarPlaceholderLarge .path",
                                          fit: BoxFit.contain,
                                          height: 0.08.sh,
                                          width: 0.08.sh,
                                        ),
                                      ),
                                      "https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_640.png",

                                      fit: BoxFit.cover,
                                      height: 0.1.sh,
                                      width: 0.1.sh,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),

                        SizedBox(height: 10.h),

                        if (widget.profileState
                            is SuccessState<ProfileResponse>) ...[
                          CustomeText(
                            text:
                                (widget.profileState
                                        as SuccessState<ProfileResponse>)
                                    .data
                                    .name,
                            style: context.appTypographie.button.copyWith(
                              color: context.appColor.primaryGrayDark,
                              fontSize: 16.sp,
                            ),
                          ),

                          CustomeText(
                            text:
                                (widget.profileState
                                        as SuccessState<ProfileResponse>)
                                    .data
                                    .email,
                            style: context.appTypographie.button.copyWith(
                              color: context.appColor.primaryBlue,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],

                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          child: Row(
                            children: [
                              Flexible(
                                flex: 2,
                                child: PrimaryButton(
                                  label: "Contactez le responsable",
                                  fontSize: 13.sp,
                                  iconLeading: true,
                                  colorText: context.appColor.primaryWhite,
                                  backgroundColor: context.appColor.primaryBlue,
                                  onPressed: () => callSupport(
                                    number: state
                                        .data
                                        .first
                                        .contactResponsableCellule,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Flexible(
                                child: PrimaryButton(
                                  label: "",
                                  colorText: context.appColor.primaryWhite,
                                  backgroundColor: context
                                      .appColor
                                      .primaryLightBlue
                                      .withValues(alpha: 0.5),
                                  icon: Icons.share,
                                  iconColor: context.appColor.primaryBlue,
                                  fontSize: 13.sp,
                                  onPressed: () {
                                    shareCelluleLatLong(
                                      lat: state.data.first.latitude,
                                      long: state.data.first.longitude,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.symmetric(vertical: 4.h),
                          padding: EdgeInsets.symmetric(
                            vertical: 6.h,
                            horizontal: 9.w,
                          ),
                          decoration: BoxDecoration(
                            color: context.appColor.primaryLightBlue.withValues(
                              alpha: 0.3,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: context.appColor.primaryBlue,
                                  ),
                                  CustomeText(
                                    text: "Lieu : ${state.data.first.adresse}",
                                    style: context.appTypographie.button
                                        .copyWith(
                                          color:
                                              context.appColor.primaryGrayDark,
                                          fontSize: 14.sp,
                                        ),
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(25.r),
                                    child: Image.asset(
                                      assets.images.image.path,
                                      width: 100.h,
                                      height: 100.h,
                                    ),
                                  ),
                                  SizedBox(width: 15.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomeText(
                                        text: "Nom de la cellule",
                                        style: context.appTypographie.button
                                            .copyWith(
                                              color: context
                                                  .appColor
                                                  .primaryGrayDark,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w800,
                                            ),
                                      ),
                                      Container(
                                        width: 0.5.sw,
                                        child: CustomeText(
                                          text: state.data.first.nom,
                                          style: context.appTypographie.button
                                              .copyWith(
                                                color: context
                                                    .appColor
                                                    .primaryGray500,
                                                fontSize: 14.sp,
                                              ),
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(
                                                context,
                                              ).push<dynamic>(
                                                fadeRoute(
                                                  FormGeographie(
                                                    lat: state
                                                        .data
                                                        .first
                                                        .latitude
                                                        .toString(),
                                                    lng: state
                                                        .data
                                                        .first
                                                        .longitude
                                                        .toString(),
                                                    adresse: state
                                                        .data
                                                        .first
                                                        .adresse,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: CustomeText(
                                              text: "Voir plus",
                                              style: context
                                                  .appTypographie
                                                  .button
                                                  .copyWith(
                                                    color: context
                                                        .appColor
                                                        .primaryBlue,
                                                    fontSize: 14.sp,
                                                  ),
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          Icon(
                                            Icons
                                                .picture_in_picture_alt_outlined,
                                            color: context.appColor.primaryBlue,
                                            size: 14.sp,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.symmetric(vertical: 6.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomeText(
                                text: "Prochaines réunions",
                                style: context.appTypographie.button.copyWith(
                                  color: context.appColor.primaryGrayDark,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(width: 10.w),
                            ],
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 9.h,
                            horizontal: 10.w,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: context.appColor.primaryGray500.withValues(
                                alpha: 0.3,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 7.w,
                                  vertical: 7.h,
                                ),
                                decoration: BoxDecoration(
                                  color: context.appColor.primaryLightBlue,
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                child: Column(
                                  children: [
                                    CustomeText(
                                      text: "JO",
                                      style: context.appTypographie.button
                                          .copyWith(
                                            color: context.appColor.primaryBlue,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                    CustomeText(
                                      text: "UR",
                                      style: context.appTypographie.button
                                          .copyWith(
                                            color: context.appColor.primaryBlue,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomeText(
                                    text:
                                        "Chaque ${state.data.first.jourCellule} de la semaine",
                                    style: context.appTypographie.button
                                        .copyWith(
                                          color:
                                              context.appColor.primaryGrayDark,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time_filled_outlined,
                                        color: context.appColor.primaryGray500,
                                        size: 16.sp,
                                      ),
                                      SizedBox(width: 5.w),
                                      CustomeText(
                                        text:
                                            "A partir de ${state.data.first.heureCellule}h",
                                        style: context.appTypographie.button
                                            .copyWith(
                                              color: context
                                                  .appColor
                                                  .primaryGray500,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Prédication de la semaine",
                            style: context.appTypographie.body.copyWith(
                              fontSize: 14,
                              color: context.appColor.primaryGrayDark,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        BlocBuilder<
                          GetRapportCelluleBloc,
                          ApiState<List<RapportCelluleResponse>>
                        >(
                          builder: (context, stateRapport) {
                            if (stateRapport
                                is SuccessState<List<RapportCelluleResponse>>) {
                              stateRapport.data.sort(
                                (a, b) => b.dateActivitySubmited.compareTo(
                                  a.dateActivitySubmited,
                                ),
                              );
                              final item = stateRapport.data.first;
                              return Container(
                                height: 0.16.sh,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomeText(
                                        text: item.resumerPredication ?? '',
                                        style: context.appTypographie.body
                                            .copyWith(
                                              fontSize: 12,
                                              color: context
                                                  .appColor
                                                  .primaryGray500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }

                            return Container();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }

              return Column(
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
                    child:
                        BlocBuilder<
                          CelluleBloc,
                          ApiState<List<CelluleResponse>>
                        >(
                          builder: (context, state) {
                            return PrimaryButton(
                              label: "Réessayer",
                              colorText: Colors.white,
                              fontSize: 13.sp,
                              backgroundColor: context.appColor.primaryBlue,
                              borderRadius: 14.r,
                              onPressed: () {
                                context.read<CelluleBloc>().add(
                                  CelluleEvent.fetchByCriteria(
                                    celluleId: widget.cellueId,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                  ),
                ],
              );
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: BlocBuilder<CelluleBloc, ApiState<List<CelluleResponse>>>(
            builder: (context, listCelluleState) {
              if (listCelluleState is SuccessState<List<CelluleResponse>>) {
                if (widget.profileState is SuccessState<ProfileResponse>) {
                  isResponsableCellule = listCelluleState.data.any((element) {
                    return element.responsableCelluleId
                        .trim()
                        .toLowerCase()
                        .contains(
                          (widget.profileState as SuccessState<ProfileResponse>)
                              .data
                              .menberId
                              .trim()
                              .toLowerCase(),
                        );
                  });
                }
              }

              return isResponsableCellule
                  ? Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      child: FloatingActionButton(
                        backgroundColor: context.appColor.primaryBlue
                            .withValues(alpha: 0.5),
                        onPressed: () {
                          Navigator.of(context).push(
                            fadeRoute(
                              MultiBlocProvider(
                                providers: [
                                  BlocProvider(
                                    create: (context) =>
                                        RapportCelluleRequestSectionAdministrationBloc(
                                          sendRapportCelluleStepAdministrationUsercase:
                                              getIt<
                                                SendRapportCelluleStepAdministrationUsercase
                                              >(),
                                        ),
                                  ),
                                  BlocProvider(
                                    create: (context) => GetSecteurBloc(
                                      getListSecteurUsercase:
                                          getIt<GetListSecteurUsercase>(),
                                    )..add(CelluleEvent.fetch()),
                                  ),
                                  BlocProvider(
                                    create: (context) => GetZoneBloc(
                                      getListZoneUsercase:
                                          getIt<GetListZoneUsercase>(),
                                    )..add(CelluleEvent.fetch()),
                                  ),
                                ],
                                child: EditingCelluleRaport(
                                  profile:
                                      (widget.profileState
                                              as SuccessState<ProfileResponse>)
                                          .data,
                                ),
                              ),
                            ),
                          );
                        },
                        child: Badge(
                          child: Icon(Icons.edit, color: Colors.white),
                          backgroundColor: Colors.transparent,
                          label: Text(
                            '',
                            style: context.appTypographie.body.copyWith(
                              color: Colors.white,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
