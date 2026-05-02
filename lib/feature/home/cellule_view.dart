import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
import 'package:grace_church/feature/home/page/bloc/departement/eglise_maison/cellule_bloc.dart';
import 'package:grace_church/feature/home/page/bloc/departement/eglise_maison/event/cellule_event.dart';
import 'package:grace_church/gen/assets.gen.dart';

class CelluleView extends StatefulWidget {
  const CelluleView({super.key, required this.cellueId});
  final String cellueId;

  @override
  State<CelluleView> createState() => _CelluleViewState();
}

class _CelluleViewState extends State<CelluleView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CelluleBloc(getCelluleUsercase: getIt<GetCelluleUsercase>())
            ..add(CelluleEvent.fetchByCriteria(celluleId: widget.cellueId)),
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

                            // Positioned(
                            //   right: 0.30.sw,
                            //   bottom: 5.w,
                            //   child: GestureDetector(
                            //     child: Container(
                            //       margin: EdgeInsets.only(top: 4.h),
                            //       padding: const EdgeInsets.all(10),
                            //       decoration: BoxDecoration(
                            //         color: context.appColor.primaryLightBlue,
                            //         shape: BoxShape.circle,
                            //       ),
                            //       child: Icon(Icons.edit, size: 13.h),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),

                        SizedBox(height: 14.h),

                        CustomeText(
                          text: state.data.first.nom,
                          style: context.appTypographie.button.copyWith(
                            color: context.appColor.primaryGrayDark,
                            fontSize: 16.sp,
                          ),
                        ),
                        CustomeText(
                          text: state.data.first.responsableCellule,
                          style: context.appTypographie.button.copyWith(
                            color: context.appColor.primaryBlue,
                            fontSize: 14.sp,
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          child: Row(
                            children: [
                              Flexible(
                                flex: 3,
                                child: PrimaryButton(
                                  label: "Contacter",
                                  fontSize: 13.sp,
                                  iconLeading: true,
                                  colorText: context.appColor.primaryWhite,
                                  backgroundColor: context.appColor.primaryBlue,
                                  leadingIcon: Icons.chat_bubble_rounded,
                                  onPressed: () {},
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
                                  onPressed: () {},
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
                                    text: "Lieu de réunion",
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
                                          text: state.data.first.adresse,
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
                                               Navigator.of(context)
                                                .push<dynamic>(
                                                  fadeRoute( FormGeographie(lat: state.data.first.latitude.toString(), lng: state.data.first.longitude.toString())),
                                                );
                                            },
                                            child: CustomeText(
                                              text: "Voir plus",
                                              style: context.appTypographie.button
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
                          margin: EdgeInsets.symmetric(vertical: 10.h),
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
                              CustomeText(
                                text: "TOUT VOIR",
                                style: context.appTypographie.button.copyWith(
                                  color: context.appColor.primaryBlue,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
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
                                      text: "Temps",
                                      style: context.appTypographie.button
                                          .copyWith(
                                            color: context.appColor.primaryBlue,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                    CustomeText(
                                      text: "2h30",
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
                                    text: "Chaque vendredi de la semaine",
                                    style: context.appTypographie.button
                                        .copyWith(
                                          color:
                                              context.appColor.primaryGrayDark,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w800,
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
                                        text: "19h00 - 21h00",
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
                              Spacer(),
                              Icon(
                                Icons.chevron_right,
                                color: context.appColor.primaryGray500,
                                size: 24.sp,
                              ),
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 14.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomeText(
                                text: "Menbres de la cellule",
                                style: context.appTypographie.button.copyWith(
                                  color: context.appColor.primaryGrayDark,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(3.h),
                                decoration: BoxDecoration(
                                  color: context.appColor.primaryLightBlue,
                                  shape: BoxShape.circle,
                                ),
                                child: CustomeText(
                                  text: "12",
                                  style: context.appTypographie.button.copyWith(
                                    color: context.appColor.primaryGrayDark,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 17.h),
                        Container(
                          height: 0.1.sh,

                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10.w),
                                    padding: EdgeInsets.all(5.r),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            context.appColor.primaryLightBlue,
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
                                        height: 40.h,
                                        width: 40.h,
                                      ),
                                    ),
                                  ),
                                  CustomeText(
                                    text: "John Doe",
                                    style: context.appTypographie.button
                                        .copyWith(
                                          color:
                                              context.appColor.primaryGray500,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w800,
                                        ),
                                  ),
                                ],
                              );
                            },
                          ),
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
        ),
      ),
    );
  }
}
