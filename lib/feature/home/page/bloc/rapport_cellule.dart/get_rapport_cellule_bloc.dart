import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:grace_church/core/bloc_state/bloc_state.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart';
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/feature/home/domaine/usercase/get_rapport_cellule_usercase.dart';
import 'package:grace_church/feature/home/page/bloc/rapport_cellule.dart/event/rapport_cellule_event.dart';

@lazySingleton
class GetRapportCelluleBloc
    extends Bloc<FecthDataEvent, ApiState<List<RapportCelluleResponse>>> {
  GetRapportCelluleBloc({required this.getRapportCelluleUsercase})
    : super(ApiState<List<RapportCelluleResponse>>.initial()) {
    on<FecthDataEvent>(_onFecthData);
  }

  final GetRapportCelluleUsercase getRapportCelluleUsercase;

  Future<void> _onFecthData(
    FecthDataEvent event,
    Emitter<ApiState<List<RapportCelluleResponse>>> emit,
  ) async {
    switch (event) {
      case FetchDataByIdFecthDataEvent(:final responsableCelluleId):
        if (responsableCelluleId.isNotEmpty) {
          emit(ApiState<List<RapportCelluleResponse>>.load());

          final response = await getRapportCelluleUsercase.call(
            RequestRapportCellule(
              responsableCelluleId: responsableCelluleId,
              date: "",
              tag: '',
            ),
          );
          emit(
            response.fold(
              (l) => ApiState<List<RapportCelluleResponse>>.failed(l.message),
              (r) => ApiState<List<RapportCelluleResponse>>.success(r),
            ),
          );
        }
        break;

      case FetchRapportByTagFecthDataEvent(:final tag, :final responsableCelluleId):
        if (tag.isNotEmpty) {
          emit(ApiState<List<RapportCelluleResponse>>.load());

          final response = await getRapportCelluleUsercase.call(
            RequestRapportCellule(responsableCelluleId: responsableCelluleId, date: '', tag: tag),
          );
          emit(
            response.fold(
              (l) => ApiState<List<RapportCelluleResponse>>.failed(l.message),
              (r) => ApiState<List<RapportCelluleResponse>>.success(r),
            ),
          );
        }
      case FetchRapportByDateFecthDataEvent(:final date, :final responsableCelluleId):
        if (date.isNotEmpty) {
          emit(ApiState<List<RapportCelluleResponse>>.load());

          final response = await getRapportCelluleUsercase.call(
            RequestRapportCellule(
              responsableCelluleId: responsableCelluleId,
              date: date,
              tag: '',
            ),
          );
          emit(
            response.fold(
              (l) => ApiState<List<RapportCelluleResponse>>.failed(l.message),
              (r) => ApiState<List<RapportCelluleResponse>>.success(r),
            ),
          );
        }
        break;
    }
  }
}
