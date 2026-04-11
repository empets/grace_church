import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:grace_church/core/bloc_state/bloc_state.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart'
    hide EmptyRequest;
import 'package:grace_church/feature/home/domaine/entities/response/home_response.dart';
import 'package:grace_church/feature/home/domaine/usercase/get_list_secteur.dart';
import 'package:grace_church/feature/home/page/bloc/departement/eglise_maison/event/cellule_event.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetResponsableSecteurBloc
    extends Bloc<CelluleEvent, ApiState<List<ReponsableSecteurResponse>>> {
  GetResponsableSecteurBloc({required this.getListSecteurUsercase})
    : super(ApiState<List<ReponsableSecteurResponse>>.initial()) {
    on<CelluleEvent>(getReponsableSecteur);
  }

  final GetListSecteurUsercase getListSecteurUsercase;

  Future<void> getReponsableSecteur(
    CelluleEvent event,
    Emitter<ApiState<List<ReponsableSecteurResponse>>> emit,
  ) async {
    switch (event) {
      case FetchCelluleEvent():
        emit(ApiState<List<ReponsableSecteurResponse>>.load());
        final result = await getListSecteurUsercase.call(
          RequestReponsableSecteur(),
        );
        emit(
          result.fold(
            (failure) => ApiState<List<ReponsableSecteurResponse>>.failed(
              failure.message,
            ),
            (success) => ApiState<List<ReponsableSecteurResponse>>.success(
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
