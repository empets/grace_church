import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_church/core/observer/observer.dart';
import 'package:grace_church/core/style/app_theme.dart';
import 'package:grace_church/feature/home/overview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: FirebaseOptions(
  //     apiKey: GlobalParams.apiKey,
  //     appId: GlobalParams.appId,
  //     messagingSenderId: GlobalParams.messagingSenderId,
  //     projectId: GlobalParams.projectId,
  //     storageBucket: GlobalParams.storageBucket,
  //   ),
  // );
  Bloc.observer = SimpleBlocObserver();
  // await configureDependencies();
  // await FirebaseAppCheck.instance.activate(
  //   androidProvider: AndroidProvider.debug,
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            primaryColor: Colors.black,

            textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
            extensions: <ThemeExtension<dynamic>>[
              AppColorsTheme.appColors,
              AppTypographieTheme.appTheme,
            ],
          ),
          home: child,
        );
      },
      child: OverviewScreen(),
    );
  }
}
