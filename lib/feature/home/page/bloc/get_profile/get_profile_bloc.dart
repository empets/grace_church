import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_church/core/bloc_state/bloc_state.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/feature/home/domaine/usercase/get_profile_usercase.dart';
import 'package:grace_church/feature/home/page/bloc/get_profile/event/profile_event.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetProfileBloc extends Bloc<ProfileEvent, ApiState<ProfileResponse>> {
  GetProfileBloc({required this.getProfileUsercase})
    : super(ApiState.initial()) {
    on<ProfileEvent>(getProfile);
  }

  final GetProfileUsercase getProfileUsercase;

  Future<void> getProfile(
    ProfileEvent event,
    Emitter<ApiState<ProfileResponse>> emit,
  ) async {
    switch (event) {
      case ProfileEvent():
        emit(ApiState<ProfileResponse>.load());

        final response = await getProfileUsercase.call(NoParams());

        emit(
          response.fold(
            (failure) => ApiState.failed(failure.message),
            (profile) => ApiState.success(profile),
          ),
        );

        break;
    }
  }
}
