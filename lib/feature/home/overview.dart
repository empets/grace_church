import 'package:flutter/material.dart';
import 'package:grace_church/core/alert/app_alerte.dart';
import 'package:grace_church/core/bloc_state/bloc_state.dart';
import 'package:grace_church/core/extension/extention.dart';
import 'package:grace_church/core/injection/injection_container.dart';
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/feature/home/domaine/usercase/get_profile_usercase.dart';
import 'package:grace_church/feature/home/home_view.dart';
import 'package:grace_church/feature/home/menu_view.dart';
import 'package:grace_church/feature/home/page/bloc/get_profile/event/profile_event.dart';
import 'package:grace_church/feature/home/page/bloc/get_profile/get_profile_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetProfileBloc(getProfileUsercase: getIt<GetProfileUsercase>())
                ..add(ProfileEvent.fetch()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<GetProfileBloc, ApiState<ProfileResponse>>(
            listener: (context, profileState) {
              if (profileState is SuccessState<ProfileResponse>) {
                // AppAlert.showSuccess(context, "Profile fetched successfully");
              }
              if (profileState is FailedState<ProfileResponse>) {
                AppAlert.showError(
                  context,
                  profileState.message.getOrEmpty(),
                  showOnTop: true,
                );
              }
            },
          ),
        ],
        child: Scaffold(
          backgroundColor: Colors.grey.shade50,
          appBar: AppBar(backgroundColor: Colors.grey.shade50),
          drawer: MenuView(),
          body: HomeView(),
        ),
      ),
    );
  }
}
