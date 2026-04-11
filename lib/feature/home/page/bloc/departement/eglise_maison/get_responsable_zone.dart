import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:grace_church/core/bloc_state/bloc_state.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart'
    hide EmptyRequest;
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/feature/home/domaine/usercase/get_list_zone.dart';
import 'package:grace_church/feature/home/page/bloc/departement/eglise_maison/event/cellule_event.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetResponsableZoneBloc
    extends Bloc<CelluleEvent, ApiState<List<ReponsableZoneResponse>>> {
  GetResponsableZoneBloc({required this.getListZoneUsercase})
    : super(ApiState<List<ReponsableZoneResponse>>.initial()) {
    on<CelluleEvent>(getReponsableSecteur);
  }

  final GetListZoneUsercase getListZoneUsercase;

  Future<void> getReponsableSecteur(
    CelluleEvent event,
    Emitter<ApiState<List<ReponsableZoneResponse>>> emit,
  ) async {
    switch (event) {
      case FetchCelluleEvent():
        emit(ApiState<List<ReponsableZoneResponse>>.load());
        final result = await getListZoneUsercase.call(
          RequestReponsableZone(),
        );
        emit(
          result.fold(
            (failure) => ApiState<List<ReponsableZoneResponse>>.failed(
              failure.message,
            ),
            (success) => ApiState<List<ReponsableZoneResponse>>.success(
              success,
              status: FormzSubmissionStatus.success,
            ),
          ),
        );
        break;
      default:
    }
  }
}
