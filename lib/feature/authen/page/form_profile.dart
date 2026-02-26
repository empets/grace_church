import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/custome_widget/form_filed.dart';
import 'package:grace_church/core/custome_widget/navigate.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/feature/authen/page/bloc/create_compte/event/event_create_compte.dart';
import 'package:grace_church/feature/authen/page/bloc/create_compte/form_profile_bloc.dart';
import 'package:grace_church/feature/authen/page/bloc/create_compte/state/state_create_compte.dart';
import 'package:grace_church/feature/authen/page/form_geographie.dart';
import 'package:grace_church/feature/authen/page/form_social_professionnal.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';

class FormProfile extends StatefulWidget {
  const FormProfile({super.key});

  @override
  State<FormProfile> createState() => _FormProfileState();
}

class _FormProfileState extends State<FormProfile> {
  DateTime? selectedDate;

  TextEditingController textEditingController = TextEditingController();

  Future<void> _openCalendar() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),

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
        textEditingController.text = selectedDate.toString().substring(0, 10);
      });
      context.read<FormProfileBloc>().add(
        EventCreateCompteProfile.changeDateNaissance(selectedDate.toString()),
      );
    }
  }

  File? imageFile;
  late String profileImage = '';
  Future<File?> pickImage() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null)
      return null;
    else {
      setState(() {
        imageFile = File(image.path);
        profileImage = image.path;
      });
      if (profileImage.trim().isNotEmpty) {
        context.read<FormProfileBloc>().add(
          EventCreateCompteProfile.changeProfileImage(profileImage),
        );
      }
      return File(image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider.value(value: context.read<FormProfileBloc>())],
      child: BlocListener<FormProfileBloc, CreateCompteProfileState>(
        listener: (context, state) {
          if (state.status.isSuccess) {
            Navigator.of(
              context,
            ).push(fadeRoute(const FormSocialProfessionnal()));
          }
        },
        child: Scaffold(
          backgroundColor: Colors.grey.shade50,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
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
                            child: imageFile != null
                                ? ClipOval(
                                    child: Image.file(
                                      imageFile!,

                                      fit: BoxFit.cover,
                                      height: 0.14.sh,
                                      width: 0.14.sh,
                                    ),
                                  )
                                : ClipOval(
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

                        Positioned(
                          right: 0.30.sw,
                          bottom: 5.w,
                          child:
                              BlocBuilder<
                                FormProfileBloc,
                                CreateCompteProfileState
                              >(
                                builder: (context, state) {
                                  return GestureDetector(
                                    onTap: pickImage,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 4.h),
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color:
                                            context.appColor.primaryLightBlue,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(Icons.edit, size: 13.h),
                                    ),
                                  );
                                },
                              ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 15.h),

                        CustomeText(
                          text: 'Mettre a jour mon profile',
                          style: context.appTypographie.body.copyWith(
                            color: context.appColor.primaryGray500,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        CustomeText(
                          text: 'Etape 1: Identité personnel',
                          style: context.appTypographie.small.copyWith(
                            color: context.appColor.primaryBlue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 19.h),
                      ],
                    ),

                    BlocBuilder<FormProfileBloc, CreateCompteProfileState>(
                      builder: (context, state) {
                        return ProductionFormCustomer(
                          letSpace: [],
                          inputLabel: 'Nom Comple',
                          textLabel: 'Ex: jean-Baptise Koffi',
                          errorText: state.name.isPure || state.name.isValid
                              ? null
                              : '',
                          msgError: 'Veuillez renseigner ce champ',
                          prefixIcon: Icon(
                            Icons.person,
                            color: context.appColor.primaryGray500.withValues(
                              alpha: 0.6,
                            ),
                          ),
                          onChanged: (name) {
                            context.read<FormProfileBloc>().add(
                              EventCreateCompteProfile.changeName(name),
                            );
                          },
                        );
                      },
                    ),

                    SizedBox(height: 8.h),

                    BlocBuilder<FormProfileBloc, CreateCompteProfileState>(
                      builder: (context, state) {
                        return ProductionFormCustomer(
                          inputLabel: 'Email',
                          textLabel: 'Ex: emma@gmail.com',
                          errorText: state.email.isPure || state.email.isValid
                              ? null
                              : '',
                          msgError: 'Veuillez renseigner ce champ',
                          prefixIcon: Icon(
                            Icons.email,
                            color: context.appColor.primaryGray500.withValues(
                              alpha: 0.6,
                            ),
                          ),
                          onChanged: (email) {
                            context.read<FormProfileBloc>().add(
                              EventCreateCompteProfile.changeEmail(email),
                            );
                          },
                        );
                      },
                    ),

                    SizedBox(height: 8.h),

                    BlocBuilder<FormProfileBloc, CreateCompteProfileState>(
                      builder: (context, state) {
                        return ProductionFormCustomer(
                          textInputType: TextInputType.number,
                          inputLabel: 'Contact ou numéro whatsapp',
                          textLabel: 'Ex: 0788884115',
                          errorText:
                              state.contact.isPure || state.contact.isValid
                              ? null
                              : '',
                          msgError: 'Veuillez renseigner ce champ',
                          prefixIcon: Icon(
                            Icons.phone,
                            color: context.appColor.primaryGray500.withValues(
                              alpha: 0.6,
                            ),
                          ),
                          onChanged: (contact) {
                            context.read<FormProfileBloc>().add(
                              EventCreateCompteProfile.changeContact(contact),
                            );
                          },
                        );
                      },
                    ),

                    SizedBox(height: 8.h),

                    BlocBuilder<FormProfileBloc, CreateCompteProfileState>(
                      builder: (context, state) {
                        return ProductionFormCustomer(
                          readOnly: true,
                          controller: textEditingController,
                          inputLabel: 'Date de naissance',
                          textLabel: "Cliquer sur l'icon juste à droite ",
                          errorText:
                              state.dateNaissance.isPure ||
                                  state.dateNaissance.isValid
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

                    SizedBox(height: 8.h),
                    BlocBuilder<FormProfileBloc, CreateCompteProfileState>(
                      builder: (context, state) {
                        return ProductionFormCustomer(
                          inputLabel: 'Nationalité',
                          textLabel: 'Ex: Ivoirienne',
                          errorText:
                              state.nationalite.isPure ||
                                  state.nationalite.isValid
                              ? null
                              : '',
                          msgError: 'Veuillez renseigner ce champ',
                          prefixIcon: Icon(
                            Icons.flag,
                            color: context.appColor.primaryGray500.withValues(
                              alpha: 0.6,
                            ),
                          ),
                          onChanged: (nationnalite) {
                            context.read<FormProfileBloc>().add(
                              EventCreateCompteProfile.changeNationalite(
                                nationnalite,
                              ),
                            );
                          },
                        );
                      },
                    ),

                    SizedBox(height: 8.h),
                    BlocBuilder<FormProfileBloc, CreateCompteProfileState>(
                      builder: (context, state) {
                        return ProductionFormCustomer(
                          readOnly: true,
                          inputLabel: 'Quartier/District',
                          textLabel:
                              "Cliquer sur l'icon affichier votre position",
                          errorText:
                              state.zoneResidence.isPure ||
                                  state.zoneResidence.isValid
                              ? null
                              : '',
                          msgError: 'Veuillez renseigner ce champ',
                          sufixIcon: IconButton(
                            onPressed: () {
                              Navigator.of(
                                context,
                              ).push(fadeRoute(const FormGeographie()));
                            },
                            icon: Icon(
                              Icons.location_on_rounded,
                              color: context.appColor.primaryGray500.withValues(
                                alpha: 0.6,
                              ),
                            ),
                          ),
                          onChanged: (zoneResidence) {
                            context.read<FormProfileBloc>().add(
                              EventCreateCompteProfile.changeZoneResidence(
                                zoneResidence,
                              ),
                            );
                          },
                        );
                      },
                    ),

                    BlocBuilder<FormProfileBloc, CreateCompteProfileState>(
                      builder: (context, state) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 8.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 0.03.sh),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: CustomeText(
                                  text: 'Prochaine étape',
                                  style: context.appTypographie.subtitle
                                      .copyWith(
                                        color: context.appColor.primaryGray500,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    BlocBuilder<FormProfileBloc, CreateCompteProfileState>(
                      builder: (context, state) {
                        return FormNextTeps(
                          icons: Icons.badge_rounded,
                          title: 'Profile Socio-Professionnel ',
                          description: 'Statut, Emploi ou Etudes',
                          isNextForm: state.isValide,
                        );
                      },
                    ),
                    SizedBox(height: 9.h),

                    Container(
                      margin: EdgeInsets.only(top: 18.h),
                      child:
                          BlocBuilder<
                            FormProfileBloc,
                            CreateCompteProfileState
                          >(
                            builder: (context, state) {
                              return PrimaryButton(
                                isLoading: state.status.isInProgress,
                                label: 'Continuer',
                                icon: Icons.arrow_forward_rounded,
                                backgroundColor:
                                    state.status.isInProgress || state.isValide
                                    ? context.appColor.primaryBlue
                                    : context.appColor.primaryLightBlue,
                                colorText: context.appColor.primaryWhite,
                                onPressed: state.status.isInProgress
                                    ? null
                                    : () {
                                        FocusScope.of(context).unfocus();
                                        context.read<FormProfileBloc>().add(
                                          EventCreateCompteProfile.submit(),
                                        );
                                      },
                              );
                            },
                          ),
                    ),
                  ],
                ),
              ),
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

class ImageShimmer extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;

  const ImageShimmer({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
