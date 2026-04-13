import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart';
import 'package:grace_church/feature/home/domaine/usercase/rapport_cellule_admine_usercase.dart';
import 'package:grace_church/feature/home/page/bloc/rapport_cellule.dart/event/rapport_cellule_event.dart';
import 'package:grace_church/feature/home/page/bloc/rapport_cellule.dart/state/rapport_cellule_state.dart';

class RapportCelluleSectionAdministrationBloc extends Bloc<
    RapportCelluleSectionAdministrationEvent,
    RapportCelluleSectionAdministrationState> {

  RapportCelluleSectionAdministrationBloc({required this.sendRapportCelluleStepAdministrationUsercase})
      : super(RapportCelluleSectionAdministrationState.initial()) {
    on<RapportCelluleSectionAdministrationEvent>(_onEvent);
  }

  final SendRapportCelluleStepAdministrationUsercase sendRapportCelluleStepAdministrationUsercase;

  void _onEvent(
    RapportCelluleSectionAdministrationEvent event,
    Emitter<RapportCelluleSectionAdministrationState> emit,
  ) async {
    switch (event) {

      // -------------------------
      // ZONE
      // -------------------------
      case ChangeCodeZoneRapportCelluleSectionAdministrationEvent(:final codeZone):
        final updatedState = state.copyWith(
          codeZone: TextFormz.dirty(codeZone),
          status: FormzSubmissionStatus.initial,
        );
        emit(updatedState.copyWith(isValide: _validate(updatedState)));
        break;

      case ChangeFullNameRespoZoneRapportCelluleSectionAdministrationEvent(:final fullNameRespoZone):
        final updatedState = state.copyWith(
          fullNameRespoZone: TextFormz.dirty(fullNameRespoZone),
          status: FormzSubmissionStatus.initial,
        );
        emit(updatedState.copyWith(isValide: _validate(updatedState)));
        break;

      case ChangeContactRespoZoneRapportCelluleSectionAdministrationEvent(:final contactRespoZone):
        final updatedState = state.copyWith(
          contactRespoZone: TextFormz.dirty(contactRespoZone),
          status: FormzSubmissionStatus.initial,
        );
        emit(updatedState.copyWith(isValide: _validate(updatedState)));
        break;

      // -------------------------
      // SECTEUR
      // -------------------------
      case ChangeCodeSecteurRapportCelluleSectionAdministrationEvent(:final codeSecteur):
        final updatedState = state.copyWith(
          codeSecteur: TextFormz.dirty(codeSecteur),
          status: FormzSubmissionStatus.initial,
        );
        emit(updatedState.copyWith(isValide: _validate(updatedState)));
        break;

      case ChangeFullNameRespoSecteurRapportCelluleSectionAdministrationEvent(:final fullNameRespoSecteur):
        final updatedState = state.copyWith(
          fullNameRespoSecteur: TextFormz.dirty(fullNameRespoSecteur),
          status: FormzSubmissionStatus.initial,
        );
        emit(updatedState.copyWith(isValide: _validate(updatedState)));
        break;

      case ChangeContactRespoSecteurRapportCelluleSectionAdministrationEvent(:final contactRespoSecteur):
        final updatedState = state.copyWith(
          contactRespoSecteur: TextFormz.dirty(contactRespoSecteur),
          status: FormzSubmissionStatus.initial,
        );
        emit(updatedState.copyWith(isValide: _validate(updatedState)));
        break;

      // -------------------------
      // CELLULE
      // -------------------------
      case ChangeCodeCelluleRapportCelluleSectionAdministrationEvent(:final codeCellule):
        final updatedState = state.copyWith(
          codeCellule: TextFormz.dirty(codeCellule),
          status: FormzSubmissionStatus.initial,
        );
        emit(updatedState.copyWith(isValide: _validate(updatedState)));
        break;

      case ChangeFullNameRespoCelluleRapportCelluleSectionAdministrationEvent(:final fullNameRespoCellule):
        final updatedState = state.copyWith(
          fullNameRespoCellule: TextFormz.dirty(fullNameRespoCellule),
          status: FormzSubmissionStatus.initial,
        );
        emit(updatedState.copyWith(isValide: _validate(updatedState)));
        break;

      case ChangeContactRespoCelluleRapportCelluleSectionAdministrationEvent(:final contactRespoCellule):
        final updatedState = state.copyWith(
          contactRespoCellule: TextFormz.dirty(contactRespoCellule),
          status: FormzSubmissionStatus.initial,
        );
        emit(updatedState.copyWith(isValide: _validate(updatedState)));
        break;

      // -------------------------
      // INFOS CELLULE
      // -------------------------
      case ChangeJourCelluleRapportCelluleSectionAdministrationEvent(:final jourCellule):
        final updatedState = state.copyWith(
          jourCellule: TextFormz.dirty(jourCellule),
          status: FormzSubmissionStatus.initial,
        );
        emit(updatedState.copyWith(isValide: _validate(updatedState)));
        break;

      case ChangeOffrandeRapportCelluleSectionAdministrationEvent(:final offrande):
        final updatedState = state.copyWith(
          offrande: TextFormz.dirty(offrande),
          status: FormzSubmissionStatus.initial,
        );
        emit(updatedState.copyWith(isValide: _validate(updatedState)));
        break;

      // -------------------------
      // STATS
      // -------------------------
      case ChangeNombreBaptiserRapportCelluleSectionAdministrationEvent(:final nombreBaptiser):
        final updatedState = state.copyWith(
          nombreBaptiser: TextFormz.dirty(nombreBaptiser),
          status: FormzSubmissionStatus.initial,
        );
        emit(updatedState.copyWith(isValide: _validate(updatedState)));
        break;

      case ChangeNombreNonBaptiserRapportCelluleSectionAdministrationEvent(:final nombreNonBaptiser):
        final updatedState = state.copyWith(
          nombreNonBaptiser: TextFormz.dirty(nombreNonBaptiser),
          status: FormzSubmissionStatus.initial,
        );
        emit(updatedState.copyWith(isValide: _validate(updatedState)));
        break;

      // -------------------------
      // LISTE DISCIPLES
      // -------------------------
     case ChangeNombreListDicipleCelluleRapportCelluleSectionAdministrationEvent(
  :final discipleCelluleResponse
):
  final updatedState = state.copyWith(
    discipleCelluleList: discipleCelluleResponse,
  );

  // Vérification des erreurs
  if (discipleCelluleResponse.any((item) => item.fullName.trim().isEmpty)) {
    emit(
      updatedState.copyWith(
        errorMessage: "Nom obligatoire",
        isValide: false,
      ),
    );
    return;
  }

  // Si pas d'erreur → validation normale
  emit(
    updatedState.copyWith(
      errorMessage: "",
      isValide: _validate(updatedState),
    ),
  );
  break;

      // -------------------------
      // 🔥 SUBMIT (optionnel)
      // -------------------------
      case SubmitRapportCelluleSectionAdministrationEvent():
        if (state.isValide) {
          emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
          final result = await sendRapportCelluleStepAdministrationUsercase.call(RequestRapportCelluleAdministration(
            codeZone: state.codeZone.value,
            fullNameRespoZone: state.fullNameRespoZone.value,
            contactRespoZone: state.contactRespoZone.value,
            codeSecteur: state.codeSecteur.value,
            fullNameRespoSecteur: state.fullNameRespoSecteur.value,
            contactRespoSecteur: state.contactRespoSecteur.value,
            codeCellule: state.codeCellule.value,
            fullNameRespoCellule: state.fullNameRespoCellule.value,
            contactRespoCellule: state.contactRespoCellule.value,
            jourCellule: state.jourCellule.value,
            offrande: state.offrande.value,
            nombreBaptiser: state.nombreBaptiser.value,
            nombreNonBaptiser: state.nombreNonBaptiser.value,
            discipleCellule: List.generate(state.discipleCelluleList.length, (index) => state.discipleCelluleList[index]),
            id: "",
          formAdministrationIsSubmit: "Success", formAdministrationSubmitDate: DateTime.now().toIso8601String(),
          ));

           emit(result.fold((l)=> state.copyWith(status: FormzSubmissionStatus.failure), (r)=> state.copyWith(status: FormzSubmissionStatus.success)));
        }
        else{
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
        }
        break;
    }
  }

  // =============================
  // 🔍 VALIDATION CENTRALISÉE
  // =============================
  bool _validate(RapportCelluleSectionAdministrationState s) {
    return Formz.validate([
      s.codeZone,
      s.fullNameRespoZone,
      s.contactRespoZone,
      s.codeSecteur,
      s.fullNameRespoSecteur,
      s.contactRespoSecteur,
      s.codeCellule,
      s.fullNameRespoCellule,
      s.contactRespoCellule,
      s.jourCellule,
      s.offrande,
      s.nombreBaptiser,
      s.nombreNonBaptiser,
    ]);
  }
}