import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_church/core/about_internet/not_internet.dart';
import 'package:grace_church/core/constante/const.dart';
import 'package:grace_church/core/extension/extention.dart';
import 'package:grace_church/core/push_notification/push_notification.dart';
import 'package:grace_church/feature/authen/domaine/usercase/connexion_implicite_usercase.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:grace_church/core/bloc_state/bloc_state.dart';
import 'package:grace_church/core/constante/params.dart';
import 'package:grace_church/core/custome_widget/custome_text.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/core/injection/injection_container.dart';
import 'package:grace_church/core/observer/observer.dart';
import 'package:grace_church/core/style/app_theme.dart';
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/feature/home/onboarding_view.dart';
import 'package:grace_church/feature/home/overview.dart';
import 'package:grace_church/feature/home/page/bloc/app_launcher/app_launcher_bloc.dart';
import 'package:grace_church/feature/home/page/bloc/get_profile/event/profile_event.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('fr_FR', null);
  InitialState();

  await PushNotification().initNotification();



  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: GlobalParams.apiKey,
      appId: GlobalParams.appId,
      messagingSenderId: GlobalParams.messagingSenderId,
      projectId: GlobalParams.projectId,
      storageBucket: GlobalParams.storageBucket,
    ),
  );

  await SystemChrome.setPreferredOrientations([
  DeviceOrientation.portraitUp,
]);

  await Supabase.initialize(
    url: GlobalParams.supabaseUrl,
    anonKey: GlobalParams.supabaseAnonKey,
  );


  Bloc.observer = SimpleBlocObserver();
  await configureDependencies();
   final deviceId = await getDeviceFingerprint();
   log("message======>> $deviceId");

  runApp(MyApp(deviceId: deviceId));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.deviceId});
  final String deviceId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConnexionImpliciteBloc(
        getConnexionImpliciteUsercase: getIt<GetConnexionImpliciteUsercase>(),
      )..add(ProfileEvent.getProfileByDeviceId(deviceId)),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            navigatorKey: navigatorKey, // ✅ navigatorKey ici, pas key:
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light().copyWith(
              primaryColor: Colors.black,
              textTheme: GoogleFonts.robotoTextTheme(
                Theme.of(context).textTheme,
              ),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
              extensions: <ThemeExtension<dynamic>>[
                AppColorsTheme.appColors,
                AppTypographieTheme.appTheme,
              ],
            ),
            home: ConnectivityWrapper(child: child!), // ✅ ConnectivityWrapper DANS MaterialApp
          );
        },
        child: BlocBuilder<ConnexionImpliciteBloc, ApiState<ProfileResponse>>(
          builder: (context, state) {
            return 
             state is LoadState<ProfileResponse>
                ? SplachSreen()
                : state is SuccessState<ProfileResponse>
                    ? OverviewScreen(
                        menberId: state.data.menberId,
                        isFormImpliciteConnexion: true,
                      )
                    : OnboardingScreen();
          },
        ),
      ),
    );
  }
}























































































































class DiagnosticRebootBox extends StatefulWidget {
  const DiagnosticRebootBox({super.key});

  @override
  State<DiagnosticRebootBox> createState() => _DiagnosticRebootBoxState();
}

class _DiagnosticRebootBoxState extends State<DiagnosticRebootBox> {
  @override
  Widget build(BuildContext context) {
    final steps = <Map<String, dynamic>>[
      {
        'codeCategorie': 'INTENET',
        'libelleCategorie': 'Test internet',
        'etapeEnCours': 'Etape 1',
        'status': 'SUCCES',
        'etapes': [
          {
            'categorie': 'INTERNET',
            'canRedo': false,
            'codeEtape': 'DERCO',
            'libelleEtape':
                "Vérification de l'existence d'une réclamation en cours",
            'statut': 'EN_COURS',
          },
          {
            'categorie': 'INTERNET',
            'canRedo': false,
            'codeEtape': 'BSCS',
            'libelleEtape':
                "Vérification de l'existence d'une réclamation en cours",
            'statut': 'SUCCES',
          },
          {
            'categorie': 'INTERNET',
            'canRedo': false,
            'codeEtape': 'BSCS',
            'libelleEtape':
                "Vérification de l'existence d'une réclamation en cours",
            'statut': 'EN_ATTENTE',
          },
        ],
      },
      {
        'codeCategorie': 'VOIP',
        'libelleCategorie': 'Test voix',
        'etapeEnCours': 'Etape 2',
        'status': 'EN_COURS',
        'etapes': [],
      },
      {
        'codeCategorie': 'LENTEUR',
        'libelleCategorie': 'Test lenteur',
        'etapeEnCours': 'Etape 3',
        'status': 'EN_ATTENTE',
        'etapes': [],
      },
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16.h),

            Row(
              children: List.generate(
                steps.length,
                (index) => Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAFAFA),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: DiancHeaderProgress(
                    steps: steps,
                    index: index,
                    diagnosticsSetp: steps,
                    isLoadSate: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DiancHeaderProgress extends StatelessWidget {
  const DiancHeaderProgress({
    super.key,
    required this.steps,
    required this.index,
    required this.diagnosticsSetp,
    this.isLoadSate = false,
  });

  final List<Map<String, dynamic>> steps;
  final int index;
  final List<Map<String, dynamic>>? diagnosticsSetp;
  final bool isLoadSate;

  Widget _checkStepStatus({required String step}) {
    final status = step.toLowerCase();

    switch (status) {
      case 'terminer':
        return Container(
          padding: EdgeInsets.all(3.r),
          decoration: const BoxDecoration(
            color: Color(0xFF50BE87),
            shape: BoxShape.circle,
          ),
          child: Container(color: Colors.white, width: 10.w, height: 10.h),
        );
      case 'en_cours':
        return Container(
          padding: EdgeInsets.all(3.r),
          decoration: const BoxDecoration(
            color: Color(0xFF888888),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.circle, color: const Color(0xFF888888), size: 9.sp),
        );
      case 'en_attente':
        return Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.circle, color: Colors.grey.shade300, size: 9.sp),
        );
      default:
        return Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.circle, color: Colors.grey.shade300, size: 9.sp),
        );
    }
  }

  Color _getStepColor({
    required List<Map<String, dynamic>> steps,
    required String status,
    required int index,
  }) {
    // Si il y a un élément suivant → on prend son status
    if (index < steps.length - 1) {
      switch (status.toLowerCase()) {
        case 'terminer':
          return const Color(0xFF50BE87);

        case 'en_cours':
          return const Color(0xFFE9E9E9);

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
        return const Color(0xFFE9E9E9);

      case 'en_attente':
        return const Color(0xFFE9E9E9);

      default:
        return const Color(0xFFE9E9E9);
    }
  }

  Color _backgroundStatusColor({required String status}) {
    final itemsStatus = status.toLowerCase();
    switch (itemsStatus) {
      case 'terminer':
        return const Color(0xFF25C196);
      default:
        return const Color(0xFF56554F);
    }
  }

  String _getStatusLabel({required String status}) {
    final itemsStatus = status.toLowerCase();

    switch (itemsStatus) {
      case 'terminer':
        return 'Normal';
      case 'en_cours':
        return 'En cours';
      case 'en_attente':
        return 'En attente';
      default:
        return 'Chargement';
    }
  }

  // Widget isLoading({
  //   required bool isLoading,
  //   required Widget child,
  //   required Color baseColor,
  //   required Color highlightColor,
  // }) {
  //   return Shimmer.fromColors(
  //     baseColor: isLoading ? baseColor : Colors.transparent,
  //     highlightColor: isLoading ? highlightColor : Colors.transparent,
  //     enabled: isLoading,
  //     child: child,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: index == 0 ? EdgeInsets.only(left: 8.w) : EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //---------------------------
          // Etape en cours
          //----------------------------
          Container(
            margin: EdgeInsets.only(left: index == 0 ? 4.w : 7.w),
            child: Text(
              steps[index]['etapeEnCours'] as String,
              style: context.appTypographie.body.copyWith(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFA8AABC),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          //-------------------------------------
          // L'icone du statut de l'étape en cours
          //-------------------------------------
          Container(
            // margin: EdgeInsets.only(left: index == 0 ? 4.w : (steps.last.length - 1) > 0 ? 13.w : 0.w),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    // left: index < steps.length - 1 ? 6.w : 0.w,
                    left: index == 0
                        ? 4.w
                        : (steps.last.length - 1) > 0
                        ? 13.w
                        : 0.w,
                    right: index < steps.length - 1 ? 7.w : 0.w,
                  ),
                  child: _checkStepStatus(
                    step: diagnosticsSetp?[index]['statut'] ?? '',
                  ),
                ),
                if (index < steps.length - 1) ...[
                  Container(
                    width: 0.27.sw,
                    height: 2.h,
                    margin: index < steps.length - 1
                        ? EdgeInsets.only(left: 9.w, right: 1.w)
                        : EdgeInsets.only(left: 1.w, right: 0.w),
                    color: _getStepColor(
                      status: diagnosticsSetp?[index]['statut'] ?? '',
                      steps: steps,
                      index: index,
                    ),
                  ),
                ],
              ],
            ),
          ),
          SizedBox(height: 4.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //-------------------------------
              // Libellé de la l'etape en cours
              //--------------------------------
              Text(
                diagnosticsSetp?[index]['libelleCategorie'] ??
                    '${steps[index]['libelleCategorie']}',
                style: context.appTypographie.body.copyWith(
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF333333),
                ),
              ),

              //--------------------------------
              // Status de l'étape en cours
              //--------------------------------
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.h),
                decoration: BoxDecoration(
                  color: _backgroundStatusColor(
                    status: diagnosticsSetp?[index]['statut'] ?? '',
                  ).withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  _getStatusLabel(
                    status: diagnosticsSetp?[index]['statut'] ?? '',
                  ),
                  style: context.appTypographie.body.copyWith(
                    fontSize: 7.sp,
                    fontWeight: FontWeight.w500,
                    color: _backgroundStatusColor(
                      status: diagnosticsSetp?[index]['statut'] ?? '',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SplachSreen extends StatelessWidget {
  const SplachSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColor.primaryBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentGeometry.center,
            child: CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation(Colors.white),
              strokeWidth: 2,
            ),
          ),
          SizedBox(height: 10.h),
          CustomeText(
            text: "Version 1.2.23",
            style: context.appTypographie.small.copyWith(color: Colors.white10),
          ),
          SizedBox(height: 0.1.sh),
        ],
      ),
    );
  }
}
