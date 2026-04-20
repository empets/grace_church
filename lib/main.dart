import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_church/core/bloc_state/bloc_state.dart';
import 'package:grace_church/core/constante/params.dart';
import 'package:grace_church/core/injection/injection_container.dart';
import 'package:grace_church/core/observer/observer.dart';
import 'package:grace_church/core/style/app_theme.dart';
import 'package:grace_church/feature/home/onboarding_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:grace_church/feature/home/overview.dart';
import 'package:grace_church/feature/home/page/bloc/app_launcher/app_launcher_bloc.dart';
import 'package:grace_church/feature/home/page/bloc/get_profile/event/profile_event.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('fr_FR', null);
  InitialState();

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: GlobalParams.apiKey,
      appId: GlobalParams.appId,
      messagingSenderId: GlobalParams.messagingSenderId,
      projectId: GlobalParams.projectId,
      storageBucket: GlobalParams.storageBucket,
    ),
  );

  await Supabase.initialize(
    url: GlobalParams.supabaseUrl,
    anonKey: GlobalParams.supabaseAnonKey,
  );

  await Firebase.initializeApp(
    name: "authenfication",
    options: FirebaseOptions(
      apiKey: GlobalParams.apisKey,
      appId: GlobalParams.appsId,
      messagingSenderId: GlobalParams.messagingsSenderId,
      projectId: GlobalParams.projectsId,
      storageBucket: GlobalParams.storageBuckets,
    ),
  );

  Bloc.observer = SimpleBlocObserver();
  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppLauncherBloc()..add(ProfileEvent.fetch()),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            title: 'Flutter Demo',
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
            home: child,
          );
        },
        child: BlocBuilder<AppLauncherBloc, ApiState<bool>>(
          builder: (context, state) {
            return state is SuccessState<bool> ? const OverviewScreen() : OnboardingScreen();
            
            // state is SuccessState<bool> ? const OverviewScreen() : OnboardingScreen();
          },
        ),
        // OverviewScreen(),
      ),
    );
  }
}
