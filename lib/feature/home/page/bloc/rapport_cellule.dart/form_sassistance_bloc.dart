import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:grace_church/core/extension/custome_extension.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart';
import 'package:grace_church/feature/home/domaine/usercase/rapport_cellule_stat_usercase.dart';
import 'package:grace_church/feature/home/page/bloc/rapport_cellule.dart/event/rapport_cellule_event.dart';
import 'package:grace_church/feature/home/page/bloc/rapport_cellule.dart/state/rapport_cellule_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RapportCelluleSectionAssistanceBloc extends Bloc<
    RapportCelluleRequestSectionAssistanceEvent,
    RapportCelluleRequestSectionAssistanceState> {

  RapportCelluleSectionAssistanceBloc(
    {
      required this.sendRapportCelluleStepStatUsercase,
    }
  ) : super(RapportCelluleRequestSectionAssistanceState.initial()) {
    on<RapportCelluleRequestSectionAssistanceEvent>(_onEvent);
  }

  final SendRapportCelluleStepStatUsercase sendRapportCelluleStepStatUsercase;

  Future<void> _onEvent(
    RapportCelluleRequestSectionAssistanceEvent event,
    Emitter<RapportCelluleRequestSectionAssistanceState> emit,
  ) async {
    switch (event) {

      // =========================
      // 🔢 NOMBRE BAPTISER
      // =========================
      case ChangeNombreBaptiserRapportCelluleRequestSectionAssistanceEvent(:final nombreBaptiser):
        final updated = state.copyWith(
          nombreBaptiser: TextFormz.dirty(nombreBaptiser),
          status: FormzSubmissionStatus.initial,
        );
        emit(updated.copyWith(isValide: _validate(updated)));
        break;

       case RapportCelluleRequestSectionAssistanceEventUpdateSectionId(:final id):
        final updated = state.copyWith(
          id: TextFormz.dirty(id),
          status: FormzSubmissionStatus.initial,
        );
        emit(updated.copyWith(isValide: _validate(updated)));
        break;  

      // =========================
      // 🧩 SECTIONS ASSISTANCE
      // =========================
      case UpdateSection(:final section, :final data):

        late RapportCelluleRequestSectionAssistanceState updated;

        switch (section) {
          case SectionType.nomBaptiserStatic:
            updated = state.copyWith(nomBaptiserStatic: data);
            break;

          case SectionType.nouveauBaptiser:
            updated = state.copyWith(nouveauBaptiser: data);
            break;

          case SectionType.inviter:
            updated = state.copyWith(inviter: data);
            break;

          case SectionType.formation:
            updated = state.copyWith(formation: data);
            break;

          case SectionType.sectionVisite:
            updated = state.copyWith(sectionVisite: data);
            break;

          case SectionType.sectionActivite:
            updated = state.copyWith(sectionActivite: data);
            break;

          case SectionType.sectionOuvrier:
            updated = state.copyWith(sectionOuvrier: data);
            break;

          case SectionType.autres:
            updated = state.copyWith(autres: data);
            break;
        }

        emit(updated.copyWith(
          status: FormzSubmissionStatus.initial,
          isValide: _validate(updated),
        ));
        break;

      // =========================
      // 🔥 SUBMIT
      // =========================
      case SubmitRapportCelluleRequestSectionAssistanceEvent():

       emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

        final response = await sendRapportCelluleStepStatUsercase.call(
        RequestRapportCelluleAssistance(
          nombreBaptiser: state.nombreBaptiser.value,
          nomBaptiserStat:  state.nomBaptiserStatic.map((e) => e.toJson())
            .toList() ,
          nouveauBaptiserStat: state.nouveauBaptiser.map((e) => e.toJson())
            .toList() ,
          inviterStat: state.inviter!.map((e) => e.toJson())
            .toList() ,
          formationStat: state.formation.map((e) => e.toJson())
            .toList() ,
          sectionVisite: state.sectionVisite.map((e) => e.toJson())
            .toList() ,
          sectionActivite: state.sectionActivite.map((e) => e.toJson())
            .toList() ,
          sectionOuvrier: state.sectionOuvrier.map((e) => e.toJson())
            .toList() ,
          autres: state.autres.map((e) => e.toJson())
            .toList() ,
          formAssistanceIsSubmit:  'Success',
          formAssistanceSubmitDate: DateTime.now().toIso8601String(),
          id: state.id.value,
        )
          
        );

        emit(response.fold(
          (failure) => state.copyWith(status: FormzSubmissionStatus.failure),
          (success) => state.copyWith(status: FormzSubmissionStatus.success),
        ));
        

      

        break;
    }
  }

  // =========================
  // 🔍 VALIDATION
  // =========================
  bool _validate(
      RapportCelluleRequestSectionAssistanceState s) {
    return Formz.validate([
      s.nombreBaptiser,
      s.id,
    ]);
  }
}


abstract class RapportCelluleSectionAssistanceEvent {}

class ChangeNombreBaptiser
    extends RapportCelluleSectionAssistanceEvent {
  final String value;
  ChangeNombreBaptiser(this.value);
}

class UpdateSection
    extends RapportCelluleSectionAssistanceEvent {
  final SectionType section;
  final List <RequestHumaneSectionAssistance> data;

  UpdateSection({
    required this.section,
    required this.data,
  });
}

class SubmitForm
    extends RapportCelluleSectionAssistanceEvent {}



  enum SectionType {
  nomBaptiserStatic,
  nouveauBaptiser,
  inviter,
  formation,
  sectionVisite,
  sectionActivite,
  sectionOuvrier,
  autres,
}