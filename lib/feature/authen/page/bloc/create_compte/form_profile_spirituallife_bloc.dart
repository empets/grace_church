import 'package:formz/formz.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/feature/authen/page/bloc/create_compte/event/event_create_compte.dart';
import 'package:grace_church/feature/authen/page/bloc/create_compte/state/state_create_compte.dart';
import 'package:bloc/bloc.dart';

class CreateComteProfileSpiritualLifeBloc
    extends
        Bloc<EventCreateCompteSpiritualLife, CreateCompteSpiritualLifeState> {
  CreateComteProfileSpiritualLifeBloc()
    : super(CreateCompteSpiritualLifeState.initial()) {
    on<EventCreateCompteSpiritualLife>(_onEvent);
  }

  void _onEvent(
    EventCreateCompteSpiritualLife event,
    Emitter<CreateCompteSpiritualLifeState> emit,
  ) {
    switch (event) {
      case ChangeStatusSpirituelCreateCompteSocial(:final statusSpirituel):
        final statusInput = TextFormz.dirty(statusSpirituel);

        emit(
          state.copyWith(
            statusSpirituel: statusInput,
            status: FormzSubmissionStatus.initial,
            isValide: Formz.validate([
              statusInput,
              state.dateBaptme,
              state.cellulePriere,
              state.encadreur,
            ]),
          ),
        );
        break;

      case ChangeDateBaptmeEtudeEventCreateCompteSpiritualLife(
        :final dateBaptme,
      ):
        final dateInput = TextFormz.dirty(dateBaptme);

        emit(
          state.copyWith(
            dateBaptme: dateInput,
            status: FormzSubmissionStatus.initial,
            isValide: Formz.validate([
              state.statusSpirituel,
              dateInput,
              state.cellulePriere,
              state.encadreur,
            ]),
          ),
        );
        break;

      case CellulePriereEventCreateCompteSpiritualLife(:final cellulePriere):
        final celluleInput = TextFormz.dirty(cellulePriere);

        emit(
          state.copyWith(
            cellulePriere: celluleInput,
            status: FormzSubmissionStatus.initial,
            isValide: Formz.validate([
              state.statusSpirituel,
              state.dateBaptme,
              celluleInput,
              state.encadreur,
            ]),
          ),
        );
        break;

      case EncadreurEventCreateCompteSpiritualLife(:final encadreur):
        final encadreurInput = TextFormz.dirty(encadreur);

        emit(
          state.copyWith(
            encadreur: encadreurInput,
            status: FormzSubmissionStatus.initial,
            isValide: Formz.validate([
              state.statusSpirituel,
              state.dateBaptme,
              state.cellulePriere,
              encadreurInput,
            ]),
          ),
        );
        break;

      case SubmitEventCreateCompteSpiritualLife():
        if (!state.isValide) return;

        emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

        try {
          // TODO: appel API

          emit(state.copyWith(status: FormzSubmissionStatus.success));
        } catch (e) {
          emit(
            state.copyWith(
              status: FormzSubmissionStatus.failure,
              errorMessage: e.toString(),
            ),
          );
        }
        break;

      default:
    }
  }

 
}
