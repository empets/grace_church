import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart';
import 'package:injectable/injectable.dart';

import 'package:grace_church/core/bloc_state/bloc_state.dart';
import 'package:grace_church/core/usercase/usercase.dart';
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/feature/home/domaine/usercase/get_profile_usercase.dart';
import 'package:grace_church/feature/home/page/bloc/get_profile/event/profile_event.dart';

@lazySingleton
class GetProfileBloc extends Bloc<ProfileEvent, ApiState<ProfileResponse>> {
  GetProfileBloc({required this.getProfileUsercase})
    : super(ApiState<ProfileResponse>.initial()) {
    on<ProfileEvent>(getProfile);
  }

  final GetProfileUsercase getProfileUsercase;

  Future<void> getProfile(
    ProfileEvent event,
    Emitter<ApiState<ProfileResponse>> emit,
  ) async {
    switch (event) {
      case FetchProfileNumberIdProfileEventFetch(:final numberId):

      if(numberId != null && numberId.isNotEmpty) {
          emit(ApiState<ProfileResponse>.load());
        await Future.delayed(Duration(seconds: 4));
        final response = await getProfileUsercase.call(RequestGetProfile(numberId: numberId.toString()));

        emit(
          response.fold(
            (failure) => ApiState.failed(failure.message),
            (profile) => ApiState.success(profile),
          ),
        );
        
      }
      
      

        break;
    }
  }
}
