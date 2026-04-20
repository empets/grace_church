import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart' as shareData;

import 'package:grace_church/core/bloc_state/bloc_state.dart';
import 'package:grace_church/feature/home/page/bloc/get_profile/event/profile_event.dart';

@lazySingleton
class AppLauncherBloc extends Bloc<ProfileEvent, ApiState<bool>> {
  AppLauncherBloc() : super(ApiState<bool>.initial()) {
    on<ProfileEvent>(isApplauncher);
  }

  Future<void> isApplauncher(
    ProfileEvent event,
    Emitter<ApiState<bool>> emit,
  ) async {
    switch (event) {
      case ProfileEvent():
        emit(ApiState<bool>.load());
        final shared = await shareData.SharedPreferences.getInstance();
        final isAppLauncher = await shared.getString('isAppLauncher') ?? false;
        if (isAppLauncher != "isAppLauncher") {
          emit(ApiState<bool>.failed());
        } else {
          emit(
            ApiState<bool>.success(true, status: FormzSubmissionStatus.success),
          );
        }
        break;

      // case ProfileEventGetProfileId(appId: final appId):
      //   // TODO: Handle this case.
      //   break;

      // default:
      //   break;
    }
  }
}
