import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_church/core/custome_widget/button.dart';
import 'package:grace_church/core/extension/custome_extension.dart';

class MaboxView extends StatefulWidget {
  const MaboxView({super.key});

  @override
  State<MaboxView> createState() => _MaboxViewState();
}


class _MaboxViewState extends State<MaboxView> {
  @override
  Widget build(BuildContext context) {
    final steper = <Map<String, String>>[
      {
        'title': 'Etape 1',
        'description': 'Test internet',
        'status': 'en_cours',
      },
      {'title': 'Etape 2', 'description': 'Test Voip', 'status': 'success'},
      {'title': 'Etape 3', 'description': 'Test lenteur', 'status': 'pending'},
    ];

    final steps = <Map<String, dynamic>>[
      {
        "codeCategorie": "INTENET",
        "libelleCategorie": "Test internet",
        "etapeEnCours": "Etape 1",
        "status": "SUCCES",
        "etapes": [
          {
            "categorie": "INTERNET",
            "canRedo": false,
            "codeEtape": "DERCO",
            "libelleEtape":
                "Vérification de l'existence d'une réclamation en cours",
            "statut": "EN_COURS",
          },
          {
            "categorie": "INTERNET",
            "canRedo": false,
            "codeEtape": "BSCS",
            "libelleEtape":
                "Vérification de l'existence d'une réclamation en cours",
            "statut": "SUCCES",
          },
        ],
      },
      {
        "codeCategorie": "VOIP",
        "libelleCategorie": "Test voix",
        "etapeEnCours": "Etape 2",
        "status": "SUCCES",
        "etapes": [],
      },
      {
        "codeCategorie": "LENTEUR",
        "libelleCategorie": "Test lenteur",
        "etapeEnCours": "Etape 3",
        // "status": "EN_ATTENTE",
        "status": "EN_COURS",
        "etapes": [],
      },
    ];

    final isServiceSuccess = <Map<String, String>>[
      {'title': 'Internet', 'description': 'internet', 'status': 'internet'},
      {'title': 'Téléphone', 'description': 'phone', 'status': 'phone'},

      {'title': 'Lenteur', 'description': 'lenteur', 'status': 'lenteur'},
    ];

    Widget _getStatusColor(String status) {
      switch (status) {
        case 'internet':
          return Container(
            width: 48.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(Icons.wifi, color: Colors.blue.shade500),
          );
        case 'phone':
          return Container(
            width: 48.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.green.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(Icons.phone, color: Colors.green),
          );
        case 'lenteur':
          return Container(
            width: 48.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.orangeAccent.shade100.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(Icons.insert_chart_outlined_rounded, color: Colors.red),
          );

        default:
          return Container();
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 8.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: List.generate(
                    steper.length,
                    (index) => DiancHeaderProgress(steps: steps, index: index),
                  ),
                ),
              ),

              SizedBox(height: 28.h),

              ...List.generate(
                steps.length,
                (index) => DianosticStepItems(
                  stepsItem: steps,
                  index: index,
                  stepStatus: steps[index]['status'] ?? '',
                  title: steps[index]['title'] ?? '',
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Diagnostic terminé',
                    style: context.appTypographie.body.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                      color: Color(0xFF1C1B1F),
                    ),
                  ),

                  // Icon(Icons.check_circle, size: 48.w, color: Colors.green),
                  ...List.generate(isServiceSuccess.length, (index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 12.h),
                      padding: EdgeInsets.symmetric(
                        vertical: 9.h,
                        horizontal: 9.w,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              _getStatusColor(
                                isServiceSuccess[index]['status'] ?? '',
                              ),
                              SizedBox(width: 14.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    isServiceSuccess[index]['title'] ?? '',
                                    style: context.appTypographie.body.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  Text(
                                    'Fonctionnel',
                                    style: context.appTypographie.body.copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF50BE87),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Icon(
                            Icons.check_circle_outline,
                            color: Color(0xFF50BE87),
                            size: 25.sp,
                          ),
                        ],
                      ),
                    );
                  }),

                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 13.h,
                      horizontal: 16.w,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFE5ECFA),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.info_outline, color: Color(0xFF527EDB)),
                        SizedBox(width: 14.w),
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Réinitialiser la box. ',
                                  style: context.appTypographie.body.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                    color: Color(0xFF364153),
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Aucun problème détecté sur votre box ou vos services.',
                                  style: context.appTypographie.body.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    height: 1.5.sp,
                                    color: Color(0xFF364153),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15.h),

                  PrimaryButton(
                    label: 'Retour à l’acceuil',
                    colorText: Colors.black,
                    backgroundColor: Color(0xFFFF7900),
                    onPressed: () {},
                  ),
                ],
              ),

              SizedBox(height: 0.3.sh),
            ],
          ),
        ),
      ),
    );
  }
}

class DianosticStepItems extends StatelessWidget {
  const DianosticStepItems({
    super.key,
    required this.stepsItem,
    required this.index,
    required this.stepStatus,
    required this.title,
  });

  final List<Map<String, dynamic>> stepsItem;
  final int index;
  final String stepStatus;
  final String title;

  Color backgroundColor(String status) {
    final itemsStatus = status.toLowerCase();

    switch (itemsStatus) {
      case 'succes':
        return Colors.grey.shade100.withValues(alpha: 0.9);
      case 'en_cours':
        return const Color(0xFFFDFAF0);
      case 'en_attente':
        return Colors.grey.shade100.withValues(alpha: 0.9);
      default:
        return Colors.grey.shade100.withValues(alpha: 0.9);
    }
  }

  Color checkIconBorderColor(String status) {
    final itemsStatus = status.toLowerCase();

    switch (itemsStatus) {
      case 'succes':
        return const Color(0xFF50BE87);
      case 'en_cours':
        return Colors.deepOrange.shade400;
      case 'en_attente':
        return Colors.grey.shade400;
      default:
        return Colors.grey;
    }
  }

  Color borderContentColor(String status) {
    final itemsStatus = status.toLowerCase();

    switch (itemsStatus) {
      case 'en_cours':
        return Colors.deepOrange.shade400.withValues(alpha: 0.3);
      default:
        return Colors.transparent;
    }
  }

  Color iconContentColor(String status) {
    final itemsStatus = status.toLowerCase();

    switch (itemsStatus) {
      case 'succes':
        return const Color(0xFF50BE87);
      case 'en_cours':
        return Colors.deepOrange.shade400;
      case 'en_attente':
        return Colors.white;
      default:
        return Colors.grey;
    }
  }

  Color textColor(String status) {
    final itemsStatus = status.toLowerCase();

    switch (itemsStatus) {
      case 'succes':
        return const Color(0xFF50BE87);
      case 'en_cours':
        return Colors.deepOrange.shade400;
      case 'en_attente':
        return Colors.grey.shade300;
      default:
        return Colors.grey;
    }
  }

  Color titleColor(String status) {
    final itemsStatus = status.toLowerCase();

    switch (itemsStatus) {
      case 'en_attente':
        return Colors.grey.shade400;
      default:
        return Colors.grey.shade700;
    }
  }

  IconData checkIconContentColor(String status) {
    final itemsStatus = status.toLowerCase();

    switch (itemsStatus) {
      case 'succes':
        return Icons.check;
      case 'en_cours':
        return Icons.circle;
      case 'en_attente':
        return Icons.circle;
      default:
        return Icons.circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(stepsItem.length, (index) {
        final item = stepsItem[index]['etapes'];
        if (item != null) {
          return Column(
            children: List.generate(item.length, (index) {
              return DianosticItemsContent(
                backgroundColor: backgroundColor(item[index]['statut']),
                borderContentColor: borderContentColor(item[index]['statut']),
                iconBorderColor: checkIconBorderColor(item[index]['statut']),
                icon: checkIconContentColor(item[index]['statut']),
                iconContentColor: iconContentColor(item[index]['statut']),
                textColor: textColor(item[index]['statut']),
                titleColor: titleColor(item[index]['statut']),
                title: item[index]['libelleEtape'] ?? '',
                stepStatus: '${item[index]['statut']} ',
              );
            }),
          );
        }
        return SizedBox();
      }),
    );
  }
}

class DianosticItemsContent extends StatelessWidget {
  const DianosticItemsContent({
    super.key,
    required this.backgroundColor,
    this.borderContentColor,
    required this.iconBorderColor,
    required this.icon,
    required this.iconContentColor,
    this.iconContentBorderColor,
    this.iconColor = Colors.white,
    required this.textColor,
    required this.titleColor,
    required this.title,
    required this.stepStatus,
  });

  final Color backgroundColor;
  final Color? borderContentColor;
  final Color iconBorderColor;
  final IconData icon;
  final Color iconContentColor;
  final Color? iconContentBorderColor;
  final Color iconColor;
  final Color textColor;
  final Color titleColor;
  final String title;
  final String stepStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7.h),
      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 12.h),
      decoration: BoxDecoration(
        border: Border.all(color: borderContentColor ?? Colors.transparent),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(9.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(3.r),
                  decoration: BoxDecoration(
                    border: Border.all(color: iconBorderColor),
                    shape: BoxShape.circle,
                    color: iconContentColor,
                  ),
                  child: Icon(icon, color: iconColor, size: 10.h),
                ),

                SizedBox(width: 14.w),

                Expanded(
                  child: Text(
                    title,
                    style: context.appTypographie.body.copyWith(
                      fontSize: 11.sp,
                      color: titleColor,
                      fontWeight: FontWeight.w800,
                    ),
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 18.w),

          Text(
            stepStatus,
            style: context.appTypographie.body.copyWith(
              fontSize: 7.sp,
              color: textColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class DiancHeaderProgress extends StatelessWidget {
  const DiancHeaderProgress({
    super.key,
    required this.steps,
    required this.index,
  });

  final List<Map<String, dynamic>> steps;
  final int index;

  Widget _checkStepStatus(String step) {
    final status = step.toLowerCase();

    switch (status) {
      case 'succes':
        return Container(
          margin: EdgeInsets.only(left: 10.w),
          padding: EdgeInsets.all(3.r),
          decoration: const BoxDecoration(
            color: Color(0xFF50BE87),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check, color: Colors.white, size: 10.h),
        );
      case 'en_cours':
        return Container(
          margin: EdgeInsets.only(left: 10.w),
          padding: EdgeInsets.all(3.r),
          decoration: const BoxDecoration(
            color: Color(0xFFFFD102),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.circle, color: const Color(0xFFFFD102), size: 9.sp),
        );
      case 'en_attente':
        return Container(
          margin: EdgeInsets.only(left: 10.w),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.circle, color: Colors.grey.shade300, size: 9.sp),
        );
      default:
        return Container();
    }
  }

  Color _getStepColor(final List<Map<String, dynamic>> steps, final int index) {
    // 🔥 Si il y a un élément suivant → on prend son status
    if (index < steps.length - 1) {
      final nextStatus = steps[index + 1]['status']?.toLowerCase() ?? '';

      switch (nextStatus) {
        case 'succes':
          return const Color(0xFF50BE87);

        case 'en_cours':
          return const Color(0xFFFFD102);

        case 'en_attente':
          return const Color(0xFFE9E9E9);

        default:
          return const Color(0xFFE9E9E9);
      }
    }

    // 🔹 Dernier élément → son propre status
    final statusLower = steps[index]['status']?.toLowerCase() ?? '';

    switch (statusLower) {
      case 'succes':
        return const Color(0xFF50BE87);

      case 'en_cours':
        return const Color(0xFFFFD102);

      case 'en_attente':
        return const Color(0xFFE9E9E9);

      default:
        return const Color(0xFFE9E9E9);
    }
  }

  Color _backgroundStatusColor(String status) {
    final itemsStatus = status.toLowerCase();

    switch (itemsStatus) {
      case 'succes':
        return const Color(0xFF25C196);

      default:
        return const Color(0xFF56554F);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              steps[index]['etapeEnCours'] ?? '',
              style: context.appTypographie.body.copyWith(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFA8AABC),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            _checkStepStatus(steps[index]['status'] ?? ''),
            if (index < steps.length - 1) ...[
              SizedBox(width: 8.w),
              Container(
                width: 0.27.sw,
                height: 2.h,
                color: _getStepColor(steps, index),
              ),
            ],
          ],
        ),
        SizedBox(height: 4.h),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                steps[index]['libelleCategorie'] ?? '',
                style: context.appTypographie.body.copyWith(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF333333),
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.h),
                decoration: BoxDecoration(
                  color: _backgroundStatusColor(
                    steps[index]['status'] ?? '',
                  ).withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  steps[index]['etapeEnCours'] ?? '',
                  style: context.appTypographie.body.copyWith(
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w500,
                    color: _backgroundStatusColor(steps[index]['status'] ?? ''),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
